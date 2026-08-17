-- Monitor profile: solo Samsung external at HOME
-- Samsung LC27G5xT (HDMI-A-1) + ThinkPad T14 Gen 5 internal (eDP-1)
--
-- PPI analysis:
--   eDP-1:    1920 px / 300 mm × 25.4 ≈ 162.6 PPI  (reference)
--   HDMI-A-1: 2560 px / 600 mm × 25.4 ≈ 108.4 PPI
--   ratio = 1.5 exactly
--
-- eDP-1 is the scaling reference, held at 1.0 in all presets.
-- The Samsung is LESS dense than the laptop panel, so at equal
-- scales its content is 50 % larger. Shrinking it requires
-- scale < 1.0 (Hyprland renders a larger logical canvas and
-- downsamples) — this costs text sharpness. See preset notes.
--
-- Mode is 2560x1440@59.95 in every preset — scale changes the
-- logical canvas, not the signal. Do NOT use the advertised
-- 3840x2160 mode: the panel is native 1440p and would downscale
-- internally.
--
-- ┌──────────────┬───────┬───────┬─────────────┬──────────┬──────────────┐
-- │ Preset       │ eDP-1 │ HDMI  │ HDMI layout │ eDP pos  │ HDMI content │
-- ├──────────────┼───────┼───────┼─────────────┼──────────┼──────────────┤
-- │ 1 · native   │  1.0  │  1.0  │ 2560 × 1440 │ 2560×150 │  50 % larger │
-- │   (default)  │       │       │  (sharpest) │          │              │
-- │ 2 · balanced │  1.0  │  0.8  │ 3200 × 1800 │ 3200×330 │  20 % larger │
-- │ 3 · matched  │  1.0  │  2/3  │ 3840 × 2160 │ 3840×510 │   0 % (exact)│
-- │              │       │       │  (softest)  │          │              │
-- └──────────────┴───────┴───────┴─────────────┴──────────┴──────────────┘
--
-- Preset 1 is the recommended default. The 50 % content delta is
-- largely cancelled by viewing distance: the external sits ~1.4×
-- further away than the laptop panel, so angular size is close to
-- matched in practice — and it is the only preset with no
-- fractional scaling anywhere.
--
-- Presets 2 and 3 trade sharpness for a literal size match. Use
-- them only if you compare the two screens side by side often.
--
-- eDP-1 is placed right of HDMI-A-1, 30 px below vertical centre.
-- To switch preset: change PRESET below, then run `hyprctl reload`.

-- ── Preset selector ──────────────────────────────────────────────
-- 1 = native    HDMI 1.0  — no fractional scaling  (default)
-- 2 = balanced  HDMI 0.8  — HDMI content 20 % larger
-- 3 = matched   HDMI 2/3  — exact content size match, softest
local PRESET = 1

-- ── Shared constants ─────────────────────────────────────────────
local HDMI_MODE   = "2560x1440@59.95"
local HDMI_PX_W   = 2560
local HDMI_PX_H   = 1440
local EDP_MODE    = "1920x1200@60"
local EDP_SCALE   = 1.0
local EDP_LAYOUT_H = 1200          -- 1200 / 1.0
local EDP_Y_NUDGE  = 30            -- px below vertical centre

-- ── Preset definitions ───────────────────────────────────────────
local presets = {
    [1] = { label = "native",   hdmi_scale = 1.0   },
    [2] = { label = "balanced", hdmi_scale = 0.8   },
    [3] = { label = "matched",  hdmi_scale = 2 / 3 },
}

-- ── Derive geometry ──────────────────────────────────────────────
local p = presets[PRESET]

-- Logical canvas of HDMI-A-1 under the selected scale.
-- All three scales divide 2560x1440 into whole pixels:
--   1.0 → 2560x1440   0.8 → 3200x1800   2/3 → 3840x2160
local hdmi_layout_w = math.floor(HDMI_PX_W / p.hdmi_scale + 0.5)
local hdmi_layout_h = math.floor(HDMI_PX_H / p.hdmi_scale + 0.5)

-- eDP-1 sits flush to the right, nudged just below centre.
local edp_x = hdmi_layout_w
local edp_y = math.floor((hdmi_layout_h - EDP_LAYOUT_H) / 2) + EDP_Y_NUDGE

-- ── Apply ────────────────────────────────────────────────────────
hl.monitor({
    output   = "HDMI-A-1",
    mode     = HDMI_MODE,
    position = "0x0",
    scale    = p.hdmi_scale,
})

hl.monitor({
    output   = EDP_MODE and "eDP-1",
    mode     = EDP_MODE,
    position = string.format("%dx%d", edp_x, edp_y),
    scale    = EDP_SCALE,
})