<p align="center"><a href="#readme"><img src="https://gh.kaos.st/7zcat.svg"/></a></p>

<p align="center">
  <a href="https://travis-ci.com/essentialkaos/7zcat"><img src="https://travis-ci.com/essentialkaos/7zcat.svg"></a>
  <a href="https://essentialkaos.com/ekol"><img src="https://gh.kaos.st/ekol.svg"></a>
</p>

<p align="center"><a href="#installation">Installation</a> • <a href="#usage">Usage</a> • <a href="#build-status">Build Status</a> • <a href="#license">License</a></p>

<br/>

`7zcat` is simple utility for uncompressing 7z files and writing uncompressed data to standart output.

### Installation

#### From ESSENTIAL KAOS Public repo for RHEL6/CentOS6

```
[sudo] yum install -y https://yum.kaos.st/6/release/x86_64/kaos-repo-9.1-0.el6.noarch.rpm
[sudo] yum install 7zcat
```

#### From ESSENTIAL KAOS Public repo for RHEL7/CentOS7

```
[sudo] yum install -y https://yum.kaos.st/7/release/x86_64/kaos-repo-9.1-0.el7.noarch.rpm
[sudo] yum install 7zcat
```

#### Using `install.sh`

We provide simple bash script `install.sh` for installing app from the sources.

```bash
# install 7zip

git clone https://github.com/essentialkaos/7zcat.git
cd 7zcat

sudo ./install.sh
```

If you have some issues with installing, try to use script in debug mode:

```
sudo ./install.sh --debug
```

#### Using `curl`/`wget`

```bash
wget https://kaos.sh/7zcat/SOURCES/7zcat
# or
curl -o 7zcat -L https://kaos.sh/7zcat/SOURCES/7zcat

chmod +x 7zcat
[sudo] mv 7zcat /usr/bin/
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
| `master` | [![Build Status](https://travis-ci.com/essentialkaos/7zcat.svg?branch=master)](https://travis-ci.com/essentialkaos/7zcat) |
| `develop` | [![Build Status](https://travis-ci.com/essentialkaos/7zcat.svg?branch=develop)](https://travis-ci.com/essentialkaos/7zcat) |

### License

[EKOL](https://essentialkaos.com/ekol)

<p align="center"><a href="https://essentialkaos.com"><img src="https://gh.kaos.st/ekgh.svg"/></a></p>
