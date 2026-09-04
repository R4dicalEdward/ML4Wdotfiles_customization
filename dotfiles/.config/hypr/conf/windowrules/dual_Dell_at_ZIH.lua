-- Window rules for the dual-Dell-at-ZIH profile.
--
-- Rules are evaluated top-to-bottom; order matters.
-- Apps are routed to specific workspaces; the workspace→monitor map
-- is defined in ../workspaces/dual_Dell_at_ZIH.lua.
--
-- App distribution:
-- ┌──────────┬──────────┬─────────────────────────┬──────────────────┐
-- │ Monitor  │ ws       │ App                     │ Notes            │
-- ├──────────┼──────────┼─────────────────────────┼──────────────────┤
-- │ DP-10    │ 1        │ code                    │ primary dev      │
-- │ (Dell 1) │ 9        │ Wfica                   │ Citrix VDI       │
-- │          │ 10       │ Zotero                  │ research         │
-- ├──────────┼──────────┼─────────────────────────┼──────────────────┤
-- │ DP-9     │ 3        │ md.obsidian.Obsidian    │ primary browser  │
-- │ (Dell 2) │ 11       │ org.gnome.Evolution     │ mail             │
-- ├──────────┼──────────┼─────────────────────────┼──────────────────┤
-- │ eDP-1    │ 2        │ firefox                 │ notes            │
-- │ (int.)   │ 4        │ org.keepassxc.KeePassXC │ secrets          │
-- │          │ 6        │ Element                 │ Matrix client    │
-- │          │ 8        │ spotify                 │ music            │
-- └──────────┴──────────┴─────────────────────────┴──────────────────┘

-- 1st group: dev + notes + browser
hl.window_rule({ match = { class = "code" },                                    workspace = "1" })
hl.window_rule({ match = { class = "firefox" },                                 workspace = "2" })
hl.window_rule({ match = { class = "md.obsidian.Obsidian" },                    workspace = "3" })

-- 2nd group: secrets
-- hl.window_rule({ match = { class = "kitty" }, workspace = "5" })  -- reserved, disabled
hl.window_rule({ match = { class = "org.keepassxc.KeePassXC" },                 workspace = "4"  })

-- 3rd group: comms + VDI
hl.window_rule({ match = { class = "Element" },                                 workspace = "6"  })
hl.window_rule({ match = { class = "Wfica" },                                   workspace = "9"  })

-- 4th group: research + mail + music
hl.window_rule({ match = { class = "Zotero" },                                  workspace = "10" })
hl.window_rule({ match = { class = "org.gnome.Evolution" },                     workspace = "11" })
hl.window_rule({ match = { class = "Spotify" },                                 workspace = "8"  })

hl.window_rule({ match = { class = "webex" },                                   workspace = "99" })