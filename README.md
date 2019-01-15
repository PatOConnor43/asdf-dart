# asdf-dart
dart plugin for [asdf version manager](https://github.com/asdf-vm/asdf)


## Requirements
- `curl`
- `unzip` (apt-get install unzip)


## Install

```
asdf plugin-add dart https://github.com/patoconnor43/asdf-dart.git
```

## Use

Check the [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to install & manage versions of dart.

## Installation differences between Dart 1 and Dart 2

All Dart 1 versions come with corresponding versions of `content_shell` and `dartium`. Since Dart 2 doesn't use these tools, they aren't included. For more information on tooling differences, check out [the docs](https://webdev.dartlang.org/dart-2).

## Known Issues

Occasionally when switching between Dart 1 and Dart 2, the `dartium` and `content_shell` shims can break. When trying to use them they'll report `No such command in <version> of dart`. To fix this, you can delete the `dartium` and `content_shell` shims from `$HOME/.asdf/shims` and then recreate the shims by running `asdf reshim dart <version>`.

## Included Shims

- `dart`
- `dart2js`
- `dartanalyzer`
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
