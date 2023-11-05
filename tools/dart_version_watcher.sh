#!/bin/bash
set -o nounset                              # Treat unset variables as an error

SYMLINK_DIR=".asdf_dart_sdk"
TOOL_VERSIONS=".tool-versions"
DART_SDK="dart-sdk"

create_symlink () {
  if [ ! -d "${HOME}/${SYMLINK_DIR}" ]
    then
      echo "No ${HOME}/${SYMLINK_DIR} dir found. Creating symlinked dart sdk dir..."
      ln -s $(asdf where dart)/${DART_SDK} ${HOME}/${SYMLINK_DIR}
      echo "Directory created!"
    fi
    echo "Version watcher is running and ${HOME}/${SYMLINK_DIR} is symlinked to $(asdf where dart)/${DART_SDK}, you're all set! You can now set the dart lib sdk path to ${HOME}/${SYMLINK_DIR} in your IDE."
}

fs_watch_instances=$(ps | grep "fswatch ${HOME}/${TOOL_VERSIONS}" | grep -cwv grep | tr -d "[:blank:]")

# verify we only have one watcher running
if [ "$fs_watch_instances" -ge "1" ]
then
  echo "Version watcher is already running. Checking for ${HOME}/${SYMLINK_DIR} dir..."
  create_symlink
  exit
fi

echo "Version watcher created! Checking for already existing ${HOME}/${SYMLINK_DIR} symlink"

create_symlink

fswatch ${HOME}/${TOOL_VERSIONS} | while read event
do
    rm -f ${HOME}/${SYMLINK_DIR} && ln -s $(asdf where dart)/${DART_SDK} ${HOME}/${SYMLINK_DIR}
done &