#!/bin/bash
set -o nounset                              # Treat unset variables as an error

fs_watch_instances=$(ps | grep "fswatch ${HOME}/.tool-versions" | wc -l | tr -d "[:blank:]")

# verify we only have one watcher running
[ "$fs_watch_instances" -gt "1" ] && exit

fswatch ${HOME}/.tool-versions | while read event
do
    rm -f ${HOME}/.asdf_dart_sdk && ln -s $(asdf where dart)/dart-sdk ${HOME}/.asdf_dart_sdk
done &


