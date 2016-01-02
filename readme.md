### 7zcat

`7zcat` is simple utility for uncompressing 7z files and writing uncompressed data to standart output.

#### Installation

###### From ESSENTIAL KAOS Public repo for RHEL6/CentOS6

```
yum install -y http://release.yum.kaos.io/i386/kaos-repo-6.8-0.el6.noarch.rpm
yum install 7zcat
```

###### Using install.sh

We provide simple bash script `script.sh` for installing app from the sources.

```
... 7zip

git clone https://github.com/essentialkaos/7zcat.git
cd 7zcat
git checkout v1.1.0

./install.sh
```

If you have some issues with installing, try to use script in debug mode:

```
./install.sh --debug
```

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
