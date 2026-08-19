-- Workspaces for the dual-Dell-at-ZIH profile.
--
-- Two external Dell monitors (DP-10 left, DP-9 right) plus the
-- ThinkPad internal panel (eDP-1). Twelve workspaces are split into
-- 4 thematic groups of 3; the workspace→monitor mapping within each
-- group is hand-tuned so each app lands on the screen I am used to
-- from my previous (single external monitor) setup.
-- Window rules: ../windowrules/dual_Dell_at_ZIH.lua.
--
-- Physical layout (left → right):
--   ┌─────────────┐┌─────────────┐
--   │   DP-10     ││   DP-9      │       ┌─────────┐
--   │   Dell 1    ││   Dell 2    │       │ eDP-1   │
--   │  (primary)  ││ (secondary) │       │ internal│
--   └─────────────┘└─────────────┘       └─────────┘
--
-- App distribution (workspaces with no app rule are scratch):
-- ┌──────────┬────────────────┬────────────────────────────────────────┐
-- │ Monitor  │ Workspaces     │ Apps                                   │
-- ├──────────┼────────────────┼────────────────────────────────────────┤
-- │ DP-10    │ 1, 7, 9, 10    │ code, Wfica, Zotero                    │
-- │ DP-9     │ 3, 5, 11       │ firefox, Evolution                     │
-- │ eDP-1    │ 2, 4, 6, 8     │ Obsidian, KeePassXC, Element, spotify  │
-- └──────────┴────────────────┴────────────────────────────────────────┘

-- Group 1: dev + notes + browser
hl.workspace_rule({ workspace = "1",  monitor = "DP-10" })
hl.workspace_rule({ workspace = "2",  monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3",  monitor = "DP-9"  })

-- Group 2: VDI + scratch + secrets
hl.workspace_rule({ workspace = "9",  monitor = "DP-10" })
hl.workspace_rule({ workspace = "5",  monitor = "DP-9"  })
hl.workspace_rule({ workspace = "4",  monitor = "eDP-1" })

-- Group 3: scratch + music + comms
hl.workspace_rule({ workspace = "7",  monitor = "DP-10" })
hl.workspace_rule({ workspace = "12", monitor = "DP-9"  })
hl.workspace_rule({ workspace = "6",  monitor = "eDP-1" })

-- Group 4: research + mail + scratch
hl.workspace_rule({ workspace = "10", monitor = "DP-10" })
hl.workspace_rule({ workspace = "11", monitor = "DP-9"  })
hl.workspace_rule({ workspace = "8",  monitor = "eDP-1" })