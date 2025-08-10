~~~
filesystem
  collect-config
  collect-file
  delete-broken-links
  delete-empty-files
  fig
  find-leaf-directories
  find-recently-changed
  full-path
  group
  is-empty-directory
  late-write
  list-broken-symlinks
  mount-home
  mvup
  path-directories
  path-permissions
  search
  searchl
  splice
other
  clip
  git-log
  nargs
  nargsp
  repl
  repl-stdin
  restart-on-end
  with-dialog-and-delay
text
  comma-to-newline
  comma-to-space
  compress-newlines
  compress-spaces
  file-lines-set-operations
  generate-password
  lines-filter
  lines-reject
  lowercase
  newline-to-comma
  newline-to-space
  space-to-newline
time
  day-seconds
  hms-time
  iso-date
  iso-week-number
  posixtime
  posixtime-to-date
  tzdate
  year-week-count

convert
  binary
  freemind2indent
  hex
  indent2freemind
  sxml2xml
  xml2sxml
filesystem
  clone-disk
  create-filelist
  delete-duplicate-files
  fig-full
  file-size-sum
  find-by-md5sum
  format-encrypt
  get-unique-path
  gui-group
  hardlink-to-copy
  list-file-size
  merge-files
  move-and-link
  name-add-date
  prefix-sort
  prepend-date
  prepend-media-bitrate
  prepend-to-filename
  remove-extension
  rename-lowercase
  set-permissions
  splice-if-single
  tidyfiles
media
  aac2wav
  audio-file-loudness
  get-audio-disc-files
  get-photos
  media-info-json
  media-info-video-bitrate
  normalize-volume
  pdf2images
  prepend-image-size
  prepend-video-tags
  remove-video-tags
  sacd2dsf
  scale-images
  show-video-thumbnails-image
  split-flac-cue
  stereoscopy
    create-anaglyph-image
    gopro3-stereo-merge
    merge-stereo-images
    merge-stereo-videos
    split-stereo-images
    split-stereo-video
  video-extract-audio
  video-extract-frames
  video-from-png-images
  video-thumbnails-image
  video-thumbnails-images
  wav32-to-flac
  youtube-dl-with-date
other
  backup
  backup-disk
  cpioc
  cpioe
  dimensions-to-volume
  dwm-show-info
  e
  emacs-open-in-background
  first
  g
  git-create-stable-branch
  git-log-short
  git-merge-stable-master
  git-push
  git-stati
  golden-ratio
  gui-emacs
  gui-md5sum
  gui-scale-images
  hide-stderr
  http-status
  ldd-list-not-found
  man-echo
  mariadb-create-user-database-sql
  nargs-all
  rest
  show-process-memory-usage-top
  silver-ratio
  ssh-install-key
  statistics
  take-screenshot
  take-screenshots-in-intervals
  take-screenshot-window
programming
  astyle-to-file
  c-format
  coffee-compile
  coffee-compile-from-to
  compress-js
  guile-display-documentation
  guile-module-dependencies
  javascript-remove-semicolons
  json-to-file
  lines-to-quoted-comma-lines
  lines-to-scheme-data
  scm-format
  sql-format
  wisp2lisp
  xml-format
text
  add-text-length-dividers
  alternate-text-direction
  body
  camelcase-to-dash
  camelcase-to-underscore
  decapitalize
  drop-long-lines
  first-space-to-semicolon
  itpn
    itpn-filter
    itpn-from-markdown
    itpn-parse
    itpn-tags
    itpn-to-markdown
  lines-append
  lines-enclose
  quote-text-files
  randomize-lines
  remove-hash-comment-lines
  remove-iso-date-prefix-zeros
  remove-semicolon-comment-lines
  replace-string
  split-select
  string-base16
  string-base32
  string-binary
  sum-numbers
  uniq-chars
time
  d
  hms-to-ks
  hms-to-minutes
  hours-and-minutes-till-midnight
  ks-time
  ks-to-hms
  uptime-duration-ks
  uptime-start-ks
~~~

# general
scripts in `1` are considered to be more generally useful.

see also [sph-utils](https://github.com/sph-mn/sph-utils).

## dependencies
posix shell, coreutils, ruby (when it gets more complex).

additional dependencies where required, for example ffmpeg for media-related tasks.

## installation
assuming that "$HOME/exe" is listed in the $PATH environment variable (which it is not by default), you can use the following to symlink all scripts into the path (uses the gnu version of cp):
~~~
cd sph-script
cp -st $HOME/exe $PWD/{1,2}/*/*
~~~

you can add paths to the $PATH environment variable for example in "/etc/profile" like this:
~~~
export PATH="$PATH:$HOME/exe"
~~~

which would mean that you can put scripts in a directory named "exe" in your home directory and they should be found as commands on the command-line.

# documentation
* hms-time: display current time as "hh:mm:ss".
* day-seconds: display seconds elapsed in the current day utc+0.
* posixtime: display current unix timestamp.
* posixtime-to-date: convert unix timestamp to "yyyy-m-d hh:mm:ss".
* tzdate
  * show date and time for all time zones matching string; all listed by default.
  * arguments: string
* iso-date: display current iso date "yyyy-mm-dd".
* iso-week-number: display current iso week number.
* lines-reject: inverse of lines-filter: keep lines where none of the strings match.
* lines-filter
  * filter stdin lines by strings or regexps; default case-insensitive.
  * arguments: [options ...] string ...
  * options
    * -a  all strings must match, the default
    * -o  any string must match
    * -n  no string must match
* comma-to-newline: replace commas with newlines on stdin.
* lowercase: map stdin to lowercase.
* newline-to-comma: convert newline-delimited items on stdin to comma-separated.
* compress-newlines: compress multiple consecutive newlines on stdin.
* newline-to-space: convert newline-delimited items on stdin to space-separated.
* file-lines-set-operations
  * set operations over file lines by file: union, intersection, difference, complement.
  * writes result lines to stdout.
  * options:
    * -u  union
    * -i  intersection
    * -d  difference
    * -c  complement
* compress-spaces: collapse runs of spaces on stdin to single spaces.
* repl-stdin
  * like repl but writes the entered line to the standard input of command.
  * arguments: command argument ...
  * examples: "repl-stdin wc -c"
* nargsp
  * parallel variant of nargs: execute command concurrently per stdin line.
  * waits for the first process to finish every $core_count to limit load.
* repl
  * read-eval loop: repeatedly run a fixed command, appending each input line as arguments.
  * supports basic line editing.
  * arguments: command argument ...
  * exit: ctrl+d or ctrl+c (sigint).
  * examples: "repl find -name"
* nargs
  * For each newline-delimited line from stdin, execute: command line.
  * example: find . | nargs echo the argument is:
* with-dialog-and-delay
  * prompt y/n and, only after entering y, delay 5 seconds and execute the given command.
  * arguments: command ...
* restart-on-end
  * restart command with a short delay after it exits. command is best specified with -- after this programs options. restart-on-end [options] -- command ...
  * arguments: [-n max_restart_times|-d delay_seconds] command ...
  * example: restart-on-end -n 3 -- echo
  * other possible names for this command: call-n-times, repeat
* path-permissions
  * display filesystem permissions for all directories above the current or given one.
  * ideal for debugging permission issues.
  * arguments: path ...
  * example output:
    * 700 /srv/http/test
    * 700 /srv/http
    * 700 /srv
  * alternative tool: namei -m
* fig
  * recursively in ".", list relative paths where the path itself contains all input strings.
  * arguments: [lines-filter-option ...] string ...
* collect-config
  * this script moves given paths to another central directoriy,
  * for example a versioning repository, and then links the files back to the original place.
  * it uses hardlinks if possible, symlinks if necessary.
* path-directories
  * lists all parent directories.
  * arguments: path ...
  * example output
    * /srv/http/test
    * /srv/http
    * /srv
* full-path
  * display the full path that starts from the root directory for a given path.
  * arguments: path ...
* late-write
  * write to file only after all data from standard input has been read.
  * allows to overwrite source files when using shell output redirection.
  * careful: output file must be given as an argument, since "> file" pre-emptively truncates.
  * example: cat file | grep -v xyz | late-write file
* mount-home
  * mount filesystems to $HOME/mnt/{basename_or_label} with auto-created, predictable paths.
  * arguments: [options] source ...
  * options:
    * -s  use sudo
    * -l  treat sources as disk labels
* collect-file
  * symlinks, hardlinks or copies files into an automatically chosen target directory.
  * example use case: browsing files with a file manager and using right-click actions to collect.
* find-recently-changed
  * :: path/find-arguments
  * find files under directory ordered by descending modification time.
  * all find arguments that can come before -printf are supported.
  * depends on shell, find, sort and cut
* mvup
  * usage: [-n integer] file ...
  * move given files into their parent directories unless a file with the same name already exists there.
  * if the "-n" option for the count of parent directories to skip is given, it must be the first argument.
* delete-empty-files
  * arguments: path ...
  * works on the current directory if no path was given.
* splice
  * merge directory contents with its parent directory.
  * automatically renames duplicates.
* delete-broken-links
  * arguments: path ...
  * works on the current directory if no path was given.
* list-broken-symlinks: list broken symlinks in the current directory.
* search
  * recursively in ".", output "path" for each file containing at least one line containing all input strings.
  * arguments: string ...
  * depends on ripgrep.
* searchl
  * recursively in ".", output "path: line" for each line containing all input strings.
  * arguments: string ...
  * depends on ripgrep.
* group
  * move files into target directory.
  * the directory is created if it does not exist.
  * arguments: target file ...
* camelcase-to-dash: convert camelcase identifiers to dash-separated.
* string-binary: show bit representation of stdin bytes; base16/base32 variants exist.
* replace-string
  * just replace strings in files. only shows changes unless -g was given as the first argument.
  * no regexp nonsense - escapes do not have to be considered.
* split-select
  * arguments: delimiter column ...
  * split each line at delimiter character and only display selected parts.
  * column can be an integer or a range. examples: 1..3, ..2, 1..
  * selected parts are displayed separated by spaces.
* add-text-length-dividers: add --- dividers on a single line before every n chars
* body: print the nth line or a range of lines from start inclusively to end exclusively.
* sum-numbers: read newline separated numbers from standard input and display the sum.
* randomize-lines: shuffle stdin lines.
* itpn-to-markdown: convert indented itpn packets (validated/canonical form) to markdown
* emacs-open-in-background
  * open new files in emacs without opening a window.
  * useful for searching and adding files in one terminal and editing in an open emacs window in another terminal.
* hide-stderr
  * drops what is written on standard error.
  * usage: command arguments ...
* rest: displays all but the first argument
* backup
  * usage: config [type] [tar/tarsnap-option ...]
  * example: backup2 text tarsnap
  * features:
  * * create local tgz or remote tarsnap archive
  * * read file paths from executable config file that writes file paths to standard output
  * * automatically add current datetime to archive name
* nargs-all: pass all newline-delimited stdin tokens as one argument vector to a single command invocation.
* statistics
  * displays a variety of statistics for the newline separated values read from standard input.
  * mean, median, standard deviation, minimum, maximum, and more.
* dimensions-to-volume: parse numbers from command line arguments and sum.
* man-echo: display a man page as plaintext.
* first: displays only the first argument
* take-screenshots-in-intervals
  * takes a screenshot of the currently focused window every n seconds
  * and saves it in a directory.
  * usage: take-screenshots-in-intervals [interval destination_dir]
  * dependencies: scrot
* g
  * short alias for grep for case-insentitive expressions.
  * usage: g expression ...
* hex: encode stdin bytes as hexadecimal octets separated by spaces.
* prepend-date
  * prepends date to the filename unless it already exists.
  * path -> dirname/yyyy-mm-dd.basename
* get-unique-path: print a non-existing path variant by appending numeric suffixes.
* rename-lowercase
  * rename files to lowercase; overwrites existing paths.
  * arguments: path ...
* file-size-sum: sum the byte size of files at paths read from standard input.
* fig-full: like fig but displays full paths
* splice-if-single: merge any directory with the current one if it contains only one entry.
* create-filelist
  * create a file /tmp/custom-name with a disk size/available/usage-percent header and
  * a complete list of files of the current directory.
  * can be used to index backup harddrives and mounts.
  * depends on iso-date, df and find.
  * arguments: custom-name
* video-extract-audio: Script to extract the first audio streams from video files without quality loss.
* scale-images
  * example: scale-image 300 test/file.jpg
  * example: find | xargs scale-image 300
* show-video-thumbnails-image: display a preview image consisting of thumbnails of the video at equally spaced times.
* prepend-video-tags
  * prepend a video quality and duration score to filenames.
  * if option -p was given, prepend "{height}p{fps}." to video filenames.
  * call without arguments for more options.
  * video quality estimation: https://sph.mn/computer/designs/video-quality-score.html
* video-thumbnails-image
  * creates images with thumbnails as a preview of video contents.
  * it generates an image for each given file path or all files in given directory paths.
  * depends on ffmpeg and https://gitlab.com/movie_thumbnailer/mtn
  * usage: output_directory video_path ...
* remove-video-tags
  * remove tags previously prepended by prepend-video-tags.
  * arguments: [options] path ...
  * options
    * --dry-run
* get-photos
  * mount filesystem then search for image and video files and move them into an automatically created directory.
  * prepends the current date to file names and lowercases the file names (this also changes .JPG to .jpg).
  * example: get-photos /dev/sdb1
* sacd2dsf: extract stereo .dsf dsd files from an sacd iso image file.
* get-audio-disc-files
  * rip audio cd tracks to wav in "." or a specified directory.
  * depends on "cdparanoia".
* wav32-to-flac: convert a 32 bit pcm wave file to flac.
* prepend-image-size
  * prepend "{height}." to png/jpg filenames.
  * depends on imagemagick.
* gopro3-stereo-merge
  * create a side-by-side image or video from files made with the gopro hero3+ dual hero system sync cable.
  * assumes that the two cameras were positioned unrotated side by side, which is unlike the default dual hero system configuration. this requires rotation of the left image.
  * accepts left and right files in any order and assumes that the file names have the automatically assigned 3D_L and 3D_R prefixes.
  * usage: path1 path2
* merge-stereo-videos
  * combine two videos into one side-by-side video.
  * note that re-encoding is unfortunately necessary with this configuration.
* split-stereo-video: split a left-right video into two videos. some image degradation seems unavoidable because of necessary re-encoding of the resulting parts
* merge-stereo-images: combine two images into one side-by-side image.

# extended documentation
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

## mount-home
* mount filesystems to automatically chosen paths under ~/mnt
* mount filesystems to $HOME/mnt/{last-part-of-source}

## examples
$ mount-home /dev/sdd1

mounts the filesystem to /home/username/mnt/dev/sdd1

$ mount-home -s -l label1 label2

mounts with sudo and by partition label

## benefits
* paths are automatically chosen
* paths are automatically created
* paths are predictable
* mount multiple sources in one call

## command-line interface
mount filesystems to $HOME/mnt/{source_basename_or_label}
benefits: mount paths are automatically chosen, mount paths are predictable, and multiple sources can be mounted in one call.
