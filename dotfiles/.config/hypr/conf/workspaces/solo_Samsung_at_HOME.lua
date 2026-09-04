
-- ============================================================================
-- Workspace profile: Samsung external monitor at HOME
--
-- Layout:
--   External: Samsung LC27G5xT
--             desc: Samsung Electric Company LC27G5xT H4ZR202347
--   Internal: ThinkPad display (eDP-1)
--
-- Workspace assignment:
--   Samsung:  1, 3, 5, 7, 9, 11, 91
--   Internal: 2, 4, 6, 8, 10, 12, 92
--
-- Workspaces 1 and 2 are the default workspaces for their respective
-- monitors.
--
-- The external display is matched by its Hyprland monitor description
-- instead of a connector name because connector assignments may change
-- between docks, ports, or reconnects.
-- ============================================================================

-- Group 1
hl.workspace_rule({ workspace = "1",  monitor = "desc: Samsung Electric Company LC27G5xT H4ZR202347", default = true })
hl.workspace_rule({ workspace = "2",  monitor = "eDP-1",    default = true })

-- Group 2
hl.workspace_rule({ workspace = "3",  monitor = "desc: Samsung Electric Company LC27G5xT H4ZR202347" })
hl.workspace_rule({ workspace = "4",  monitor = "eDP-1" })

-- Group 3
hl.workspace_rule({ workspace = "5",  monitor = "desc: Samsung Electric Company LC27G5xT H4ZR202347" })
hl.workspace_rule({ workspace = "6",  monitor = "eDP-1" })

-- Group 4
hl.workspace_rule({ workspace = "7",  monitor = "desc: Samsung Electric Company LC27G5xT H4ZR202347" })
hl.workspace_rule({ workspace = "8",  monitor = "eDP-1" })

-- Group 5
hl.workspace_rule({ workspace = "9",  monitor = "desc: Samsung Electric Company LC27G5xT H4ZR202347" })
hl.workspace_rule({ workspace = "10", monitor = "eDP-1" })

-- Group 6
hl.workspace_rule({ workspace = "11", monitor = "desc: Samsung Electric Company LC27G5xT H4ZR202347" })
hl.workspace_rule({ workspace = "12", monitor = "eDP-1" })

-- Group 90
hl.workspace_rule({ workspace = "91", monitor = "desc: Samsung Electric Company LC27G5xT H4ZR202347" })
hl.workspace_rule({ workspace = "92", monitor = "eDP-1" })

hl.workspace_rule({ workspace = "91", monitor = "desc: Samsung Electric Company LC27G5xT H4ZR202347" })
