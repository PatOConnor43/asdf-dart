#!/bin/bash
set -o nounset                              # Treat unset variables as an error

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
pidfile=${script_dir}/version_watcher_pid

# verify we only have one watcher running
[ -f "$pidfile" ] && exit

# 2 processes start in the background here. The inner process is the fswatch
# process that is waiting for file events. The outer process is waiting for
# the fswatch to finish so that it can remove the pid file.
(fswatch ${HOME}/.tool-versions | while read event
do
    rm -f ${HOME}/.asdf_dart_sdk && ln -s $(asdf where dart)/dart-sdk ${HOME}/.asdf_dart_sdk
done &
echo $! > "$pidfile"
wait
rm -f $pidfile
) &

