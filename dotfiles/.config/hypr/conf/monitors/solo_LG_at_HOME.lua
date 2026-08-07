-- Monitor profile: solo LG external at HOME
-- LG HDR 4K (HDMI-A-1) + ThinkPad T14 Gen 5 internal (eDP-1)
--
-- PPI analysis — both panels share identical pixel density:
--   eDP-1:    1920 px / 300 mm × 25.4 ≈ 162.6 PPI  (reference)
--   HDMI-A-1: 3840 px / 600 mm × 25.4 ≈ 162.6 PPI
--
-- eDP-1 is the scaling reference, held at 1.0 in all presets.
-- HDMI-A-1 is scaled upward; higher scale = larger content,
-- less logical real estate.
--
-- eDP-1 is placed to the right of HDMI-A-1. x is always
-- math.floor(3840 / hdmi_scale). y centres eDP-1 vertically
-- against HDMI-A-1's logical canvas; adjust to match your desk.
--
-- ┌──────────────┬────────┬────────┬─────────────┬─────────────┬──────────────────────┐
-- │ Preset       │  eDP-1 │  HDMI  │ eDP layout  │ HDMI layout │ HDMI content vs eDP  │
-- ├──────────────┼────────┼────────┼─────────────┼─────────────┼──────────────────────┤
-- │ 1 · exact    │   1.0  │   1.0  │ 1920 × 1200 │ 3840 × 2160 │    0 % (exact match) │
-- │ 2 · balanced │   1.0  │   1.5  │ 1920 × 1200 │ 2560 × 1440 │   50 % larger        │
-- │ 3 · sharp    │   1.0  │   2.0  │ 1920 × 1200 │ 1920 × 1080 │  100 % larger        │
-- │   (default)  │        │        │             │  (integer!) │                      │
-- └──────────────┴────────┴────────┴─────────────┴─────────────┴──────────────────────┘
--
-- Preset 3 uses integer scaling on HDMI-A-1 (2×) — every logical
-- pixel maps to exactly 4 physical pixels, giving the sharpest
-- possible output on the 4K panel.
--
-- To switch preset: change PRESET below, then run `hyprctl reload`.

-- ── Preset selector ──────────────────────────────────────────────
-- 1 = exact     eDP 1.0 / HDMI 1.0  — equal content size
-- 2 = balanced  eDP 1.0 / HDMI 1.5  — HDMI content 50 % larger
-- 3 = sharp     eDP 1.0 / HDMI 2.0  — HDMI integer-scaled (default)
local PRESET = 3

-- ── Preset definitions ───────────────────────────────────────────
local presets = {
    [1] = {
        label      = "exact",
        hdmi_scale = 1.0,
        edp_scale  = 1.0,
        -- HDMI layout: 3840×2160  eDP layout: 1920×1200
        -- y: (2160 - 1200) / 2 = 480 (centred)
        edp_y      = 480,
    },
    [2] = {
        label      = "balanced",
        hdmi_scale = 1.5,
        edp_scale  = 1.0,
        -- HDMI layout: 2560×1440  eDP layout: 1920×1200
        -- y: (1440 - 1200) / 2 = 120, +30 below centre = 150
        edp_y      = 150,
    },
    [3] = {
        label      = "sharp",
        hdmi_scale = 2.0,   -- integer scale: sharpest 4K rendering
        edp_scale  = 1.0,
        -- HDMI layout: 1920×1080  eDP layout: 1920×1200
        -- eDP is taller than HDMI in layout space; anchor at y=0
        edp_y      = 0,
    },
}

-- ── Apply selected preset ────────────────────────────────────────
local p     = presets[PRESET]
local edp_x = math.floor(3840 / p.hdmi_scale)

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "3840x2160@60",
    position = "0x0",
    scale    = p.hdmi_scale,
})

hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1200@60",
    position = string.format("%dx%d", edp_x, p.edp_y),
    scale    = p.edp_scale,
})