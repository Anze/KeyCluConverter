# KeyCluConverter

![license:bsd-3-clause-clear](https://img.shields.io/badge/license-BSD--3--Clause--Clear-orange.svg)

[KeyClu](https://github.com/Anze/KeyCluCask) is a simple app that provides an overview of application shortcuts.

This repository is a converter, which allows convert KeyCue `.kcustom` file to KeyClue `.keyclu` file.

These `.keyclu` files can be shared with others through [KeyCluExtensions](https://github.com/Anze/KeyCluExtensions) repository.

# Support

If you have any questions or suggestions please open an issue at [KeyClu](https://github.com/Anze/KeyCluCask/issues).

# Usage
To convert existing `.kcustom` file, you would need a `bundleId` of the app. Check [FAQ](#FAQ) section for more info.

## Help
```
KeyCluConverter --help
```

## Convert
Example command:
```
KeyCluConverter --bundle-id com.app-bundle.id --from-file /path/to/file.kcustom --to-file /path/to/file.keyclu
```
Where:
- `--bundle-id` provide app's bundleId, eg com.app-bundle.id, check [FAQ](#FAQ) section for more info.
- `--from-file` **KeyCue** file path to convert
- `--to-file` **KeyClu** file path to save

## FAQ
There are few ways how to get `bundleId`
- You can obtain the `bundleId` by exporting a file for that app with at least one dummy shortcut set up within the KeyClu. It's important to note that the app should already be installed and used KeyClu altelast once within that app.
- You can find the `bundleId` by inspecting the `Info.plist` file located within the app's `Content` folder. Look for the value corresponding to the line `CFBundleIdentifier`.

# License

KeyCluConverter is released under the BSD-3-Clause-Clear license. See [LICENSE](LICENSE) for details.
