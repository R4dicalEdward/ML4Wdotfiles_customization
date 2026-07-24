-- ~/.config/hypr/conf/workspaces/dual_Dell_at_ZIH.lua
-- Profile: dual Dell externals (DP-10, DP-9) + ThinkPad panel (eDP-1) @ ZIH
-- Workspaces distributed across three outputs in groups of three:
--   col A → DP-10 (Dell 1), col B → DP-9 (Dell 2), col C → eDP-1 (internal)

-- Group 1
hl.workspace_rule({ workspace = "1",  monitor = "DP-10" })
hl.workspace_rule({ workspace = "2",  monitor = "DP-9" })
hl.workspace_rule({ workspace = "3",  monitor = "eDP-1" })

-- Group 2
hl.workspace_rule({ workspace = "4",  monitor = "DP-10" })
hl.workspace_rule({ workspace = "5",  monitor = "DP-9" })
hl.workspace_rule({ workspace = "6",  monitor = "eDP-1" })

-- Group 3
hl.workspace_rule({ workspace = "7",  monitor = "DP-10" })
hl.workspace_rule({ workspace = "8",  monitor = "DP-9" })
hl.workspace_rule({ workspace = "9",  monitor = "eDP-1" })

-- Group 4
hl.workspace_rule({ workspace = "10", monitor = "DP-10" })
hl.workspace_rule({ workspace = "11", monitor = "DP-9" })
hl.workspace_rule({ workspace = "12", monitor = "eDP-1" })
