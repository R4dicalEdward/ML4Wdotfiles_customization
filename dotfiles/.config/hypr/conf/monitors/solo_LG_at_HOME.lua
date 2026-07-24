-- Monitor profile: solo LG external at HOME
-- HDMI-A-1: LG HDR 4K — primary, 4K@60, scale 1.5, anchored top-left
-- eDP-1:    ThinkPad internal panel — scale 1.25, positioned to the right
--           of HDMI-A-1 at layout pixel offset x=2560, y=750
--           (layout width of HDMI-A-1 = 3840 / 1.5 = 2560 px)

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "3840x2160@60",
    position = "0x0",
    scale    = 1.5,
})

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@60",
    position = "2560x750",
    scale    = 1.25,
})