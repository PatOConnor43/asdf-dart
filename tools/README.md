# Tools

## tools/dart_version_watcher.sh
This tool provides an automated way to keep your Dart SDK path up-to-date.

This tool works by creating a file watcher on ${HOME}/.tool_versions (where your
global versions are tracked) and sym-linking a directory when that changes. I
have attempted to make it idempotent by having the script look for other running
instances before setting up the file watcher. If you see multiple instances of
this script running or multiple fswatch processes running, please try to
determine how you did that and file and issue. Thanks!

**Dependecies**

[fswatch](https://github.com/emcrisostomo/fswatch) - fswatch is a multi-platform file system notifier.

**Installation**

Add the script to your `.bashrc`|`.zshrc`|`config.fish` to guarantee it runs on startup.

