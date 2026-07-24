-- ~/.config/hypr/conf/workspaces/solo_Dell_at_ZIH.lua
-- Profile: single Dell external (DP-9) + ThinkPad panel (eDP-1) @ ZIH
-- Workspaces interleaved: odd → DP-9 (Dell), even → eDP-1 (internal)

-- Group 1
hl.workspace_rule({ workspace = "1",  monitor = "DP-9",  default = true })
hl.workspace_rule({ workspace = "2",  monitor = "eDP-1", default = true })

-- Group 2
hl.workspace_rule({ workspace = "3",  monitor = "DP-9" })
hl.workspace_rule({ workspace = "4",  monitor = "eDP-1" })

-- Group 3
hl.workspace_rule({ workspace = "5",  monitor = "DP-9" })
hl.workspace_rule({ workspace = "6",  monitor = "eDP-1" })

-- Group 4
hl.workspace_rule({ workspace = "7",  monitor = "DP-9" })
hl.workspace_rule({ workspace = "8",  monitor = "eDP-1" })

-- Group 5
hl.workspace_rule({ workspace = "9",  monitor = "DP-9" })
hl.workspace_rule({ workspace = "10", monitor = "eDP-1" })

-- Group 6
hl.workspace_rule({ workspace = "11", monitor = "DP-9" })
hl.workspace_rule({ workspace = "12", monitor = "eDP-1" })
