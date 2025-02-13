# Prose IM Homebrew Tap

This is the repository for Prose IM [Homebrew](http://brew.sh/) packages.

Homebrew is the package manager for macOS (also available on Linux).

A “tap” is a third-party (in relation to Homebrew) repository providing
installable packages on macOS and Linux.
See more at <https://docs.brew.sh/Taps>.

## Available packages

### Casks (apps)

| Package      | Description                                            |
| ------------ | ------------------------------------------------------ |
| prose        | The official Prose app                                 |

Install using `brew install --cask prose-im/tap/<package>`.

## Why not use `homebrew-core` (main tap)?

According to Homebrew, the prose-app-web repository “is not notable enough (under 30 forks, 30 watchers, 75 stars)”,
which would cause it to be rejected. See [Rejected Casks].

[Rejected Casks]: https://docs.brew.sh/Acceptable-Casks#rejected-casks "Acceptable Casks — Homebrew Documentation"
