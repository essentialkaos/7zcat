<p align="center"><a href="#readme"><img src=".github/images/card.svg"/></a></p>

<p align="center">
  <a href="https://kaos.sh/w/7zcat/ci"><img src="https://kaos.sh/w/7zcat/ci.svg" alt="GitHub Actions CI Status" /></a>
  <a href="#license"><img src=".github/images/license.svg"></a>
</p>

<p align="center"><a href="#installation">Installation</a> • <a href="#usage">Usage</a> • <a href="#ci-status">CI Status</a> • <a href="#license">License</a></p>

<br/>

`7zcat` is simple utility for uncompressing 7z files and writing uncompressed data to standard output.

### Installation

#### From [ESSENTIAL KAOS Public Repository](https://kaos.sh/kaos-repo)

```bash
sudo yum install -y https://pkgs.kaos.st/kaos-repo-latest.el$(grep 'CPE_NAME' /etc/os-release | tr -d '"' | cut -d':' -f5).noarch.rpm
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

#### Using Makefile and Git

```bash
git clone https://kaos.sh/7zcat.git
cd 7zcat
sudo make install
```

### Usage

<img src=".github/images/usage.svg" />

### CI Status

| Branch | Status |
|--------|--------|
| `master` | [![CI](https://kaos.sh/w/7zcat/ci.svg?branch=master)](https://kaos.sh/w/7zcat/ci?query=branch:master) |
| `develop` | [![CI](https://kaos.sh/w/7zcat/ci.svg?branch=master)](https://kaos.sh/w/7zcat/ci?query=branch:develop) |

### License

[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0)

<p align="center"><a href="https://essentialkaos.com"><img src="https://gh.kaos.st/ekgh.svg"/></a></p>
