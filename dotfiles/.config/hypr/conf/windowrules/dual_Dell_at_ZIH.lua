-- Window rules: dual Dell monitor profile @ ZIH
-- Assigns application windows to workspaces on open.
-- Rules are evaluated top-to-bottom; order matters.

-- 1st group: dev + notes + browser
hl.window_rule({ match = { class = "code" },                                    workspace = "1" })
hl.window_rule({ match = { class = "md.obsidian.Obsidian" },                    workspace = "2" })
hl.window_rule({ match = { class = "firefox" },                                 workspace = "3" })

-- 2nd group: secrets
-- hl.window_rule({ match = { class = "kitty" }, workspace = "5" })  -- disabled
hl.window_rule({ match = { class = "org.keepassxc.KeePassXC" },                 workspace = "6" })

-- 3rd group: comms
hl.window_rule({ match = { class = "Element" },                                 workspace = "9" })

-- 4th group: research + mail + music
hl.window_rule({ match = { class = "Zotero" },                                  workspace = "10" })
hl.window_rule({ match = { class = "org.gnome.Evolution" },                     workspace = "11" })
hl.window_rule({ match = { class = "spotify" },                                 workspace = "12" })