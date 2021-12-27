# yasli
YASLI (in Russian, "yasli", "ясли", means "crib" or "nursery" - something from where the new life is bootstrapped) – **Y**et **A**nother **S**imple **L**inker and **I**nstaller for your dotfiles and/or tools environment.

As software engineers, we set up our terminal tooling and dotfiles in new environments - every now and then. This simple yet ready-to-use boilerplate, called "Yasli", automates the two main points a typical terminal user performs to set up a new machine:
- Links config files from a given source (e.g. your repository) into `$HOME`. Linking is non-invasive: if something is already there, it can be chosen to stay or be overwritten.
- Performs installs (priority control included) from a given sourse, written in the form of dead-simple script files. This reflects how we usually do our installations ourselves, `brew install`, `apt-get install`, or build from source. Just automated. Just with check for your platform. Just with some basic priority control.

Yasli runs as Bash framework just because it is 100% present on the target system, even though you can use it for setting up your favourite `.zshrc` or anything else.

To enable your new config file or another installer, you just add that file (with special extension) - Yasli will pick it up. 

# Installation

# Credits and inspiration
