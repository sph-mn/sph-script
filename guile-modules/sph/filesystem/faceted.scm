(library (sph filesystem faceted)
  (export
    file-name-facet-add
    file-name-facet-remove
    file-name-facets-sort)
  (import
    (sph common))

  (define (dot-string-append a facets)
    (facets->dot-string (list-set-union (dot-string->facets a) facets)))

  (define (dot-string-remove a facets)
    (facets->dot-string (complement (dot-string->facets a) facets)))

  (define (dot-string->facets a) (string-split a #\.))
  (define (facets->dot-string a) (string-join a "."))

  (define (file-name-facet-add facets paths)
    (let (facets (remove string-null? facets))
      (if (not (null? facets))
        (each
          (l (path)
            (let*
              ((file-name (basename path)) (file-name-new (dot-string-append file-name facets)))
              (if (not (string-equal? file-name-new file-name))
                (rename-file path
                  (get-unique-target-path (string-append (dirname path) "/" file-name-new))))))
          paths))))

  (define (file-name-facet-remove facets paths)
    (let (facets (remove string-null? facets))
      (if (not (null? facets))
        (each
          (l (path)
            (if (file-exists? path)
              (let*
                ((file-name (basename path)) (file-name-new (dot-string-remove file-name facets)))
                (if (not (or (string-null? file-name-new) (string-equal? file-name-new file-name)))
                  (rename-file path
                    (get-unique-target-path (string-append (dirname path) "/" file-name-new)))))
              #f))
          paths))))

  (define (file-name-facets-sort paths)
    (each
      (l (path)
        (let*
          ( (file-name (basename path))
            (file-name-new
              (facets->dot-string
                (delete-duplicates-sorted (list-sort string< (dot-string->facets file-name))))))
          (if (not (string-equal? file-name-new file-name))
            (rename-file path
              (get-unique-target-path (string-append (dirname path) "/" file-name-new))))))
      paths)))
