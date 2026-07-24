-- Monitor profile: solo Dell external at ZIH
-- DP-9:  Dell external — primary, native res/refresh, unscaled, anchored top-left
-- eDP-1: ThinkPad internal panel — fractional scale 1.2, positioned to the right
--        of DP-9 at layout pixel offset x=2560, y=1000 (vertically centred beneath Dell)

hl.monitor({
    output   = "DP-9",
    mode     = "2560x1440@59.95",
    position = "0x0",
    scale    = 1,
})

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@60",
    position = "2560x1000",
    scale    = 1.2,
})