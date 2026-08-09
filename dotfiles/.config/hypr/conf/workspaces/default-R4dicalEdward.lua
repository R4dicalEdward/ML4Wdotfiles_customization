-- ~/.config/hypr/conf/workspaces/default.lua
-- Profile: laptop display only (eDP-1)
-- All workspaces are placed on the internal ThinkPad panel.

for workspace = 1, 12 do
    hl.workspace_rule({
        workspace = tostring(workspace),
        monitor = "eDP-1",
        default = workspace == 1,
    })
end
