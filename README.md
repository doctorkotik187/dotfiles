# Doctor Kotik's Dotfiles 😼

Personal dotfiles for a [Universal Blue Bluefin](https://projectbluefin.io/) machine, managed with [chezmoi](https://www.chezmoi.io/) (symlink mode).

## Setup

```bash
brew install chezmoi just
chezmoi init --apply doctorkotik187
```

## Usage

```bash
just --list
```

## Structure

```txt
dot_*                   → dotfile in $HOME
dot_config/*            → app configs
symlink_*               → managed symlink (file content = target)
justfile                → task runner
.chezmoi.toml.tmpl      → generates local chezmoi config
.chezmoiignore          → repo-only files, never applied
```
