#!/bin/bash
set -o nounset                              # Treat unset variables as an error
fswatch ${HOME}/.tool-versions | while read event
do
    rm -f ${HOME}/.asdf_dart_sdk && ln -s $(asdf where dart)/dart-sdk ${HOME}/.asdf_dart_sdk
done


