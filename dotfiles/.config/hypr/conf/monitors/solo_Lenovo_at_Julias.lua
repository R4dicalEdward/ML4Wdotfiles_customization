-- Monitor profile: Lenovo external at Julias
-- Lenovo P27h-20 (HDMI-A-1) + ThinkPad T14 internal (eDP-1)
--
-- PPI normalisation: eDP-1 is ~162 PPI, HDMI-A-1 is ~108 PPI.
-- Scale ratio 1.5 : 1.0 equalises perceived content size exactly.
-- eDP-1 is positioned to the right of and slightly below HDMI-A-1.
--
-- Physical layout (not to scale):
--   ┌─────────────────────────┐
--   │                         │·····┐
--   │       HDMI-A-1          │     │ eDP-1
--   │      2560×1440          │·····┘
--   └─────────────────────────┘
--
-- ┌─────┬──────────┬──────────┬────────────────┬────────────────┬──────────────┬─────────────────┐
-- │ #   │ HDMI-A-1 │ eDP-1    │ HDMI layout px │ eDP layout px  │ eDP position │ Content delta   │
-- │     │ Scale    │ Scale    │                │                │              │                 │
-- ├─────┼──────────┼──────────┼────────────────┼────────────────┼──────────────┼─────────────────┤
-- │ 1   │ 1.0      │ 1.5      │ 2560 × 1440    │ 1280 × 800     │ 2560 × 320   │ 0 % (exact)     │
-- │ 2   │ 1.0      │ 1.333    │ 2560 × 1440    │ 1440 × 900     │ 2560 × 270   │ eDP +12% small  │
-- │ 3   │ 1.0      │ 1.25     │ 2560 × 1440    │ 1536 × 960     │ 2560 × 240   │ eDP +20% small  │
-- │ 4   │ 1.25     │ 1.5      │ 2048 × 1152    │ 1280 × 800     │ 2048 × 176   │ HDMI +25% large │
-- └─────┴──────────┴──────────┴────────────────┴────────────────┴──────────────┴─────────────────┘

hl.monitor({
	output = "desc: Lenovo Group Limited P27h-20 V90D2YEX",
	mode = "2560x1440@60",
	position = "0x0",
	scale = 1.0,
})

hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@60",
	position = "2560x500",
	scale = 1.333,
})
