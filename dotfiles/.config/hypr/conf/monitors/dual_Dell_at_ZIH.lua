-- Monitor profile: dual Dell external at ZIH (DP-11 + DP-12)
-- DP-12: Dell external (left)  — 2560×1440@59.95, scale 1.0, position 0 × 0
-- DP-11: Dell external (right) — 2560×1440@59.95, scale 1.0, position 2560 × 0
-- eDP-1: ThinkPad internal panel — 1920×1200@60, fractional scale 1.2,
--        positioned to the right of the Dell pair at 5120 × 1000
--
-- Layout (not to scale):
--   ┌────────────┐┌────────────┐
--   │            ││            │
--   │   DP-12    ││   DP-11    │       ┌──────────┐
--   │ 2560×1440  ││ 2560×1440  │       │          │
--   │            ││            │       │  eDP-1   │
--   └────────────┘└────────────┘       │ 1600×1000│
--                                      │          │
--                                      └──────────┘
--                                            ↑
--                                       y-offset 1000
--
-- ┌─────────┬──────────────────┬────────┬────────────────┬─────────────┐
-- │ Output  │ Native mode      │ Scale  │ Layout px      │ Position    │
-- ├─────────┼──────────────────┼────────┼────────────────┼─────────────┤
-- │ DP-12   │ 2560×1440@59.95  │ 1.0    │ 2560 × 1440    │ 0 × 0       │
-- │ DP-11   │ 2560×1440@59.95  │ 1.0    │ 2560 × 1440    │ 2560 × 0    │
-- │ eDP-1   │ 1920×1200@60     │ 1.2    │ 1600 × 1000    │ 5120 × 1000 │
-- └─────────┴──────────────────┴────────┴────────────────┴─────────────┘

hl.monitor({
	output = "DP-12",
	mode = "2560x1440@59.95",
	position = "0x0",
	scale = 1,
})

hl.monitor({
	output = "DP-11",
	mode = "2560x1440@59.95",
	position = "2560x0",
	scale = 1,
})

hl.monitor({
	output = "eDP-1",
	mode = "1920x1200@60",
	position = "5120x1000",
	scale = 1.2,
})
