```
1
├── filesystem
│   ├── collect-file
│   ├── delete-broken-links
│   ├── delete-if-empty
│   ├── fig
│   ├── find-leaf-directories
│   ├── find-recently-changed
│   ├── full-path
│   ├── group
│   ├── late-write
│   ├── list-broken-symlinks
│   ├── mount-home
│   ├── mount-sshfs-home
│   ├── search
│   ├── searchl
│   ├── splice
│   └── unique-path
├── other
│   ├── git-log
│   ├── git-log-short
│   ├── golden-ratio
│   ├── http-status
│   ├── nargs
│   ├── nargsp
│   ├── restart-on-end
│   ├── scm-format
│   ├── take-screenshots-in-intervals
│   └── with-dialog-and-delay
├── text
│   ├── comma-to-newline
│   ├── compress-whitespace-columns
│   ├── file-lines-set-operations
│   ├── itpn
│   ├── itpn-split
│   ├── lines-filter
│   ├── lines-reject
│   ├── lowercase
│   ├── newline-to-comma
│   ├── newline-to-space
│   ├── remove-double-newlines
│   ├── remove-hash-comment-lines
│   └── space-to-newline
└── time
    ├── day-seconds
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
    ├── uptime-start-ks
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
│   ├── clone-disk
│   ├── create-filelist
│   ├── delete-duplicate-files
│   ├── file-size-sum
│   ├── format-encrypt
│   ├── gui-group
│   ├── gui-tag-add
│   ├── gui-tag-remove
│   ├── hardlink-to-copy
│   ├── lf
│   ├── list-file-size
│   ├── merge-files
│   ├── mkdir-wrap
│   ├── move-and-link
│   ├── name-add-date
│   ├── parent-dir-references
│   ├── path-directories
│   ├── path-permissions
│   ├── prefix-sort
│   ├── prepend-media-bitrate
│   ├── prepend-to-filename
│   ├── rename-lowercase
│   ├── tag-add
│   ├── tag-remove
│   ├── tag-sort
│   └── tidyfiles
├── media
│   ├── media-info-json
│   ├── media-info-video
│   ├── media-info-video-bitrate
│   ├── media-info-video-framerate
│   └── media-info-video-resolution
├── other
│   ├── audio-file-loudness
│   ├── backup
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
│   ├── guile-all
│   ├── gui-md5sum
│   ├── gui-scale-images
│   ├── ldd-list-not-found
│   ├── mariadb-create-user-database-sql
│   ├── sakura-start
│   ├── scale-images
│   ├── scale-images-directory
│   ├── show-process-memory-usage-top
│   ├── split-flac-cue
│   ├── ssh-install-key
│   ├── take-screenshot
│   ├── take-screenshot-window
│   └── video-extract-audio
├── programming
│   ├── astyle-to-file
│   ├── c-format
│   ├── coffee-compile
│   ├── coffee-compile-from-to
│   ├── compress-js
│   ├── guile-module-dependencies
│   ├── javascript-format-add-function-spacing
│   ├── javascript-remove-semicolons
│   ├── json-to-file
│   ├── lines-to-quoted-comma-lines
│   ├── lines-to-scheme-data
│   ├── scm-list-documentation
│   ├── sph-module-dependencies
│   ├── sql-format
│   ├── xml-format
│   └── xml-json-converter
└── text
    ├── alternate-text-direction
    ├── camelcase-to-dash
    ├── camelcase-to-underscore
    ├── decapitalise
    ├── randomise-lines
    ├── remove-iso-date-prefix-zeros
    ├── string-bits
    └── tabular-select

11 directories, 141 files
```

additionally included are:
* other/take-website-screenshots
* other/xml-json-converter
* other/web-search

scripts in `1` are generally more useful and scripts in `2` are more experimental

# dependencies
varying, but primarily posix shell (/bin/sh) or guile and [sph-lib](https://github.com/sph-mn/sph-lib).
some scripts depend on other programs as noted in their description

# installation
assuming that "$HOME/.exe" is listed in the $PATH environment variable (which it is not by default), you can use the following to symlink all scripts into the path:
```
cd sph-script
cp -st $HOME/.exe $PWD/{1,2}/*/*
```

you can add paths to the $PATH environment variable for example in "/etc/profile" like this:
```
export PATH="$PATH:$HOME/.exe"
```

which would mean that you can put scripts under a hidden directory named ".exe" in your home directory and they should be found as commands on the command-line.

some programs depend on guile modules found in `sph-script/guile-modules`. to install these modules, the content of `sph-script/guile-modules` needs to be copied or symlinked into a directory that is in `$GUILE_LOAD_PATH` or any other guile load path.

# documentation
## filesystem
### collect-file
hardlinks or copies all given source-paths into an automatically chosen target directory. one use case is browsing files with a file manager and using right-click actions to collect specific files

### delete-broken-links
delete broken links in the current directory and sub-directories

### delete-if-empty
deletes empty files or directories, recursively. for example a directory structure with only empty files or with no files is deleted

### fig
find files containing all argument strings in the name. the name is a combination of find and grep

### full-path

display the full path that starts from the root directory for a given path

### unique-path
displays a filename that does not exist

* $ touch /tmp/t.scm
* $ unique-path /tmp/t.scm

```
/tmp/t.scm.1
```

* $ touch /tmp/t.scm.1
* $ unique-path /tmp/t.scm
```
/tmp/t.scm.2
```

### late-write
```
parameters
  options ... output-file
description
  write to output file only after all data from standard input has been read.
  allows to overwrite source files when using shell output redirection
options
  --help | -h
  --interface
```
#### example

```
cat testfile | newline-to-space | late-write testfile
```
testfile is not truncated but updated with the expected results.
be careful: do not use ">" out of habit. ">" *always* truncates, late-write only takes simple pipe input with "|"

### list-broken-symlinks
list broken symlinks in the current directory

### merge-files
merge files, automatically create a non-existing target filename from the source filenames and check if the result file size matches the summarised size of the source files

### mount-home
* mount filesystems to automatically chosen paths under ~/mnt
* mount filesystems to $HOME/mnt/{first-part-of-source-path/last-second-part.last-part/}
* maturity: medium-high

#### example
$ mount-home /dev/sdd1

mounts the filesystem to /home/username/mnt/dev/sdd1

#### benefits
* paths are automatically chosen
* paths are automatically created
* paths are predictable
* mount multiple sources in one call

#### command-line interface
$ mount-home --help
```
parameters
  options ... source-path ...
description
  mount filesystems to $HOME/mnt/{first-part-of-source-path/second-last-part.last-part}
options
  --about | -a
  --dry-run | -d
  --help | -h
  --interface
  --mount-options=value | -o value
  --sudo | -s
  --user=value | -u value
  --version | -v
```

### mount-sshfs-home
* mount remote filesystems using sshfs to predictable, automatically chosen paths in the home directory
* example: "mount-sshfs-home testserver" mounts the root of "testserver" to "$HOME/mnt/testserver"
* maturity: medium-high

#### command-line interface

$ mount-sshfs-home  --help
```
parameters
  options ... hostname sshfs-argument ...
description
  mount remote filesystems using sshfs to $HOME/mnt/{hostname}
options
  --about | -a
  --help | -h
  --interface
  --path=value | -p value
  --user=value | -u value
```

### move-and-link

```
parameters
  options ... target-directory source-path ...
description
  move files and replace the source paths with symlinks to the move destination
options
  --help | -h
  --interface
  --keep-directory-structure? | -k
```

### path-directories
displays parent directories

#### example
path-directories $PWD
```
/srv/http/test
/srv/http
/srv
```

### path-permissions
like "path-directories" but also displays permissions in octal notation

#### example
```
path-permissions $PWD
700 /srv/http/test
700 /srv/http
700 /srv
```

### rate rate-modify
move files into 1/2/3/n rating directories

### rename-lowercase
* renames file to have an all lowercase filename. overwrites any existing paths

* $ touch TEST TEST-2
* $ rename-lowercase TEST TEST-2
* $ ls
```
test test-2
```

### search
search for a string inside files in the current directory and display the names of files where it is included

#### benefits to "find | grep"
multiple search words can be specified which must all occur somewhere in a line
includes the grep arguments --dereference-recursive, --fixed-strings, --ignore-case, --files-with-matches

### searchl
search for a string inside files in the current directory and display the names of files and lines where it is included

### splice
* merge contents of a directory with the current directory
* considers duplicate filenames and automatically renames conflicts

### tidyfiles
automatically sort files into directories by file type

## text
### comma-to-newline

### compress-whitespace-columns
```
$ echo "this  is    a test" | compress-whitespace-columns
```
```
this is a test
```

### file-lines-set-operations
```
parameters
  options ... file-path ...
description
  applies set operations on the lines of multiple files and writes the result to standard output
options
  --complement | -c
  --difference | -d
  --help | -h
  --interface
  --intersection | -i
  --union | -u
```

### itpn
featureful itpn note taking format processor
$ itpn --help
```
parameters
  options ... file-paths ...
options
  --add-file-name-tags
  --count
  --deduplicate
  --exclude | -e
  --format=value  prefix/suffix/filename. comma-separated names of block parts to display. default: prefix,suffix
  --help | -h
  --interface
  --list-unique-tags
  --output-file-1=value  path for a file to write matches to
  --output-file-2=value  path for a file to write non-matches to
  --output-to-source  overwrite source files when output would otherwise be written to standard-output
  --replace-tag=value  value format: "tags-to-replace replacements" "tag[.tag] tag[.tag]"
  --replace-tags-from-file=value  takes a path to a file that contains lines in the format "tag replacement ..."
  --search=value | -s value  search in the prefix part of itpn packets. conditions like word,word.~word.word are
    supported, where comma is "or", period is "and" and tilde is "not"
  --search-all=value | -a value
  --search-suffix=value
  --sort-packets
  --sort-tags
  --split  split into matches and non-matches. output-file-1 receives matches, output-file-2 non-matches, and if
    any of those is not specified output is written to standard output
  --syntax-check | -c
```

### lines-filter
```
parameters
  options ... strings ...
description
  read from standard input and filter lines case-insensitively by given strings or regular expressions
options
  --and  matching lines must contain all strings. the default
  --case-sensitive | -c
  --help | -h
  --interface
  --negate
  --or  matching lines must contain any of the strings
  --regexp | -r  interpret strings as posix extended regular expressions
```

### lines-reject
like "lines-filter" but lists only the lines where none of the given strings matches

### lowercase
convert all uppercase characters in a string read from standard input to lowercase characters

$ echo TeEsT | lowercase
```
test
```

### newline-to-comma
like newline-to-space but converts to comma separated entries

$ ls / | newline-to-comma
```
bin, boot, dev, etc, home, lib, lib64, lost+found, mnt, opt, proc, root, run, sbin, srv, sys, tmp, usr, var
```

### newline-to-space
* converts newline separated lines to space separated entries
* maturity: low
* possible enhancements: quote results if they contain spaces

$ ls / | newline-to-space
```
bin boot dev etc home lib lib64 lost+found mnt opt proc root run sbin srv sys tmp usr var
```

### remove-double-newlines
$ cat textfile | remove-double-newlines

### remove-hash-comment-lines

### tabular-select
select whitespace separated columns of newline separated lines by index

## time
### day-seconds
display the current seconds of the day

### hms-time
display the current time in the format hh:mm:ss

### iso-date
display the current iso date
$ iso-date
```
2015-11-15
```

### iso-week-number
$ iso-week-number
```
46
```

### ks-time
show the current days elapsed kiloseconds

### ks-to-hms hms-to-ks
convert kiloseconds to traditional hh:[mm:ss] time and back

$ ks-to-hms 32
```
8:53:20
```
$ hms-to-ks 15
```
54
```
can also read text from standard input, where it replaces all occurrences of hh:mm[:ss] patterns with kilosecond values, optionally only in parentheses

### posixtime
### posixtime-to-date

### tzdate
show date and time in all filtered time zones. lists all timezone times when run without arguments

$ tzdate europe/a
```
Europe/Athens                      Wed 2015-11-18 21:50:27
Europe/Amsterdam                   Wed 2015-11-18 20:50:27
Europe/Andorra                     Wed 2015-11-18 20:50:27
```
$ tzdate us/a
```
US/Aleutian                        Wed 2015-11-18 09:51:39
US/Arizona                         Wed 2015-11-18 12:51:39
US/Alaska                          Wed 2015-11-18 10:51:39
```

### uptime-duration-ks
displays the kiloseconds that have elapsed since the system has booted

### uptime-start-ks
displays the day kiloseconds of when the system has been booted

### year-week-count
displays the number of weeks of the current week, the iso week date.
depends on ruby

$ year-week-count
```
53
```

## other
### git-log
a custom "git log" format

```
tantalum@online.de 2014-08-14 - c640774
M    sph/cli.scm
M    sph/lang/scm-format.scm
M    sph/lang/scm-format/format.scm

tantalum@online.de 2014-08-15 cli: proper required argument checking for patterns and an extended missing arguments exception.
  system-reader: simplified reader. lang-scm-format: fixes for some known issues a184459
M    sph/cli.scm
M    sph/lang/scm-format.scm
M    sph/list.scm
M    sph/system/reader.scm
M    test/general/cli.scm
M    test/general/list.scm

tantalum@online.de 2014-08-15 - f472c3f
M    sph/cli.scm
```

### golden-ratio
displays a list of numbers in the golden-ratio above and below the input number
```
199.005 199.00502493123727
122.992 122.99186934331752
76.013 76.01315559640044
46.979 46.97871375215843
29.034 29.03444184748134
17.944 17.944271906679102
11.09 11.090169942039552
6.854 6.8541019654042525
4.236 4.23606797710791
2.618 2.6180339885884316
1.618 1.6180339887

0.618 0.618033988768953
0.382 0.3819660112736623
0.236 0.2360679775216284
0.146 0.14589803376831154
0.09 0.09016994376337698
0.056 0.05572809001115205
0.034 0.03444185375606755
0.021 0.021286236257459373
0.013 0.013155617500075927
0.008 0.008130618758290567
0.005 0.00502499874234599
```

### http-status
display the http-status code for an url

### scm-format
format scheme code
depends on sph-lib

### take-screenshots-in-intervals
creates a screenshot every n seconds and saves it in a configured directory.
depends on scrot

### with-dialog-and-delay
usage: with-dialog-and-delay command ...

#### example
$ with-dialog-and-delay echo test
```
are you sure? [y/N]
waiting 5 seconds...
command execution started
test
```

example use case: preventing accidental execution of poweroff, reboot or other system shutdown commands

# 2, more experimental, less useful scripts
## convert
### binary
$ echo test | binary
```
1110100 1100101 1110011 1110100 1010
```

### freemind2indent
create an indented tree from the freemind .mm format

### hex
$ echo test | hex
```
74 65 73 74 a
```

### indent2freemind
create a freemind .mm mind-map file from an indented tree

* sxml2xml
* xml2sxml

## filesystem
### clean-filenames
an example script for removing/replacing strings in all filenames of the current directory and sub-directories

### delete-duplicate-files
delete duplicate files in the current directory and sub-directories.
depends on "duff".
note: there are cases where duplicates are required for something to work like in VIDEO_TS and AUDIO_TS directories from a dvd

### display-relative-path-up
### file-size-sum
displays the sum of content-bits of files from newline separated paths read from standard-input

### format-encrypt
an example-script to setup an encrypted device for use with luks.
better regard this as just an example. the commands used in it could completely destroy your filesystem if used incorrectly

### gui-tag-add
like "tag-add" but uses a graphical dialog for entering new words

### gui-tag-remove
like "tag-remove" but uses a graphical dialog for entering new words

### lf
lists files in the current directory whose names include the given strings, sorted and colored by size

### tag-add :: name[.name ...] target-file ...
the dot-separated words will be appended to all files given as arguments.
no duplicates are added

### tag-remove :: name[.name ...] target-file ...
the dot-separated words will be removed from all files given as arguments.
the last name can not be removed

### tag-sort :: target-file ...
sorts the strings alphabetically in all files given as arguments.
prepend-to-filename

## programming
### coffee-compile
uses "coffee" to compile coffeescript read from standard input

### compress-js
uses "uglifyjs" to compress javascript

### javascript-format
format javascript source code.
can be called from emacs to have a powerful auto formatter.
depends on "uglifyjs"

### javascript-format-add-function-spacing
### javascript-remove-semicolons
### lines-to-scheme-data
### scm-doc

## text
### alternate-text-direction
* reverses text direction for every even line
* considers punctuation
* this way text can be read from left to right and right to left alternatingly, avoiding the need to look back to the left like a typewriter when reaching the end of a line

### camelcase-to-dashes
$ echo camelCaseString | camelcase-to-dashes
```
camel-case-string
```

### decapitalise
remove capitalisation from words read on standard-input

### file-lines-intersection
### ls-file-size
### nargs nargsp

* pass each newline separated line read from standard-input as an argument to a command
* depends on "xargs"
* the same as "xargs -n 1 -d \n"
* "nargsp" distributes command calls to available cpus minus one if the number of cpus is greater than one

### randomise-lines
randomises the order of lines read from standard input
$ cat testfile | randomise-lines
```
test-3
test-2
test-4
test-1
```

### remove-iso-date-prefix-zeros
maturity: low
$ echo 2015-05-03 | remove-iso-date-prefix-zeros
```
2015-5-3
```

### string-bits
displays the bits a string read from standard input is encoded in
```
echo abc |string-bits
1100001110001011000111010
```

## time-display
### dt
display the current time like this: 2015-11-15:69.18

where the last part are the elapsed kiloseconds of the current day

## other
### cpioc
create a cpio archive by reading paths from standard-input

### cpioe
extract a cpio archive in the current directory

### create-video-from-png-images
* create-video-from-png-images :: path-directory [skip-resize?]
* creates a video from a directory filled with png files
* if skip-resize? is "true", then it is assumed that the resize-pass has already run and resized pictures are available in the $source/edit directory. this speeds up the compilation process significantly

### dwm-show-time
### e
pass all arguments to the program of the $EDITOR environment variable

### g
short alias for grep

### get-audio-disc-files
read files from an audio disc and save them in the flac format.
depends on "cdparanoia"

### git-push
do not care about commit-messages, commit all changes with "-" as the commit-message and push

### git-stati
execute "git status" for every directory in the current directory

### gui-md5sum
display the md5sums of one or multiple files given as arguments in a graphical dialog window.
depends on "zenity"

### guile-all
execute all argument-paths with guile

### mariadb-create-user-database-sql
* mariadb-create-user-database-sql :: database [username password]
* create the sql to create a database in mariadb and a user that has all privileges on the database.
* username and password are optional. if username is ommited it is set to the database name.
* if password is ommitted it is set to the username.

### posixtime
display the current posixtime

### scale-images
* scale :: width
* scales all png or jpg images in a directory. a new directory "edit" is created where result images are put
* depends on "graphicsmagick"

### take-screenshot
* create a screenshot of all monitors in a configured directory
* depends on "scrot"

### take-screenshot-window
* create a screenshot of the currently focused window in a configured directory, with the filename being the posixtime at creation
* depends on "scrot"

### show-process-memory-usage-top
* lists the 10 active processes which currently use the most memory
* the first part is the size of the used memory in mebibits, the second the process id

```
1398 9105 firefox
308 877 emacs --daemon
300 914 /usr/bin/mpd --no-daemon
291 867 /usr/bin/Xorg.bin -nolisten tcp :0 -auth /tmp/serverauth.vqZ57dCRUR vt1
199 6121 sakura
177 1416 sakura
176 6957 sakura
114 4355 /usr/lib/polkit-1/polkitd --no-debug
108 9149 /usr/bin/guile /home/nonroot/.exec/show-process-memory-usage-top
66 4352 /usr/lib/upower/upowerd
```

### split-flac-cue
* split-flac-cue :: path-file-cue path-file-flac
* split a flac file corresponding to a cue file
* depends on "shnsplit" from "shntool"

### ssh-install-key
* ssh-install-key :: full-key-name remote-host-uri
* install an ssh public key on the remote server

### take-website-screenshot
* create a screenshot of a website
* usage: ./exe/take-website-screenshot url output-filename
* this script lies under other/take-website-screenshots
* it depends on nodejs and requires "npm install" to have been executed in the other/take-website-screenshots directory

# possible enhancements
* make as many scripts as possible depend only on shell and gnu/coreutils
