# homebrew-tap

Homebrew tap for apps from [shuul.io](https://shuul.io).

## Murmie

**Just say it. Murmie types it.** Private, on-device voice dictation for macOS ([murmie.com](https://murmie.com)). Requires an Apple silicon Mac running macOS 26 or later.

```sh
brew install --cask shuul-io/tap/murmie
```

Murmie updates itself. To update through Homebrew instead, run `brew upgrade --cask --greedy murmie`.

To remove Murmie together with its settings and the models in its own folder:

```sh
brew uninstall --cask --zap murmie
```

This keeps the Whisper and Parakeet models, which other apps can share, and the Keychain items. [The privacy policy](https://murmie.com/legal.html#privacy) explains how to delete them.

The cask is updated by the Murmie release script; the app itself is downloaded from [shuul-io/murmie-releases](https://github.com/shuul-io/murmie-releases).
