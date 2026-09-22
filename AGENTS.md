# Repository Guidelines

## Repository Role

This repository is the custom ML4W dotfiles source. It is not a pristine upstream mirror: it owns the ML4W `dotfiles/` tree, `.dotinst` files, setup metadata, and committed personal customizations.

The `root/` tree contains system-level configuration and remains separate from normal user dotfiles installation.

## Safety Rules

Do not run `ml4w-dotfiles-installer`, installer `--testmode`, package installers, GNU Stow, symlink-changing commands, or system/root deployment commands unless the user explicitly requests that action.

Treat `root/` as sensitive. Inspect and report file names only unless the user explicitly permits content review. Do not commit passwords, private keys, tokens, machine credentials, NetworkManager connection secrets, or other secrets.

## Installer Workflow

Prefer the local `.dotinst` workflow for this repository. The local profile is `hyprland-local.dotinst`, and after the workspace rename its `source` must point to:

```text
$HOME/Projects/dotfiles/dotfile-reworkd-for-dotfile-installer/ml4w-custom-dotfiles/
```

Keep `subfolder: "dotfiles"` valid. Keep broad high-risk paths such as `dotfiles/.local/`, `dotfiles/.config/systemd/`, and `root/` out of normal local installer runs unless a separate plan explicitly approves them.

## Git Workflow

Always write full Conventional Commit messages for new commits: include the Conventional Commit subject, a blank line, and a body explaining what changed and why.

When asked to commit staged state, commit the staged changes exactly. Do not revert, reshape, or omit user changes unless explicitly instructed.
