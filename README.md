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
- `root/`: system/root configuration, sensitive, separate from normal user
  dotfiles installation.
- `hyprland-dotfiles*.dotinst`: upstream, stable, and local profile metadata.
  Only `hyprland-local.dotinst` is used by this checkout.

## Branch Model

| Branch | Role |
| --- | --- |
| `main-upstream` | Sole read-only mirror of upstream ML4W (`upstream/main`). Never commit to it; it moves only by fast-forward from upstream. |
| `main-local` | Integration branch: the upstream mirror plus merged local work. It moves by merge from the working branch and is never fast-forwarded from upstream once it carries local content. |
| `local/R4dicalEdwards-ml4w-adjustements` | Active long-lived working branch. All new work happens here; upstream syncs are merged here first, then promoted to `main-local`. |

Remotes:

- `origin`: private fork of this repository; currently empty (created but
  never pushed), usable as a backup target.
- `upstream`: the ML4W GitHub project.

### Syncing with upstream

Upstream changes are merged, not rebased: history is preserved, and merge
conflicts are resolved in favor of local customizations. The sync is
checkout-free: the mirror is updated by ref, and all conflict resolution
happens on the working branch.

```bash
# 0. Back up the working branch tip
git branch backup/pre-sync-$(date +%F) local/R4dicalEdwards-ml4w-adjustements

# 1. Fast-forward the upstream mirror (refuses non-fast-forward)
git fetch upstream main:main-upstream

# 2. Merge the mirror into the working branch; resolve conflicts here
git merge main-upstream

# 3. Validate (luac -p on touched .lua, Hyprland --verify-config), then
#    commit the merge

# 4. Promote the integration branch (fast-forward only)
git push . HEAD:main-local
```

Syncing is a deliberate, manual maintenance step. Do not combine it with
unrelated changes.

## Components and Dependencies

<!-- SUGGESTED: new section; only the installer, Hyprland/Wayland, and Arch
     facts are documented in the existing files. -->

- ML4W Dotfiles Installer (`ml4w-dotfiles-installer`) drives deployment of the
  `dotfiles/` tree.
- Target: an existing Arch system with a Hyprland (Wayland) session.
- `[ASSUMPTION]` The installer binary is already installed on the target
  machine; this repository does not bootstrap it.

## Local Install Workflow

Use local files only. Do not install this customized profile from GitHub, a
remote `.dotinst` URL, or a `curl | bash` command.

From this repository, the local installer command is:

```bash
ml4w-dotfiles-installer --install ./hyprland-local.dotinst
```

The local profile uses `subfolder: "dotfiles"`, so the normal user dotfiles
workflow is limited to the `dotfiles/` tree. Root/system configuration remains
out of scope for this workflow.

The profile's `source` must point to this checkout:

```text
$HOME/Projects/dotfiles/dotfile-reworkd-for-dotfile-installer/ml4w-custom-dotfiles/
```

Running the installer can modify `$HOME`, create or replace symlinks, restore
selected files, and execute setup or migration behavior. Before running it,
review:

- `hyprland-local.dotinst`
- current backup state under the installer profile
- existing files in target locations under `$HOME`
- high-risk paths that need a separate deployment plan

## Updating an Installed Machine

<!-- SUGGESTED: new section; derived from the documented install workflow. -->

1. Sync upstream as described in [Branch Model](#branch-model).
2. Merge into the working branch and review the resulting diff for `dotfiles/`
   before deploying.
3. Re-run the local install command above after completing the pre-install
   review. The same behaviors and risks apply as for a first install.

## High-Risk Paths

Do not include broad high-risk paths in ordinary user-level installer deployment
unless a separate plan explicitly approves them:

- `dotfiles/.local/`
- `dotfiles/.config/systemd/`
- `root/`

## Sensitive Files

- `root/` and service configuration are sensitive. Inspect file names only
  unless content review is explicitly approved.
- Never commit passwords, private keys, tokens, machine credentials,
  NetworkManager connection secrets, or other secrets to any branch.
- Never paste the contents of sensitive files, including anything under `/root`,
  into AI agent chats, logs, or issue trackers.
- Machine-specific values belong in untracked `*.local` files or sanitized
  `*.example` templates. Agent-facing rules live in `AGENTS.md`.

<!-- SUGGESTED: the last two bullets are new; the first two are documented
     rules promoted from the old Maintenance section. -->

## Maintenance

Keep custom changes committed directly in this repository. Preserve upstream
ML4W structure where practical so future upstream comparisons and updates remain
understandable.

Use full Conventional Commit messages for new commits: a Conventional Commit
subject, a blank line, and a body explaining what changed and why.

## Upstream Credits

This repository builds on the ML4W OS and ML4W Dotfiles for Hyprland project by
Stephan Raabe and contributors. Upstream documentation remains available at:

```text
https://ml4w.com/os/
```