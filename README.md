# asdf-dart
dart plugin for [asdf version manager](https://github.com/asdf-vm/asdf)


## Requirements
- `curl`
- `unzip` or `7z` to decompress the downloaded zip


## Install

```
asdf plugin add dart https://github.com/patoconnor43/asdf-dart.git
```

## Use

Check the [asdf instructions](https://asdf-vm.com/guide/getting-started.html#_5-install-a-version) for how to install and set your Dart version.

## Customization
The default behavior for this plugin used to include `dev` and `beta` versions
when listing all the versions. This got really noisy and interfered with
`asdf install dart latest` installing the latest stable version. If you want
to re-enable these channels you can set these environment variables.
```
ASDF_DART_ENABLE_BETA=true
ASDF_DART_ENABLE_DEV=true
```
These environment variables will ensure only the base versions are included.

## Installation differences between Dart 1 and Dart 2

All Dart 1 versions come with corresponding versions of `content_shell` and `dartium`. Since Dart 2 doesn't use these tools, they aren't included. For more information on tooling differences, check out [the docs](https://webdev.dartlang.org/dart-2).

## Using in your favorite IDE/Editor
Dart plugins for IntelliJ, VS Code, etc., typically need you to provide a path where the Dart SDK is installed.
Using asdf installs Dart in a consistent place, but may be confusing if you don't know where that is.
The install location can be found by running `asdf where dart`, which should be `$HOME/.asdf/installs/dart/VERSION`
Continuously updating this path can get annoying between upgrades or if you're doing work between Dart 1 and 2.
Because of this I added a script to this repo (`tools/dart_version_watcher.sh`) that will create a file watcher
for any time your global versions change and then update a symlink that points to the current version.
This means you can point your IDE at `${HOME}/.asdf_dart_sdk` and anytime you change versions, this file
will point to the most recent version. If you're interested check the [install instructions](./tools/README.md)
inside the `tools/` directory.

## Included Shims

- `dart2js`
- `dart2native`
- `dart`
- `dartanalyzer`
- `dartaotruntime`
- `dartdevc`
- `dartdevc`
- `dartdoc`
- `dartfmt`
- `pub`
- `and many more...`
- `content_shell` (Dart 1 exclusive)
- `dartium` (Dart 1 exclusive)

## Working with multiple SDKs
If you're using this plugin it's probably because you're using multiple
versions of the Dart SDK. This means you also want to be able to use different
versions of the language server. This is easy enough in Vim/Neovim by getting
the language server path by running `asdf where dart`. In VSCode, you'll
probably want to use the `dart.sdkPaths` setting. This will allow you to add a
path where your SDKs are located and then switch them on the fly. An example
value for this setting is `<an absolute path to your asdf
folder>/installs/dart`. If you hover over the Dart Syntax Switcher in the
bottom right of the editor you should see a way to change which SDK you want to
use.

<img width="346" alt="A screenshot showing a popup menu when hovering over the
syntax selector in VSCode. There is a label that shows the current Dart version
and a button that says 'change'."
src="https://github.com/PatOConnor43/asdf-dart/assets/6657525/c82b9974-a121-4fb8-b35a-6d590bf0db7c">

*IMPORTANT NOTE: If there are versions of the SDK that are installed, but don't
show up in the menu, you should be able to uninstall and re-install those
versions. This is due to a path change that was necessary to facilitate this
feature.*

Shoutout to @Rapougnac for bringing this up!

## Contributing

Feel free to create an issue or pull request if you find a bug.

## License
MIT License
