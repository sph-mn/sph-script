# sph-script
a collection of various scripts.

scripts in `1` are the highlights which and considered more generally useful.

see also [sph-utils](https://github.com/sph-mn/sph-utils).

## dependencies
posix shell, coreutils, and node.js only when it gets more complex.

additional dependencies where required, for example ffmpeg for media-related tasks.

## installation
pick and download scripts, and optionally make them available as commands by saving them in a file that is listed in `$PATH` and adding the execute bit (`chmod +x <file>`).

for example, one could create a directory "$HOME/exe", add it to `$PATH` in `/etc/profile` or similar, and symlink scripts from the cloned repository into the directory.

# list of scripts
## 1
filesystem:
collect-config, delete-broken-links, fig, find-recently-changed, group, late-write, mount-home, path-directories, search, splice, collect-file, delete-empty-files, find-leaf-directories, full-path, is-empty-directory, list-broken-symlinks, mvup, path-permissions, searchl

git:
git-log

other:
backup-disk, clip, nargs, nargsp, repl, repl-stdin, restart-on-end, with-dialog-and-delay

text:
comma-to-newline, comma-to-space, compress-newlines, compress-spaces, file-lines-set-operations, generate-password, lowercase, newline-to-comma, newline-to-space, space-to-newline

time:
day-seconds, hms-time, iso-date, iso-week-number, posixtime, posixtime-to-date, tzdate, year-week-count

## 2
convert:
binary, freemind2indent, hex, indent2freemind, sxml2xml, xml2sxml

filesystem:
clone-disk, delete-duplicate-files, file-size-sum, format-encrypt, gui-group, list-file-size, move-and-link, pack, prefix-sort, prepend-media-bitrate, remove-extension, set-permissions, tidyfiles
create-filelist, fig-full, find-by-md5sum, get-unique-path, hardlink-to-copy, merge-files, name-add-date, permission-sheet-to-shell, prepend-date, prepend-to-filename, rename-lowercase, splice-if-single

git:
git-changes, git-log-commit, git-log-diff, git-log-file, git-log-short, git-push, git-status

media:
aac2wav, get-photos, normalize-volume, prepend-video-tags, scale-images, stereoscopy, video-from-png-images, wav32-to-flac
audio-file-loudness, media-info-json, pdf2images, remove-video-tags, show-video-thumbnails-image, video-extract-audio, video-thumbnails-image, youtube-dl-with-date
get-audio-disc-files, media-info-video-bitrate, prepend-image-size, sacd2dsf, split-flac-cue, video-extract-frames, video-thumbnails-images

other:
backup, dimensions-to-volume, first, gui-emacs, hide-stderr, man-echo, rest, ssh-install-key, take-screenshots-in-intervals
cpioc, e, g, gui-md5sum, http-status, mariadb-create-user-database-sql, show-process-memory-usage-top, statistics, take-screenshot-window
cpioe, emacs-open-in-background, golden-ratio, gui-scale-images, ldd-list-not-found, nargs-all, silver-ratio, take-screenshot

programming:
astyle-to-file, coffee-compile, compress-js, guile-module-dependencies, json-to-file, lines-to-scheme-data, sql-format, xml-format
c-format, coffee-compile-from-to, guile-display-documentation, javascript-remove-semicolons, lines-to-quoted-comma-lines, scm-format, wisp2lisp, xml-json-converter

text:
add-text-length-dividers, camelcase-to-dash, drop-long-lines, lines-append, randomize-lines, remove-semicolon-comment-lines, string-base16, sum-numbers
alternate-text-direction, camelcase-to-underscore, first-space-to-semicolon, lines-enclose, remove-hash-comment-lines, replace-string, string-base32, uniq-chars
body, decapitalize, itpn, quote-text-files, remove-iso-date-prefix-zeros, split-select, string-binary

time:
d, hms-to-ks, hms-to-minutes, hours-and-minutes-till-midnight, ks-to-hms

# documentation, 1
* tzdate
  * show date and time for all time zones matching string; all listed by default.
  * arguments: string
* hms-time: display current time as "hh:mm:ss".
* day-seconds: display seconds elapsed in the current day utc+0.
* posixtime: display current unix timestamp.
* posixtime-to-date: convert unix timestamp to "yyyy-m-d hh:mm:ss".
* iso-date: display current iso date "yyyy-mm-dd".
* iso-week-number: display current iso week number.
* comma-to-newline: replace commas with newlines on stdin.
* lowercase: map stdin to lowercase.
* newline-to-comma: convert newline-delimited items on stdin to comma-separated.
* compress-newlines: compress multiple consecutive newlines on stdin.
* newline-to-space: convert newline-delimited items on stdin to space-separated.
* compress-spaces: collapse runs of spaces on stdin to single spaces.
* file-lines-set-operations
  * set operations over file lines by file: union, intersection, difference, complement.
  * writes result lines to stdout.
  * options:
    * -u union
    * -i intersection
    * -d difference
    * -c complement
* repl-stdin
  * like repl but writes the entered line to the standard input of command.
  * arguments: command argument ...
* nargsp
  * parallel variant of nargs: execute command concurrently per stdin line.
* repl
  * read-eval loop: repeatedly run a fixed command, appending each input line as arguments.
  * arguments: command argument ...
* nargs
  * for each newline-delimited line from stdin, execute: command line.
* with-dialog-and-delay
  * prompt y/n and delay execution.
  * arguments: command ...
* restart-on-end
  * restart command after exit.
  * arguments: \[-n max_restart_times|-d delay_seconds] command ...
* path-permissions: display filesystem permissions for directory chain.
* collect-config: move paths to central directory and link back.
* path-directories: list parent directories.
* full-path: display absolute path.
* late-write: defer writing until stdin is fully read.
* mount-home: mount filesystems to $HOME/mnt/...
* collect-file: collect files via links or copies.
* find-recently-changed: list files ordered by modification time.
* mvup: move files to parent directories.
* delete-empty-files: delete empty files.
* splice: merge directory contents with parent.
* delete-broken-links: delete broken symlinks.
* list-broken-symlinks: list broken symlinks.
* search: recursive search returning paths.
* searchl: recursive search returning lines.
* group: move files into directory.

## mount-home
* mount filesystems to automatically chosen paths under ~/mnt
* mount filesystems to $HOME/mnt/{last-part-of-source}

### examples
~~~
$ mount-home /dev/sdd1
~~~
mounts the filesystem to /home/username/mnt/dev/sdd1

~~~
$ mount-home -s -l label1 label2
~~~
mounts with sudo and by partition label

### benefits
* paths are automatically chosen
* paths are automatically created
* paths are predictable
* mount multiple sources in one call

### command-line interface
mount filesystems to $HOME/mnt/{source_basename_or_label}
benefits: mount paths are automatically chosen, mount paths are predictable, and multiple sources can be mounted in one call.

## with-dialog-and-delay
show a yes/no dialog on the command-line and only execute command when the answer is yes.
can be used to wrap highly consequential system commands, to prevent them from being executed accidentally.

usage: with-dialog-and-delay command ...

## example
$ with-dialog-and-delay echo test
~~~
are you sure? [y/N]
waiting 5 seconds...
command execution started
test
~~~

# documentation, 2
* camelcase-to-dash: convert camelcase identifiers to dash-separated.
* string-binary: show bit representation of stdin bytes.
* replace-string: replace strings in files.
* split-select: split lines and select columns.
* add-text-length-dividers: add dividers every n characters.
* body: print selected line ranges.
* sum-numbers: sum newline-separated numbers.
* randomize-lines: shuffle stdin lines.
* itpn-to-markdown: convert itpn packets to markdown
* emacs-open-in-background: open files in emacs without window.
* hide-stderr: suppress stderr.
* rest: display all but first argument
* backup: create local or remote archives.
* nargs-all: pass all stdin tokens as one argument vector
* statistics: compute statistics over stdin values.
* dimensions-to-volume: parse and sum numeric arguments
* man-echo: display man page as plaintext
* first: display first argument
* take-screenshots-in-intervals: periodic screenshots
* g: case-insensitive grep alias
* hex: encode stdin as hexadecimal
* prepend-date: prepend date to filenames
* get-unique-path: generate non-existing path
* rename-lowercase: rename files to lowercase
* file-size-sum: sum file sizes
* fig-full: fig with full paths
* splice-if-single: merge single-entry directories
* create-filelist: generate indexed file list
* video-extract-audio: extract audio streams
* scale-images: resize images
* show-video-thumbnails-image: preview thumbnails
* prepend-video-tags: add metadata to filenames
* video-thumbnails-image: generate thumbnail images
* remove-video-tags: remove metadata tags
* get-photos: collect media files from mounted devices
* sacd2dsf: extract dsf from sacd iso
* get-audio-disc-files: rip audio cds
* wav32-to-flac: convert wav to flac
* prepend-image-size: add image dimensions to filenames
* gopro3-stereo-merge: merge stereo media
* merge-stereo-videos: combine videos side-by-side
* split-stereo-video: split stereo video
* merge-stereo-images: combine images side-by-side

## permission-sheet-to-shell
define filesystem permissions in a json file with css-like logic.
permission-sheet-to-shell will compile this json file to a shell script that ensures the permissions are set accordingly whenever the script is run.

example sheet:
~~~
[
  "/root",
  {
    "owner": "root",
    "group": "root",
    "recursive": true,
    "file_permissions": "rw",
    "directory_permissions": "rwx"
  },
  [
    "exe/*",
    { "permissions": "rwx" }
  ]
],
[
  "/srv/http",
  {
    "owner": "nonroot",
    "group": "http",
    "recursive": true
  }
]
~~~

see [other/doc/permission-sheets.md](other/doc/permission-sheets.md)

## backup-disk
define rsync filters and destination uuids in configuration files.
run `backup-disk <configuration_file_name>` to sync to currently mounted target partitions.
`backup-disk` syncs all configurations.

see [other/doc/backup-disk.md](other/doc/backup-disk.md)

## git-log
a compact "git log" format

~~~
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
~~~

## generate-password
generate random ascii or unicode passwords of custom length.

~~~
arguments: length [type]
~~~

examples:
~~~
generate-password unicode 8
->
🏊飨跻콭螯嗲і쫒
~~~

~~~
generate-password ascii 18
->
)xRqK&N0x:Le$POC
~~~

## pack
pack is a command-line tool to compress and encrypt files or directories using simple options. It also reverses these operations automatically based on the files extension, restoring the original content.

see [other/doc/pack.md](other/doc/pack.md)

## Examples
### add
```
pack add -e file.txt
->
file.txt.e
```
```
pack add -c -e dir
->
dir.tar.zst.e
```
### remove
```
pack remove file.txt.e
->
file.txt
```
```
pack remove dir.tar.zst.e
->
dir/
```

# c-replacer
`c-replacer` performs structural rewriting of C source files.

It operates on top-level units such as functions or type definitions, not on arbitrary text fragments. Input is partitioned into units, matched against replacement instructions, and selectively rewritten.

The goal is deterministic, machine-oriented transformation of C code without partial edits or ambiguous matches.
## Model
The program enforces three constraints:
* input is split into top-level units starting at column 0
* replacements apply only to entire units
* separators are explicit and not part of content

Units are separated by:
```

---

```
This separator is structural and never included in output units.
## Usage
Pipe a source file into the program:
```
cat input.c | c-replacer
```
or:
```
c-replacer < input.c
```
The program reads from stdin and writes the transformed result to stdout.
## Input structure
The input consists of two regions:
* instruction area
* content area

These are separated by the same unit separator:
```

---

```
The instruction area defines replacement operations.
The content area contains the C code to transform.
## Requirements
* top-level units must start at column 0
* no indentation before unit definitions
* separators must match exactly `\n\n---\n\n`

Deviation from these constraints leads to undefined behavior.
