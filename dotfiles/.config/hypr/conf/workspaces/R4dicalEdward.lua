-- ~/.config/hypr/conf/workspaces/R4dicalEdward.lua
-- Profile: dual external setup (DP-3, DP-2) — "R4dicalEdward"
-- Workspace-to-monitor mapping preserved exactly from legacy config.
-- Comments from original retained for intent documentation.

-- This is a general rule for xwayland apps but can have other consequences.
-- For one user it impacted Emacs so it's disabled by default.
-- It's here as a reference or for quick triage of xwayland apps.
-- hl.window_rule({ match = { xwayland = true }, no_blur = true })

-- Workspace-to-monitor mapping
hl.workspace_rule({ workspace = "1", monitor = "DP-3", default = true })  -- Spotify & ChatGPT
hl.workspace_rule({ workspace = "2", monitor = "DP-2", default = true })  -- VS Code
hl.workspace_rule({ workspace = "3", monitor = "DP-3" })                  -- Obsidian
hl.workspace_rule({ workspace = "4", monitor = "DP-2" })                  -- Firefox
hl.workspace_rule({ workspace = "5", monitor = "DP-3" })                  -- File Explorer
hl.workspace_rule({ workspace = "6", monitor = "DP-2" })                  -- Terminals

-- Example rules (from https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/)
-- hl.workspace_rule({ workspace = "3",         no_rounding = true, decorate = false })
-- hl.workspace_rule({ workspace = "name:coding", no_rounding = true, decorate = false,
--                     gaps_in = 0, gaps_out = 0, no_border = true, monitor = "DP-2" })
-- hl.workspace_rule({ workspace = "8",         border_size = 8 })
-- hl.workspace_rule({ workspace = "name:Hello", monitor = "DP-2", default = true })
-- hl.workspace_rule({ workspace = "name:gaming",
--                     monitor = "desc:Chimei Innolux Corporation 0x150C", default = true })
-- hl.workspace_rule({ workspace = "5",                on_created_empty = "[float] firefox" })
-- hl.workspace_rule({ workspace = "special:scratchpad", on_created_empty = "foot" })
