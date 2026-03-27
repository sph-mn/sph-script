# backup-disk
`backup-disk` synchronizes directories from available source paths to available targets located on mounted disks identified by UUIDs.
It reads JSON configuration files from `~/.config/backup-disk/`.
Each configuration describes one or more disks and the directories to mirror.
Only existing sources and mounted targets are processed; missing paths are skipped silently.

## Command-line interface
```
backup-disk [options] [name...]
```

### Options
* `--run`
  Execute actual synchronization. Without this flag, operations run in dry-run mode (no changes made).
* `--trigger`
  Run udev and block device rescan (`udevadm trigger` and `blkid`) only, then exit.
* `--help`
  Show usage information and list available configurations.

### Arguments
* `[name...]`
  One or more configuration file names (without `.json` extension).
  If omitted, all `.json` files in `~/.config/backup-disk/` are used.

## Behavior summary
* Each configuration is a JSON array of groups.
* Each group contains:
  * `uuids`: list of disk UUIDs the group applies to.
  * `entries`: list of source-target mapping objects.
* For every group:
  * For every UUID that is currently mounted, each entry is evaluated.
  * For each entry:
    * If `source` exists and the `target` path is resolvable, rsync is invoked.
    * Exclusion and inclusion patterns are applied if specified.

## Minimal configuration
```json
[
  {
    "uuids": ["123e4567-e89b-12d3-a456-426614174000"],
    "entries": [
      {
        "source": "/home/user/documents",
        "target": "mirror/documents"
      }
    ]
  }
]
```
This mirrors `/home/user/documents` to `mirror/documents` on the mounted disk with the specified UUID.

## Full configuration example
```json
[
  {
    "uuids": [
      "11111111-1111-1111-1111-111111111111",
      "22222222-2222-2222-2222-222222222222"
    ],
    "entries": [
      {
        "source": "/home/user/photos",
        "target": "backups/photos",
        "includes": ["albums", "events"],
        "include_filter": ["^important/.*"],
        "excludes": [
          "temp",
          ".cache",
          "drafts"
        ],
        "exclude_filter": [
          "\\.thumbnails/.*"
        ]
      },
      {
        "source": "/home/user/projects",
        "target": "backups/projects"
      },
      {
        "source": "/var/data",
        "target": "backups/system/data"
      }
    ]
  }
]
```

### Notes
* Regex filters are JSON strings that will be compiled as `RegExp` objects.
* Target paths not starting with `/` are interpreted relative to the mount point of the disk.
* Logs and detailed rsync output go to standard output and standard error.
