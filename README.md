# asdf-dart
dart plugin for [asdf version manager](https://github.com/asdf-vm/asdf)


## Requirements
- `curl`
- `unzip` or `7z` to decompress the downloaded zip


## Install

```
asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git
```

## Use

Check the [asdf](https://github.com/asdf-vm/asdf) README for instructions on how to install & manage versions of dart.

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
- `content_shell` (Dart 1 exclusive)
- `dartium` (Dart 1 exclusive)

## Contributing

Feel free to create an issue or pull request if you find a bug.

## License
MIT License
