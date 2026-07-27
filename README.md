# ml4w-custom-dotfiles

Production dotfiles for my current Hyprland/Wayland workstation.

This repository is a customized ML4W dotfiles source. It combines the upstream
[ML4W Dotfiles for Hyprland](https://github.com/mylinuxforwork/dotfiles) with
committed personal workstation customizations, so it should not be treated as a
pristine upstream mirror.

The older `personal_dotfiles` repository is now historical/reference material.
Personal user-level customizations that are part of the active desktop profile
belong directly in this repository.

## Repository Map

- `dotfiles/`: user-level configuration installed through the ML4W Dotfiles Installer.
- `hyprland-local.dotinst`: local installer profile for this checkout.
- `setup/`: inherited ML4W setup material; review before installer execution.
- `root/`: system/root configuration, separate from normal user dotfiles installation.
- `hyprland-dotfiles*.dotinst`: upstream, stable, and local profile metadata.

## Local Install Workflow

Use local files only. Do not install this customized profile from GitHub, a
remote `.dotinst` URL, or a `curl | bash` command.

From this repository, the local installer command is:

```bash
ml4w-dotfiles-installer --install ./hyprland-local.dotinst
```

Running the installer can modify `$HOME`, create or replace symlinks, restore
selected files, and execute setup or migration behavior. Before running it,
review:

- `hyprland-local.dotinst`
- current backup state under the installer profile
- existing files in target locations under `$HOME`
- high-risk paths that need a separate deployment plan

The local profile uses `subfolder: "dotfiles"`, so the normal user dotfiles
workflow is limited to the `dotfiles/` tree. Root/system configuration remains
out of scope for this workflow.

## Maintenance

Keep custom changes committed directly in this repository. Preserve upstream
ML4W structure where practical so future upstream comparisons and updates remain
understandable.

Use full Conventional Commit messages for new commits: a Conventional Commit
subject, a blank line, and a body explaining what changed and why.

Do not include broad high-risk paths in ordinary user-level installer deployment
unless a separate plan explicitly approves them:

- `dotfiles/.local/`
- `dotfiles/.config/systemd/`
- `root/`

Treat `root/` and service configuration as sensitive. Inspect file names only
unless content review is explicitly approved.

## Upstream Credits

This repository builds on the ML4W OS and ML4W Dotfiles for Hyprland project by
Stephan Raabe and contributors. Upstream documentation remains available at:

```text
https://ml4w.com/os/
```
