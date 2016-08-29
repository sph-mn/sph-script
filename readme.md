see [sph-script](http://sph.mn/content/1467).

```
1
├── filesystem
│   ├── collect-file
│   ├── delete-broken-links
│   ├── delete-if-empty
│   ├── fig
│   ├── full-path
│   ├── get-unique-path
│   ├── late-write
│   ├── ls-broken-symlinks
│   ├── merge-files
│   ├── mount-home
│   ├── mount-sshfs-home
│   ├── move-and-link
│   ├── move-into-directory
│   ├── path-directories
│   ├── path-permissions
│   ├── rename-lowercase
│   ├── search
│   ├── searchl
│   ├── set-permissions
│   ├── splice
│   └── tidyfiles
├── other
│   ├── backup
│   ├── g
│   ├── git-log
│   ├── golden-ratio
│   ├── http-status
│   ├── scm-format
│   ├── uptime-start-ks
│   └── video-extract-audio
├── text
│   ├── comma-to-newline
│   ├── compress-whitespace-columns
│   ├── itpn
│   ├── lines-filter
│   ├── lines-reject
│   ├── lowercase
│   ├── newline-to-comma
│   ├── newline-to-space
│   ├── remove-double-newlines
│   ├── remove-hash-comment-lines
│   ├── space-to-newline
│   └── tabular-select
└── time
    ├── d
    ├── day-ks
    ├── iso-date-week-number
    ├── ks2trad
    ├── trad2ks
    ├── tt
    ├── tzdate
    ├── uptime-duration-ks
    ├── uptime-start-ks
    └── year-week-count
2
├── convert
│   ├── freemind2indent
│   ├── indent2freemind
│   ├── sxml2xml
│   └── xml2sxml
├── filesystem
│   ├── clean-filenames
│   ├── delete-duplicate-files
│   ├── display-relative-path-up
│   ├── file-size-sum
│   ├── format-encrypt
│   ├── gui-move-into-directory
│   ├── hardlink-to-copy
│   ├── lf
│   ├── mkdir-wrap
│   ├── name
│   ├── name-add-date
│   └── prepend-to-filename
├── other
│   ├── binary
│   ├── cpioc
│   ├── cpioe
│   ├── create-presentation
│   ├── dwm-show-time
│   ├── e
│   ├── get-audio-disc-files
│   ├── git-create-stable-branch
│   ├── git-merge-stable-master
│   ├── git-push
│   ├── git-stati
│   ├── gui-emacs
│   ├── gui-md5sum
│   ├── guile-all
│   ├── hex
│   ├── ldd-list-not-found
│   ├── mariadb-create-user-database
│   ├── posixtime
│   ├── repeated-screenshots
│   ├── repeated-screenshots-video
│   ├── sakura-start
│   ├── scale
│   ├── screenshot
│   ├── screenshot-full
│   ├── show-process-memory-usage-top
│   ├── split-flac-cue
│   ├── ssh-install-key
│   ├── take-website-screenshot
│   ├── times2ks
│   └── trad2s
├── programming
│   ├── astyle-to-file
│   ├── coffee-compile
│   ├── coffee-compile-from-to
│   ├── compress-js
│   ├── javascript-format
│   ├── javascript-format-add-function-spacing
│   ├── javascript-remove-semicolons
│   ├── json-to-file
│   ├── lines-to-scheme-data
│   ├── scm-doc
│   ├── sql-format
│   ├── xml-format
│   └── xml-json-converter
├── text
│   ├── alternate-text-direction
│   ├── camelcase-to-dashes
│   ├── decapitalise
│   ├── file-lines-intersection
│   ├── ls-file-size
│   ├── nargs
│   ├── nl-list2comma-string-list
│   ├── randomise-lines
│   ├── remove-iso-date-prefix-zeros
│   └── string-bits
└── time-display
    └── dt
```

you might use the following to symlink the scripts to a path that is listed in the $PATH environment variable:
```
cp -st $HOME/.exe sph-script/*/*/*
```
