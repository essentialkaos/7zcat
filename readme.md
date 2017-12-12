## `7zcat` [![Build Status](https://travis-ci.org/essentialkaos/7zcat.svg?branch=master)](https://travis-ci.org/essentialkaos/7zcat) [![License](https://gh.kaos.io/ekol.svg)](https://essentialkaos.com/ekol)

`7zcat` is simple utility for uncompressing 7z files and writing uncompressed data to standart output.

### Installation

#### From ESSENTIAL KAOS Public repo for RHEL6/CentOS6

```
[sudo] yum install -y https://yum.kaos.io/6/release/x86_64/kaos-repo-8.0-0.el6.noarch.rpm
[sudo] yum install 7zcat
```

#### From ESSENTIAL KAOS Public repo for RHEL7/CentOS7

```
[sudo] yum install -y https://yum.kaos.io/7/release/x86_64/kaos-repo-8.0-0.el7.noarch.rpm
[sudo] yum install 7zcat
```

#### Using `install.sh`

We provide simple bash script `install.sh` for installing app from the sources.

```
... install 7zip

git clone https://github.com/essentialkaos/7zcat.git
cd 7zcat

sudo ./install.sh
```

If you have some issues with installing, try to use script in debug mode:

```
sudo ./install.sh --debug
```

### Usage

```
Usage: 7zcat {options} file...

Options

  --password, -p password    Use password for unpacking archives
  --no-color, -nc            Disable colors in output
  --help, -h                 Show this help message
  --version, -v              Show information about version

Examples

  7zcat file.7z
  Show content of file.7z

  7zcat -p test1234 protected-file.7z
  Show content of password protected file

```

### Build Status

| Branch | Status |
|--------|--------|
| `master` | [![Build Status](https://travis-ci.org/essentialkaos/7zcat.svg?branch=master)](https://travis-ci.org/essentialkaos/7zcat) |
| `develop` | [![Build Status](https://travis-ci.org/essentialkaos/7zcat.svg?branch=develop)](https://travis-ci.org/essentialkaos/7zcat) |

### License

[EKOL](https://essentialkaos.com/ekol)

<p align="center"><a href="https://essentialkaos.com"><img src="https://gh.kaos.io/ekgh.svg"/></a></p>
