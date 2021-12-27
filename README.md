# yasli
YASLI (in Russian, "yasli", "ясли", means "crib" or "nursery" - something from where the new life is bootstrapped) – **Y**et **A**nother **S**imple **L**inker and **I**nstaller for your dotfiles and/or tools environment.

As software engineers, we set up our terminal tooling and dotfiles in new environments - every now and then. This simple yet ready-to-use boilerplate, called "Yasli", automates the two main points a typical terminal user performs to set up a new machine:
- Links config files from a given source (e.g. your repository) into `$HOME`. Linking is non-invasive: if something is already there, it can be chosen to stay or be overwritten.
- Performs installs (priority control included) from a given sourse, written in the form of dead-simple script files. This reflects how we usually do our installations ourselves, `brew install`, `apt-get install`, or build from source. Just automated and 
  - with basic priority (but not dependency) control - you want `curl` installed before you build other tools, right?
  - with built-in check for `Darwin` vs `Ubuntu` platforms. Adding others is simple.

Additionally,
- Comprehensive, indent-based logging
- Handles errors nicely. Yes, you don't need to think about ["Why this failing script does not fail?"](https://gist.github.com/agronskiy/bc9f8b916e6a0a357de8c360dea4d788#warmer)
- Wrappers for common opearations

Yasli runs as Bash framework just because it is 100% present on the target system, even though you can use it for setting up your favourite `.zshrc` or anything else.

To enable your new config file or another installer, you just add that file (with special extension) - Yasli will pick it up. 

# What it is not

It is not replacement for Ansible or other provisioning software. It _just automates_ what you otherwise would have typed into your command line. Thus saving you time to properly store your favourite configs and tools as persistent files in a repo, not as a set of steps in some readme.

# Installation

# Credits and inspiration
