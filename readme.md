for further information see [sph-script](http://sph.mn/content/1467).

```
1
├── filesystem
│   ├── collect-file
│   ├── delete-broken-links
│   ├── delete-if-empty
│   ├── fig
│   ├── find-leaf-directories
│   ├── full-path
│   ├── get-unique-path
│   ├── late-write
│   ├── list-broken-symlinks
│   ├── merge-files
│   ├── mount-home
│   ├── mount-sshfs-home
│   ├── move-and-link
│   ├── move-into-directory
│   ├── path-directories
│   ├── path-permissions
│   ├── prefix-sort
│   ├── rename-lowercase
│   ├── search
│   ├── searchl
│   ├── splice
│   └── tidyfiles
├── other
│   ├── backup
│   ├── git-log
│   ├── golden-ratio
│   ├── http-status
│   ├── nargs
│   ├── nargsp
│   ├── restart-on-end
│   ├── scm-format
│   ├── uptime-start-ks
│   ├── video-extract-audio
│   └── with-dialog-and-delay
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
    ├── hms-time
    ├── hms-to-ks
    ├── iso-date
    ├── iso-week-number
    ├── ks-time
    ├── ks-to-hms
    ├── posixtime
    ├── posixtime-to-date
    ├── tzdate
    ├── uptime-duration-ks
    └── year-week-count
2
├── convert
│   ├── binary
│   ├── freemind2indent
│   ├── hex
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
│   ├── list-file-size
│   ├── mkdir-wrap
│   ├── name
│   ├── name-add-date
│   └── prepend-to-filename
├── other
│   ├── cpioc
│   ├── cpioe
│   ├── create-remarkjs-presentation
│   ├── create-video-from-png-images
│   ├── e
│   ├── g
│   ├── get-audio-disc-files
│   ├── git-create-stable-branch
│   ├── git-merge-stable-master
│   ├── git-push
│   ├── git-stati
│   ├── gui-emacs
│   ├── gui-md5sum
│   ├── guile-all
│   ├── ldd-list-not-found
│   ├── mariadb-create-user-database-sql
│   ├── sakura-start
│   ├── scale-images
│   ├── show-process-memory-usage-top
│   ├── split-flac-cue
│   ├── ssh-install-key
│   ├── take-screenshot
│   ├── take-screenshot-window
│   ├── take-screenshots-in-intervalls
│   └── take-website-screenshot
├── programming
│   ├── astyle-to-file
│   ├── c-format
│   ├── coffee-compile
│   ├── coffee-compile-from-to
│   ├── compress-js
│   ├── javascript-format
│   ├── javascript-format-add-function-spacing
│   ├── javascript-remove-semicolons
│   ├── json-to-file
│   ├── lines-to-quoted-comma-lines
│   ├── lines-to-scheme-data
│   ├── scm-doc
│   ├── sql-format
│   ├── xml-format
│   └── xml-json-converter
└── text
    ├── alternate-text-direction
    ├── camelcase-to-dash
    ├── camelcase-to-underscore
    ├── decapitalise
    ├── file-lines-intersection
    ├── randomise-lines
    ├── remove-iso-date-prefix-zeros
    └── string-bits

12 directories, 120 files
```

you could use the following to symlink all scripts to a path that is listed in the $PATH environment variable:
```
cd sph-script
cp -st $HOME/.exe $PWD/{1,2}/*/*
```

"$HOME/.exe" is not in $PATH by default, but you can add it for example to a file named "/etc/profile" like this:
```
export PATH="$PATH:$HOME/.exe"
```
