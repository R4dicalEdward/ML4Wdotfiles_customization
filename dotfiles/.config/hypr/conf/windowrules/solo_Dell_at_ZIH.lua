-- Window rules: solo Dell monitor profile @ ZIH
-- Assigns application windows to workspaces on open.
-- Rules are evaluated top-to-bottom; order matters.

-- 1st group: dev + browser
hl.window_rule({ match = { class = "code" },                    workspace = "1" })
hl.window_rule({ match = { class = "firefox" },                 workspace = "2" })

-- 2nd group: notes + secrets
hl.window_rule({ match = { class = "md.obsidian.Obsidian" },    workspace = "3" })
hl.window_rule({ match = { class = "org.keepassxc.KeePassXC" }, workspace = "4" })

-- 3rd group: research + comms
hl.window_rule({ match = { class = "Zotero" },                  workspace = "5" })
hl.window_rule({ match = { class = "Element" },                 workspace = "6" })

-- 4th group: mail + music
hl.window_rule({ match = { class = "org.gnome.Evolution" },     workspace = "7" })
hl.window_rule({ match = { class = "Spotify" },                 workspace = "8" })

-- 5th group: secondary browser
hl.window_rule({ match = { class = "chromium" },                workspace = "10" })

-- 90th group: VDI
hl.window_rule({ match = { class = "Wfica" },                   workspace = "91" })
hl.window_rule({ match = { class = "conncenter" },              workspace = "92" })