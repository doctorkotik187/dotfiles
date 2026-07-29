# Doctor Kotik's Dotfiles 😼

Personal dotfiles for a [Universal Blue Bluefin](https://projectbluefin.io/) machine,
managed with [chezmoi](https://www.chezmoi.io/) (symlink mode).

## Setup

```bash
brew install chezmoi just gum nushell age
chezmoi init doctorkotik187 --ssh --apply
```

## Usage of Custom Just Commands

```bash
just -g --choose
```
