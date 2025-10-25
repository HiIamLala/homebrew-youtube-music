# Youtube Music Homebrew Tap

This repository contains cask for use with Homebrew: https://brew.sh

Installation can be accomplished with either of the following two methods -

```
brew install --cask hiiamlala/homebrew-youtube-music/youtube-music
```

OR

```
brew tap hiiamlala/homebrew-youtube-music
brew install --cask youtube-music
```

Additionally, use `--no-quarantine` with `brew install` on `arm64` machines, which otherwise ends up in _Signature verification failed_ error.

To upgrade manually, run `brew upgrade --cask youtube-music`.

To uninstall, run `brew uninstall --cask youtube-music`. Additionally you can use `--zap` to remove app-data and if you want to remove the tap after uninstall, run `brew untap hiiamlala/homebrew-youtube-music`.

## Development

The local tap is in `$(brew --prefix)/Library/Taps/hiiamlala/homebrew-youtube-music` (you can also run `brew edit youtube-music`).
