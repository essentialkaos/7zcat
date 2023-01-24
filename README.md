<p align="center"><a href="#readme"><img src="https://gh.kaos.st/7zcat.svg"/></a></p>

<p align="center">
  <a href="https://kaos.sh/w/7zcat/ci"><img src="https://kaos.sh/w/7zcat/ci.svg" alt="GitHub Actions CI Status" /></a>
  <a href="#license"><img src="https://gh.kaos.st/apache2.svg"></a>
</p>

<p align="center"><a href="#installation">Installation</a> • <a href="#usage">Usage</a> • <a href="#build-status">Build Status</a> • <a href="#license">License</a></p>

<br/>

`7zcat` is simple utility for uncompressing 7z files and writing uncompressed data to standart output.

### Installation

#### From [ESSENTIAL KAOS Public Repository](https://yum.kaos.st)

```bash
sudo yum install -y https://yum.kaos.st/kaos-repo-latest.el$(grep 'CPE_NAME' /etc/os-release | tr -d '"' | cut -d':' -f5).noarch.rpm
sudo yum install 7zcat
```

#### From GitHub repository

```bash
curl -fL# -o cain https://kaos.sh/7zcat/SOURCES/7zcat
chmod +x 7zcat
sudo mv 7zcat /usr/bin/
```

Also, you can use the latest version of utility without installation:

```bash
bash <(curl -fsSL https://kaos.sh/7zcat/SOURCES/7zcat) # pass options and arguments here
```

### Usage

```
Usage: 7zcat {options} file…

Options

  --password, -p password    Use password for unpacking archives
  --fast, -F                 Use all CPUs for unpacking data
  --no-color, -nc            Disable colors in output
  --help, -h                 Show this help message
  --version, -v              Show information about version

Examples

  7zcat file.7z
  Show content of file.7z

  7zcat -p test1234 protected-file.7z
  Show content of password protected file

  7zcat file.7z | grep error
  Filter content of file.7z
```

### Build Status

| Branch | Status |
|--------|--------|
| `master` | [![CI](https://kaos.sh/w/7zcat/ci.svg?branch=master)](https://kaos.sh/w/7zcat/ci?query=branch:master) |
| `develop` | [![CI](https://kaos.sh/w/7zcat/ci.svg?branch=master)](https://kaos.sh/w/7zcat/ci?query=branch:develop) |

### License

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)

<p align="center"><a href="https://essentialkaos.com"><img src="https://gh.kaos.st/ekgh.svg"/></a></p>
