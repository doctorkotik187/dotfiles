# AGENTS.md - Dotfiles Management

This document provides essential context for agents working with this personal dotfiles repository. The goal is to modify configuration files for a Universal Blue (Bluefin) Linux GNOME laptop, which is based on Fedora Silverblue. Chezmoi manages these dotfiles via symlinks, but agents should *only* focus on editing the source files in this repository.

## Project Overview

This repository contains personal configuration files (dotfiles). These files are managed by Chezmoi, which creates symlinks in the user's home directory to maintain system consistency.

## Key Technologies

*   **Fedora Silverblue / Universal Blue (Bluefin) Linux**: An immutable operating system. User-specific configurations are handled within the home directory.
*   **GNOME**: The desktop environment.
*   **dot_ prefix convention**: Files like `dot_bashrc` are deployed as hidden files (e.g., `.bashrc`).
*   **Chezmoi**: Manages symlinks. Agents should *not* interact with Chezmoi commands directly.

## Directory Structure

The structure helps identify which program a configuration file belongs to:

*   `dot_bashrc`: Configuration for the Bash shell.
*   `dot_Brewfile`: Configuration for Homebrew (or Linuxbrew) packages.
*   `dot_config/`: Contains configurations for various applications (e.g., `dot_config/zellij/config.kdl` for Zellij).
*   `dot_local/`: Local user-specific files or scripts.
*   `dot_logseq/`: Configuration or data related to Logseq.
*   `empty_dot_aider.conf.yml`: Aider configuration.

## Fedora Silverblue / Bluefin Considerations

*   **Immutable Root Filesystem**: System-wide changes are managed by `rpm-ostree` or toolbox containers. This repository focuses solely on user-level configurations within `/home`.
*   **Toolboxes**: Dotfiles may need to be considered for application inside Toolbox (the user mostly uses 1x Arch Linux Distrobox container, NOT toolbx) containers.
*   **Homebrew/Linuxbrew**: Packages are managed via `dot_Brewfile` and installed using `brew bundle install` by the user.

## Gotchas and Non-obvious Patterns

*   **Symlinks**: Files in this repository are symlinked to their active locations. Agents should *always* modify the source files directly within this repository, not the symlinked files in `~`.
*   **External Dependencies**: Be aware that some dotfiles might rely on specific applications or tools being installed. The user handles these installations.

---
**Note to future agents**: Your task is to modify the configuration files in this repository. Assume the user will handle all Chezmoi commands (apply, add, remove) and system-level installations. Focus on understanding the configuration format and intent from the file content and names.
