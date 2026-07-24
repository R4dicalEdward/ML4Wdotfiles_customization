-- ~/.config/hypr/conf/workspaces/solo_LG_at_HOME.lua
-- Profile: single LG external (HDMI-A-1) + ThinkPad panel (eDP-1) @ HOME
-- Workspaces interleaved: odd → HDMI-A-1 (LG), even → eDP-1 (internal)

-- Group 1
hl.workspace_rule({ workspace = "1",  monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "2",  monitor = "eDP-1",    default = true })

-- Group 2
hl.workspace_rule({ workspace = "3",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "4",  monitor = "eDP-1" })

-- Group 3
hl.workspace_rule({ workspace = "5",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6",  monitor = "eDP-1" })

-- Group 4
hl.workspace_rule({ workspace = "7",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "8",  monitor = "eDP-1" })

-- Group 5
hl.workspace_rule({ workspace = "9",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", monitor = "eDP-1" })

-- Group 6
hl.workspace_rule({ workspace = "11", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "12", monitor = "eDP-1" })

-- Group 90
hl.workspace_rule({ workspace = "91", monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "92", monitor = "eDP-1" })