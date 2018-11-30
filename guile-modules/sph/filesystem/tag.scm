(library (sph filesystem tag)
  (export
    tag-add
    tag-default-config
    tag-group
    tag-group-from-search
    tag-name->tags-and-extensions&
    tag-remove
    tag-replace
    tag-sort)
  (import
    (guile)
    (rnrs sorting)
    (sph)
    (sph alist)
    (sph filesystem)
    (sph io)
    (sph list)
    (sph other)
    (sph string)
    (only (srfi srfi-1) remove))

  (define (read-mime-types path)
    "string -> list:((string:type-name string:extension ...) ...)
     read a mime.types file into a list. path is for example /etc/mime.types"
    (call-with-input-file path
      (l (file)
        (port-lines-fold
          (l (line r)
            (if (string-prefix? "#" line) r
              (let
                ( (name+extensions
                    (string-split (regexp-replace (regexp-replace line "\t" " ") " +" " ") #\space)))
                (pair (delete "" name+extensions) r))))
          (list) file))))

  (define* (get-mime-extensions #:optional (path "/etc/mime.types"))
    "[string] -> (string ...)
     get all filename extensions from \"/etc/mime.types\""
    (delete-duplicates
      (fold (l (a r) (if (null? a) r (let ((t (tail a))) (append t r)))) (list)
        (read-mime-types path))))

  (define get-mime-extensions-cached (procedure->cached-procedure get-mime-extensions))

  (define-as tag-default-config alist-q
    extensions (get-mime-extensions-cached) delimiter #\. ignore-extensions? #f)

  (define* (tag-name->tags-and-extensions& a c #:key (config tag-default-config))
    (let
      ( (extensions (alist-ref-q config extensions))
        (words (string-split a (alist-ref-q config delimiter))))
      (consecutive (l (a) (contains? extensions a)) (reverse words)
        (l (extensions tags) (c (reverse tags) (reverse extensions))))))

  (define* (tag-create-name tags extensions #:key (config tag-default-config))
    (string-append (string-join tags (string (alist-ref-q config delimiter)))
      (string-join extensions "." (q prefix))))

  (define (prepare-tags& a c) (let (a (remove string-null? a)) (if (not (null? a)) (c a))))

  (define (prepare-tags-each-path& tags paths c)
    (prepare-tags& tags (l (tags-new) (each (l (path) (c tags-new path)) paths))))

  (define* (tag-add tags paths #:key (config tag-default-config))
    (prepare-tags-each-path& tags paths
      (l (tags-new path)
        (let (name-old (basename path))
          (tag-name->tags-and-extensions& name-old
            (l (tags-old extensions)
              (let
                (name-new (tag-create-name (union tags-old tags-new) extensions #:config config))
                (if (not (string-equal? name-old name-new))
                  (rename-file path (make-path-unique (string-append (dirname path) "/" name-new)))))))))))

  (define (not-null? a) (not (null? a)))

  (define* (tag-remove tags paths #:key (config tag-default-config))
    (prepare-tags-each-path& tags paths
      (l (tags path)
        (let (name-old (basename path))
          (tag-name->tags-and-extensions& name-old
            (l (tags-old extensions)
              (if (not-null? tags-old)
                (let*
                  ( (tags (complement tags-old tags))
                    (tags (if (null? tags) (list (first tags-old)) tags)))
                  (let (name-new (tag-create-name tags extensions #:config config))
                    (if (not (string-equal? name-old name-new))
                      (rename-file path
                        (make-path-unique (string-append (dirname path) "/" name-new)))))))))))))

  (define (tag-sort-tags a) (delete-duplicates-sorted (list-sort string< a)))

  (define* (tag-replace tags-replace tags-replacement paths #:key (config tag-default-config))
    (prepare-tags-each-path& tags-replacement paths
      (l (tags-replacement path)
        (let (name-old (basename path))
          (tag-name->tags-and-extensions& name-old
            (l (tags-old extensions)
              (let
                (name-new
                  (tag-create-name (union (complement tags-old tags-replace) tags-replacement)
                    extensions #:config config))
                (if (not (string-equal? name-old name-new))
                  (rename-file path (make-path-unique (string-append (dirname path) "/" name-new)))))))))))

  (define* (tag-sort paths #:key (config tag-default-config))
    (each
      (l (path)
        (let (name-old (basename path))
          (tag-name->tags-and-extensions& name-old
            (l (tags-old extensions)
              (let (tags-new (tag-sort-tags tags-old))
                (if (not-null? tags-new)
                  (let (name-new (tag-create-name tags-new extensions #:config config))
                    (if (not (string-equal? name-old name-new))
                      (rename-file path
                        (make-path-unique (string-append (dirname path) "/" name-new)))))))))))
      paths)))
