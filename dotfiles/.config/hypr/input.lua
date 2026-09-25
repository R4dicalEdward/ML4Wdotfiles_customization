-- -----------------------------------------------------
-- Input
-- -----------------------------------------------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "umlaut",          -- custom variant from ~/.config/xkb
        kb_model   = "",
        kb_options = "grp:win_space_toggle",  -- keep if you also want DE layout toggle
        kb_rules   = "",

        numlock_by_default = true,

        follow_mouse = 1,
        sensitivity  = 0,

        touchpad = {
            natural_scroll = false,
        },
    },
})