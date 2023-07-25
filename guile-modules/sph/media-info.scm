(define-module (sph media-info))

(use-modules (json parser) (sph)
  (sph alist) (sph filesystem)
  (sph hashtable) (sph io)
  (sph list) (sph number) (sph other) (sph process) (sph string) (sph vector))

(export media-info media-info-video)

(define sph-media-info-description
  "analyse media files and get information like resolution and bitrate.
   depends on ffmpeg")

(define (media-info path)
  (hash-map->list pair
    (json-string->scm
      (string-trim-right
        (execute->string "ffprobe" "-v" "quiet" "-print_format" "json" "-show_format" path)))))

(define (hash-table->alist a)
  (hash-map->list
    (l (key value) (pair key (if (hash-table? value) (hash-table->alist value) value))) a))

(define (json-result->list a)
  (if (hash-table? a) (hash-map->list (l (key value) (pair key (json-result->list value))) a)
    (if (list? a) (map json-result->list a) a)))

(define (media-info-video path)
  (let
    (data
      (json-result->list
        (json-string->scm
          (string-trim-right
            (execute->string "ffprobe" "-v" "quiet" "-print_format" "json" "-show_streams" path)))))
    (and data (not (null? data))
      (first
        (filter (l (a) (string-equal? "video" (alist-ref a "codec_type")))
          (vector->list (alist-ref data "streams")))))))
