# pack
Compose and remove file layers by filename suffix.
## Overview
`pack` applies and removes three layers:
* archive (`.tar`)
* compression (`.zst`)
* encryption (`.e`)

Layers are added in this order:
```
archive -> compression -> encryption
```
and removed in reverse.
## Usage
```
pack add [-c] [-e] source...
pack remove source
```
Options:
* `-c` add compression
* `-e` add encryption

## Add
Applies layers to input paths.

Archive is added automatically when:
* more than one source is given
* the source is a directory

### Examples
```
pack add -e file.txt
# -> file.txt.e
```
```
pack add -c -e file.txt
# -> file.txt.zst.e
```
```
pack add -e dir
# -> dir.tar.e
```
```
pack add -e a b c
# -> a.tar.e
```
## Remove
Removes layers based on filename suffixes.

Output is derived from the stem name:
* archive -> directory
* otherwise -> file

### Examples
```
pack remove file.txt.e
# -> file.txt
```
```
pack remove file.txt.zst.e
# -> file.txt
```
```
pack remove dir.tar.zst.e
# -> dir/
```
## Requirements
* tar
* zstd
* scrypt
