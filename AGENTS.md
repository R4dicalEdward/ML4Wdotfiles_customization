# AGENTS.md — Rules for AI Coding Agents

## Project Orientation

- This repository is the custom ML4W dotfiles source. It is not a pristine
  upstream mirror: it owns the ML4W `dotfiles/` tree, `.dotinst` files, setup
  metadata, and committed personal customizations.
- The `root/` tree contains system-level configuration and remains separate from
  normal user dotfiles installation.
- Remotes: `origin` is the private fork; `upstream` is the ML4W GitHub project.
  `main-upstream` is a read-only mirror of upstream.
- Base all work on the active working branch
  `local/R4dicalEdwards-ml4w-adjustements` (a long-lived branch off
  `main-local`). Do not switch or create branches, fetch, or merge without an
  explicit request in the current conversation.

<!-- SUGGESTED: the branch and remotes bullets are new; the rest is
     documented content retained from the previous file. -->

## Allowed Work

- Editing configuration under `dotfiles/`.
- Editing `hyprland-local.dotinst` while keeping its invariants valid (see
  Installer Workflow).
- Editing documentation: `README.md`, `AGENTS.md`.
- Listing file names under `root/` for orientation.

## Prohibited Actions

Unless the user explicitly requests the action in the current request:

- Do not run `ml4w-dotfiles-installer`, installer `--testmode`, package
  installers, GNU Stow, symlink-changing commands, or system/root deployment
  commands.
- Do not execute scripts under `setup/`.
- Do not fetch from `upstream` or merge upstream changes; syncing is manual and
  user-driven.
- Do not read, list, create, modify, or delete anything under `/root` on the
  live system.
- Do not edit installer profiles other than `hyprland-local.dotinst`.

## Installer Workflow

Prefer the local `.dotinst` workflow for this repository. The local profile is
`hyprland-local.dotinst`, and after the workspace rename its `source` must point
to:

```text
$HOME/Projects/dotfiles/dotfile-reworkd-for-dotfile-installer/ml4w-custom-dotfiles/
```

Keep `subfolder: "dotfiles"` valid. Keep broad high-risk paths such as
`dotfiles/.local/`, `dotfiles/.config/systemd/`, and `root/` out of normal local
installer runs unless a separate plan explicitly approves them.

If `source` or `subfolder` is missing or wrong, stop and report the profile as
invalid. Do not guess a replacement path or repair it silently.

## Templates vs. Machine-Specific Files

- Committed files act as shareable templates. Avoid machine-specific values
  (hostnames, usernames, absolute paths, credentials) in committed files.
- Machine-specific overrides live in untracked `*.local` files or in sanitized
  `*.example` templates containing placeholder values.
- When a change requires a machine-specific value, produce the `*.example`
  template and let the user create the `*.local` file themselves.
- Never `git add` or commit `*.local` files.

<!-- SUGGESTED: entire section is new. -->

## Sensitive Files — Hard Rules

- Never read, print, copy, or commit secrets. This includes passwords, private
  keys (SSH, GPG, TLS), tokens, API keys, machine credentials, NetworkManager
  connection secrets, and shell history.
- Treat `root/` as sensitive. Inspect and report file names only unless the user
  explicitly permits content review.
- Never read, list, print, or copy anything under `/root` on the live system
  (including `/root/.ssh`, `/root/.gnupg`, and history files) unless the user
  explicitly asks in the current request.
- If a file unexpectedly contains secrets, stop: do not quote its contents in
  output, diffs, or commit messages. Report only the path and wait for
  instruction.

## Verification After Changes

- Hyprland configuration: validate before reporting done, e.g.
  `Hyprland --validate`, or `hyprctl configerrors` against the running instance.
  Run `hyprctl reload` only when the user asks for it.
- Shell scripts: `bash -n <script>`; run `shellcheck` if available.
- `.dotinst` edits: re-check the `source` and `subfolder` invariants after every
  edit.
- Report what changed and how it was verified. Never paste the contents of
  sensitive paths into the report.

<!-- SUGGESTED: entire section is new. -->

## Git Workflow

- Always write full Conventional Commit messages for new commits: include the
  Conventional Commit subject, a blank line, and a body explaining what changed
  and why.
- When asked to commit staged state, commit the staged changes exactly. Do not
  revert, reshape, or omit user changes unless explicitly instructed.
- Before committing, show a summary of the staged diff. Never stage untracked
  `*.local` files or anything matching the Sensitive Files rules.

<!-- SUGGESTED: the third bullet is new; the first two are documented content
     retained unchanged. -->