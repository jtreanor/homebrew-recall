# homebrew-recall

Homebrew tap for [Recall](https://github.com/jtreanor/recall) — a keyboard-first clipboard history manager for macOS.

## Install

```sh
brew tap jtreanor/recall
brew install --cask recall
```

Or in one step:

```sh
brew install --cask jtreanor/recall/recall
```

## Notes

Recall is ad-hoc signed but not yet notarized. The cask automatically removes the macOS quarantine attribute after installation so Gatekeeper won't block the first launch.

## Uninstall

```sh
brew uninstall --cask recall
brew untap jtreanor/recall
```
