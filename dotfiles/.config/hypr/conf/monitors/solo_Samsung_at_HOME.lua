-- Monitor profile: solo Samsung external at HOME
-- Samsung LC27G5xT (HDMI-A-1) + ThinkPad T14 Gen 5 internal (eDP-1)
--
-- PPI analysis:
--   eDP-1:    1920 px / 300 mm × 25.4 ≈ 162.6 PPI  (reference)
--   HDMI-A-1: 2560 px / 600 mm × 25.4 ≈ 108.4 PPI
--   ratio = 1.5 exactly
--
-- eDP-1 is fixed at scale 1.2 (not 1.0) to render its content
-- slightly larger, per preference. 1.2 divides 1920x1200 evenly
-- into 1600x1000 — a clean integer logical canvas, no rounding.
--
-- Mode is 2560x1440@59.95 in every preset — scale changes the
-- logical canvas, not the signal. Do NOT use the advertised
-- 3840x2160 mode: the panel is native 1440p and would downscale
-- internally.
--
-- ┌──────────────┬───────┬───────┬─────────────┬─────────────┬──────────────┐
-- │ Preset       │ eDP-1 │ HDMI  │ HDMI layout │ eDP layout  │ HDMI content │
-- ├──────────────┼───────┼───────┼─────────────┼─────────────┼──────────────┤
-- │ 1 · sharp    │  1.2  │  1.0  │ 2560 × 1440 │ 1600 × 1000 │  25 % larger │
-- │ 2 · matched  │  1.2  │  0.8  │ 3200 × 1800 │ 1600 × 1000 │   0 % exact  │
-- │   (default)  │       │       │             │             │              │
-- │ 3 · spacious │  1.2  │  2/3  │ 3840 × 2160 │ 1600 × 1000 │  20 % smaller│
-- │              │       │       │  (softest)  │             │  (eDP larger)│
-- └──────────────┴───────┴───────┴─────────────┴─────────────┴──────────────┘
--
-- Preset 2 is now the recommended default: both scales (1.2, 0.8)
-- are clean fractions and both logical canvases are integer —
-- the only preset with an exact content match AND no rounding
-- on either monitor.
--
-- eDP-1 is placed right of HDMI-A-1, 30 px below vertical centre.
-- To switch preset: change PRESET below, then run `hyprctl reload`.
-- To fine-tune eDP-1 size further, EDP_SCALE may be adjusted
-- within 1.1–1.25; note this shifts which HDMI scale achieves
-- an exact match (recompute via the ratio formula in comments
-- above, or just eyeball it and iterate).

-- ── Preset selector ──────────────────────────────────────────────
-- 1 = sharp     HDMI 1.0    — HDMI content 25 % larger
-- 2 = matched   HDMI 0.8    — exact content match (default)
-- 3 = spacious  HDMI 2/3    — HDMI content 20 % smaller, softest
local PRESET = 2

-- ── Shared constants ─────────────────────────────────────────────
local HDMI_MODE    = "2560x1440@59.95"
local HDMI_PX_W    = 2560
local HDMI_PX_H    = 1440
local EDP_MODE     = "1920x1200@60"
local EDP_SCALE    = 1.2           -- within requested 1.1–1.25 range
local EDP_LAYOUT_H = 1200 / EDP_SCALE  -- = 1000
local EDP_Y_NUDGE  = 30            -- px below vertical centre

-- ── Preset definitions ───────────────────────────────────────────
local presets = {
    [1] = { label = "sharp",    hdmi_scale = 1.0   },
    [2] = { label = "matched",  hdmi_scale = 0.8   },
    [3] = { label = "spacious", hdmi_scale = 2 / 3 },
}

-- ── Derive geometry ──────────────────────────────────────────────
local p = presets[PRESET]

local hdmi_layout_w = math.floor(HDMI_PX_W / p.hdmi_scale + 0.5)
local hdmi_layout_h = math.floor(HDMI_PX_H / p.hdmi_scale + 0.5)

-- eDP-1 sits flush to the right, nudged just below centre.
local edp_x = hdmi_layout_w
local edp_y = math.floor((hdmi_layout_h - EDP_LAYOUT_H) / 2) + EDP_Y_NUDGE

-- ── Apply ────────────────────────────────────────────────────────
hl.monitor({
    output   = "desc: Samsung Electric Company LC27G5xT H4ZR202347",
    mode     = HDMI_MODE,
    position = "0x0",
    scale    = p.hdmi_scale,
})

hl.monitor({
    output   = "eDP-1",
    mode     = EDP_MODE,
    position = string.format("%dx%d", edp_x, edp_y),
    scale    = EDP_SCALE,
})
