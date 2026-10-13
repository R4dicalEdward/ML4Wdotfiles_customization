-- Monitor profile: dual external + internal at HOME
-- Left to right: Samsung LC27G5xT (DP-7) → LG HDR 4K (HDMI-A-1)
--                → ThinkPad T14 Gen 5 internal (eDP-1), seated lower
--
-- PPI analysis:
--   Samsung (DP-7):    2560 px / 600 mm × 25.4 ≈ 108.4 PPI
--   LG (HDMI-A-1):     3840 px / 600 mm × 25.4 ≈ 162.6 PPI
--   eDP-1:             1920 px / 300 mm × 25.4 ≈ 162.6 PPI
--
-- eDP-1 is the fixed scaling reference (never inverted). LG shares
-- eDP-1's PPI exactly, so LG = eDP-1 scale gives an exact content
-- match. Samsung is exactly 2/3 as dense, so its matching scale is
-- eDP_scale * (108.4/162.6) = eDP_scale * 2/3.
--
-- At the "matched" preset (eDP 1.2 / LG 1.2 / Samsung 0.8):
--   Samsung layout: 2560/0.8 x 1440/0.8 = 3200 x 1800
--   LG layout:      3840/1.2 x 2160/1.2 = 3200 x 1800  (identical!)
--   eDP-1 layout:   1920/1.2 x 1200/1.2 = 1600 x 1000
-- Every scale is a clean fraction and every layout dimension is a
-- whole number — no sub-pixel rounding anywhere.
--
-- ┌──────────────┬─────────┬────────┬────────┬───────────────┬──────────────┐
-- │ Preset       │ Samsung │  LG    │ eDP-1  │ Samsung/LG lay │  Δ content   │
-- ├──────────────┼─────────┼────────┼────────┼───────────────┼──────────────┤
-- │ 1 · matched  │  0.8    │  1.2   │  1.2   │ 3200x1800 both │  0 % (exact) │
-- │   (default)  │         │        │        │                │              │
-- │ 2 · sharp    │  1.0    │  1.0   │  1.0   │ 2560x1440 /    │ Samsung 50%  │
-- │              │         │        │        │ 3840x2160      │ larger than  │
-- │              │         │        │        │                │ LG (same PPI │
-- │              │         │        │        │                │ as eDP, so   │
-- │              │         │        │        │                │ LG=eDP size) │
-- └──────────────┴─────────┴────────┴────────┴───────────────┴──────────────┘
--
-- Preset 1 is the recommended default: exact size match across all
-- three panels, zero fractional-scale artifacts. Preset 2 is the
-- integer-scale fallback (sharpest possible per-panel rendering,
-- at the cost of Samsung content appearing 50% larger than the
-- other two — expected, since Samsung is the least dense panel).
--
-- eDP-1 sits to the right of LG, vertically nudged below centre to
-- match the physical desk arrangement (laptop lower than the
-- monitor arms).
--
-- To switch preset: change PRESET below, then run `hyprctl reload`.

-- ── Preset selector ──────────────────────────────────────────────
-- 1 = matched  Samsung 0.8 / LG 1.2 / eDP 1.2  — exact match (default)
-- 2 = sharp    Samsung 1.0 / LG 1.0 / eDP 1.0  — all-integer, sizes differ
local PRESET = 2

-- ── Shared constants ─────────────────────────────────────────────
local SAMSUNG_MODE  = "2560x1440@59.95"
local SAMSUNG_PX_W, SAMSUNG_PX_H = 2560, 1440

local LG_MODE       = "3840x2160@60"
local LG_PX_W, LG_PX_H = 3840, 2160

local EDP_MODE      = "1920x1200@60"
local EDP_PX_W, EDP_PX_H = 1920, 1200

local EDP_Y_NUDGE   = 30   -- px below vertical centre against LG

-- ── Preset definitions ───────────────────────────────────────────
local presets = {
    [1] = { label = "matched", samsung_scale = 0.8, lg_scale = 1.2, edp_scale = 1.2 },
    [2] = { label = "sharp",   samsung_scale = 1.0, lg_scale = 1.5, edp_scale = 1.0 },
}

-- ── Derive geometry ──────────────────────────────────────────────
local p = presets[PRESET]

local samsung_w = math.floor(SAMSUNG_PX_W / p.samsung_scale + 0.5)
local samsung_h = math.floor(SAMSUNG_PX_H / p.samsung_scale + 0.5)

local lg_w = math.floor(LG_PX_W / p.lg_scale + 0.5)
local lg_h = math.floor(LG_PX_H / p.lg_scale + 0.5)

local edp_w = math.floor(EDP_PX_W / p.edp_scale + 0.5)
local edp_h = math.floor(EDP_PX_H / p.edp_scale + 0.5)

-- Left to right: Samsung, LG, eDP-1
local samsung_x, samsung_y = 0, 0
local lg_x, lg_y           = samsung_w, 0
local edp_x                = lg_x + lg_w
local edp_y                = math.floor((lg_h - edp_h) / 2) + EDP_Y_NUDGE

-- ── Apply ────────────────────────────────────────────────────────
hl.monitor({
    output = "desc:Samsung Electric Company LC27G5xT H4ZR202347",
    mode     = SAMSUNG_MODE,
    position = string.format("%dx%d", samsung_x, samsung_y),
    scale    = p.samsung_scale,
})

hl.monitor({
    output = "desc:LG Electronics LG HDR 4K 0x00008FF7",
    mode     = LG_MODE,
    position = string.format("%dx%d", lg_x, lg_y),
    scale    = p.lg_scale,
})

hl.monitor({
    output   = "eDP-1",
    mode     = EDP_MODE,
    position = string.format("%dx%d", edp_x, edp_y),
    scale    = p.edp_scale,
})
