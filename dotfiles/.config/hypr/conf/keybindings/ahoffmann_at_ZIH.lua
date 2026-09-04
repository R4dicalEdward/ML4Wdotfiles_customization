-- ~/.config/hypr/conf/keybindings/ahoffmann@ZIH.lua
-- Personal keybindings
-- host: ahoffmann@ZIH

-- Source upstream ML4W defaults.
-- Use dofile() with an absolute path because require() cannot handle
-- filenames containing '@' and does not take absolute paths cleanly.
-- If default.lua is already sourced by hyprland.lua directly, remove
-- the line below to avoid double-loading.
dofile(os.getenv("HOME") .. "/.config/hypr/conf/keybindings/default.lua")
local mainMod = "SUPER"
-- Personal script root
local PERSONAL_SCRIPTS = os.getenv("HOME") .. "/Scripts"

-- Assumption: mainMod is defined in default.lua as a local. If it is not
-- exported into the shared scope, redefine it here:
-- local mainMod = "SUPER"

-- Clipboard / TTS helpers
hl.bind("CTRL + ALT + P",             hl.dsp.exec_cmd(PERSONAL_SCRIPTS .. "/piper_speak_copied_text.sh"))
hl.bind("CTRL + ALT + G",             hl.dsp.exec_cmd(PERSONAL_SCRIPTS .. "/piper_speak_german_copied_text.sh"))
hl.bind("CTRL + ALT + V",             hl.dsp.exec_cmd(PERSONAL_SCRIPTS .. "/remove_line_breaks_from_clipboard_content.sh"))
hl.bind("CTRL + ALT + SHIFT + minus", hl.dsp.exec_cmd(PERSONAL_SCRIPTS .. "/replace_spaces_n_line_breaks_with_underscores.sh"))

-- App launchers
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + ALT + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + ALT + K", hl.dsp.exec_cmd("keepassxc"))
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd("spotify-launcher"))
hl.bind(mainMod .. " + ALT + G", hl.dsp.exec_cmd("telegram-desktop"))
hl.bind(mainMod .. " + ALT + E", hl.dsp.exec_cmd("evolution"))
