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
