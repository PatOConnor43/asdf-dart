#!/bin/bash
set -o nounset                              # Treat unset variables as an error

# verify we only have one watcher running
pidof -o %PPID -x $0 >/dev/null && exit 1

fswatch -m poll_monitor ${HOME}/.tool-versions | while read event
do
    rm -f ${HOME}/.asdf_dart_sdk && ln -s $(asdf where dart)/dart-sdk ${HOME}/.asdf_dart_sdk
done &


