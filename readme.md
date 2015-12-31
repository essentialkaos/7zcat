### 7zcat

`7zcat` is simple utility for uncompressing 7z files and writing uncompressed data to standart output.

#### Usage

```
Usage: 7zcat options file...

Options

  --password, -p pass      Use password for unpacking archives
  --help, -h               Show this help message
  --version, -v            Show information about version

Examples

  7zcat file.7z
  Show content of file.7z

  7zcat -p test1234 protected-file.7z
  Show content of password protected file

```

#### Build Status

| Repository | Status |
|------------|--------|
| Stable | [![Build Status](https://travis-ci.org/essentialkaos/7zcat.svg?branch=master)](https://travis-ci.org/essentialkaos/7zcat) |
| Unstable | [![Build Status](https://travis-ci.org/essentialkaos/7zcat.svg?branch=develop)](https://travis-ci.org/essentialkaos/7zcat) |

#### License

[EKOL](https://essentialkaos.com/ekol)
