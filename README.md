<p align="center">
  <a href="" rel="noopener">
 <img width=200px height=200px src="icons/favicon.png" alt="Project logo"></a>
</p>

<h3 align="center">Ubuntu based distro setup</h3>

<div align="center">

  <img src="https://img.shields.io/badge/status-active-success.svg" alt="status tag">
  <a href="https://github.com/CryptoSingh1337/Ubuntu-Setup-Scripts/issues"><img src="https://img.shields.io/github/issues/CryptoSingh1337/Ubuntu-Setup-Scripts" alt="issue tag"></a>
  <a href="https://github.com/CryptoSingh1337/Ubuntu-Setup-Scripts/pulls"><img src="https://img.shields.io/github/issues-pr/CryptoSingh1337/Ubuntu-Setup-Scripts" alt="pr tag"></a>
  <a href="/LINCENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="license tag"></a>

</div>

---

<p align="center"> This project contains all the scripts that will setup all the required packages and environment variables on any ubuntu based distro. These scripts reduces the time which is taken in setup the distro.
    <br> 
</p>

## 📝 Table of Contents

- [About](#about)
- [Getting Started](#getting_started)

## 🧐 About <a name = "about"></a>

This project solves the problem of installing packages and setting up environment on a new installed ubuntu based distro which takes lots of time and for somebody it might take much longer to research about different packages which are good or not. It includes many scripts which are responsible for insatlling packages, setting up environment variables, installing snap packages like IDEs etc, creating startup services for undervolting Intel i-series CPUs, performing some tweaks to improve overall performance.

## 🏁 Getting Started <a name = "getting_started"></a>

These instructions will get you a copy of the project up and running on your system for installing packages and performing some performance tweaks.

### Scripts

- **auto-package-installation** - This script will install all the package which are mentioned in packages.txt or it will fetch all the packages from [gist](https://gist.githubusercontent.com/CryptoSingh1337/d45723380f1e997d1955e983e3fde03b/raw/f30a2e692c2ac4487e5051e6e31209ee1eedf0cd/recommended-ubuntu-packages.txt).

- **undervolt** - This script will undervolt the intel i-series CPUs using undervolt package and will create auto start script which will undervolt the CPU on startup.

- **theme-installation** - This script will install the complete theme for XFCE and GNOME desktop environment.

### Prerequisites

Download the [ubuntu-automation-scripts.zip](#)

### Run the scripts

First you should add the execute permission to the scripts.

```
chmod +x auto-package-installation.sh
```

and then execute the script.

```
sudo ./auto-package-installation.sh
```
