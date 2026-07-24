local grp = vim.api.nvim_create_augroup("CommitMsgConfig", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
    group = grp,
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.textwidth = 72        -- Set maximum width to 72 characters
        vim.opt_local.colorcolumn = "73"    -- Display a visual guide at column 73
        vim.opt_local.spell = true          -- Enable spell checking
        vim.opt_local.spelllang = "en_us"   -- Set spell checking language to US English
    end,
})