## permission-sheet-to-shell
Compile access control sheets to POSIX shell scripts.

The program reads JSON-formatted permission sheets from standard input and writes a shell script to standard output. The generated script applies ownership and permission policies using standard system tools.

## Usage
```
cat sheets/* | permission-sheet-to-shell > ensure-permissions
chmod +x ensure-permissions
./ensure-permissions
```
Input is read from standard input. Output is written to standard output.

No command-line options are required.

## Input format
Input is JSON, interpreted as an implicit array:
```
[ <stdin contents> ]
```
This allows multiple rule fragments to be concatenated via standard input.

Each top-level element must be a rule.

## Rule structure
A rule is an array:
```
[ selector, declaration?, nested_rule... ]
```
* `selector`: string or list of strings
* `declaration`: object (optional)
* `nested_rule`: zero or more rules

## Selectors
Selectors define paths.
### Forms
* Absolute path:
  ```
  "/a/b"
  ```
* Relative path (combined with parent selector):
  ```
  "c"
  ```
* Glob:
  ```
  "d/*"
  ```
* Selector list:
  ```
  ["e", "f/*"]
  ```

### Composition
Nested selectors are joined with their parent:
```
[
  "/a",
  {},
  ["b", {}]
]
```
produces:
```
/a/b
```
Absolute selectors override parent context:
```
[
  "/a",
  {},
  ["/x", {}]
]
```
produces:
```
/x
```

## Declarations
Declarations are objects describing access control properties.
### Keys
* `owner`: string
* `group`: string
* `permissions`: string
* `file_permissions`: string
* `directory_permissions`: string
* `recursive`: boolean

## Permissions
Permissions use symbolic notation:
* `"r"` read
* `"w"` write
* `"x"` execute

Combined per user, group, other:
```
"rw,r,r"
```
Missing parts are treated as empty.
### Directory normalization
If a directory has read permission, execute is added automatically.

Examples:

| Input      | Files | Directories |
| ---------- | ----- | ----------- |
| `"r"`      | 400   | 500         |
| `"rw"`     | 600   | 700         |
| `"rw,r,r"` | 644   | 755         |

## Recursive rules
```
{ "recursive": true }
```
Applies a rule to a path and all descendants.

Recursive traversal is implemented in shell and does not rely on `find`.

## Nested rules
Rules may contain nested rules:
```
[
  "/a",
  { "recursive": true },
  ["b", { "permissions": "r" }]
]
```
This compiles to:
* `/a` (recursive)
* `/a/b`

Nested rules inherit and extend the parent selector.

## Example
```
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
```

## Output
The generated script:
* is POSIX shell
* defines helper functions for applying ownership and permissions
* uses shell globbing for selector expansion
* uses recursive traversal implemented in shell functions
* uses `chown` and `chmod` internally

## Properties
* declarative input
* deterministic output
* no runtime dependency on Node.js
* no external libraries required at execution time

The generated script can be stored, reviewed, and executed independently.
