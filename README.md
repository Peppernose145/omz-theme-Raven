# Raven
A two-line, multiplatform prompt theme for Oh My Zsh

I created this theme because I couldn't find any built-in themes that suited my needs on Oh My Zsh.

## Features

  - Two-line prompt:
     Includes title, path, and git info on the first one, and username and host/device name and prompt symbol on the second.
  - Changeable title: Change the TITLE variable to anything you want. Default is "Raven"
  - Mutiple platforms supported
    - Android (Devicename shows as device codename, or falls back to "android", or "adb" if using adb shell
    - Windows NT 4 to Windows 11 (Cygwin and MinGW, shows Windows version, such as "Windows 10", displays behind username)
    - Vast majority of Linux distributions
    - MacOS support not yet added, because I don't own a Mac. If I can get some `uname` outputs from MacOS, I may add support for Mac to this theme.

## Installation

This theme requires [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) installed in order to work. Don't worry, you can install it in your home folder with ease.

  * Follow the instructions on the Oh My Zsh page to install OMZ
  * Download `raven.zsh-theme` or clone this repo
  * Copy `raven.zsh-theme` to `$HOME/.oh-my-zsh/custom/themes`
  * Edit `.zshrc` in your home folder
    - Find the line starting with `ZSH_THEME=`
    - Change it to `ZSH_THEME="raven"` 
  * Save the file
  * Launch ZSH and see the theme in action

# Notes

This theme is 1 feature away from completion (number subject to change), when we add MacOS support, this theme will support the most major platforms.

I may think about supporting additional POSIX platforms (that support ZSH) such as BSD, though I know very little about that platform.

This theme may be slow on some systems under certain conditions.
