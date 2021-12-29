# yasli

<p align="center">
<a href="https://asciinema.org/a/2fPuaxRFuRH7MekwV8vKFKQDF"><img alt="Example of running" src="https://user-images.githubusercontent.com/9802715/146839432-fc9d8eee-a2bd-469e-b53e-52bcd5133617.gif" width="70%"></a>
</p>

<p align="center">
<img src="https://badgen.net/badge/license/MIT/blue?label=License&icon=https%3A%2F%2Fapi.iconify.design%2Focticon%2Flaw-16.svg%3Fcolor%3Dwhite">
<img src="https://github.com/agronskiy/yasli/actions/workflows/ubuntu-test.yml/badge.svg">
<img src="https://github.com/agronskiy/yasli/actions/workflows/macos-test.yml/badge.svg">
<br/>
<a href="https://github.com/agronskiy/dotfiles"><img src="https://badgen.net/badge/Used%20by/agronskiy%2Fdotfiles/orange"></a>
</p>

## About
YASLI (in Russian, "yasli", "ясли", means "crib" or "nursery" - something from where the new life is bootstrapped) – **Y**et **A**nother **S**imple **L**inker and **I**nstaller for your dotfiles and/or tools environment.

As software engineers, we set up our terminal tooling and dotfiles in new environments - every now and then. This simple yet ready-to-use boilerplate, called "Yasli", automates the two main points a typical terminal user performs to set up a new machine:
- Links config files from a given source (e.g. your repository) into `$HOME`. Linking is non-invasive: if something is already there, it can be chosen to stay or be overwritten.
- Performs installs (priority control included) from a given source, written in the form of dead-simple script files. This reflects how we usually do our installations ourselves, `brew install`, `apt-get install`, or build from source. Just automated and
  - with basic priority (but not dependency) control - you want `curl` installed before you build other tools, right?
  - with built-in check for `Darwin` vs `Ubuntu` platforms. Adding others is simple.

Additionally,
- Comprehensive, indent-based logging
- Handles errors nicely. Yes, you don't need to think about ["Why this failing script does not fail?"](https://gist.github.com/agronskiy/bc9f8b916e6a0a357de8c360dea4d788#warmer)
- Wrappers for common operations

Yasli runs as Bash framework just because it is 100% present on the target system, even though you can use it for setting up your favorite `.zshrc` or anything else.

To enable your new config file or another installer, you just add that file (with special extension) - Yasli will pick it up.

## What it is not

It is not replacement for Ansible or other provisioning software. It _just automates_ what you otherwise would have typed into your command line. Thus saving you time to properly store your favorite configs and tools as persistent files in a repo, not as a set of steps in some readme.

## Installation

![https://badgen.net/badge/Status/WIP/orange](https://badgen.net/badge/Status/WIP/orange)

Clone repo to the location of your liking, such as `~/.yasli`:
```bash
git clone https://github.com/agronskiy/yasli.git ~/.yasli
```

Run linkers and insallers that are located in `<any_path>`:
```bash
DOTFILES=<any_path> ~/.yasli/yasli-main
```

## Credits and inspiration
This started as a heavily adjusted version by @holman.
