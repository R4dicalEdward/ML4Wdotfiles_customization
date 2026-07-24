return {
  -- Core engine (Lua replacement, security-friendly)
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    dependencies = {
      { "copilotlsp-nvim/copilot-lsp",  -- NES (experimental)
        init = function()
          vim.g.copilot_nes_debounce = 500
        end,
      },
    },
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {
          -- Explicitly block sensitive HPC filetypes
          sh = false,
          bash = false,
          yaml = false,
          toml = false,
          ini = false,
          ["*"] = true,
        },
        -- Restrict to dev work; add GHE URL if on enterprise
        -- auth_provider_url = "https://your-ghe.example.com",
      })
    end,
  },

  -- blink.cmp source (matches kickstart-modular default)
  {
    "saghen/blink.cmp",
    dependencies = { "fang2hou/blink-copilot" },
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      opts.sources.default = vim.list_extend(
        opts.sources.default or { "lsp", "path", "snippets", "buffer" },
        { "copilot" }
      )
      opts.sources.providers = vim.tbl_extend("force", opts.sources.providers or {}, {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 90,
          async = true,
        },
      })
      return opts
    end,
  },

  -- Chat (opt-in, manual context control)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = "make tiktoken",
    opts = {
      auto_insert_mode = false,
      show_help = false,
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<CR>",        desc = "[C]opilot [C]hat" },
      { "<leader>ce", "<cmd>CopilotChatExplain<CR>", desc = "[C]opilot [E]xplain" },
      { "<leader>cf", "<cmd>CopilotChatFix<CR>",     desc = "[C]opilot [F]ix" },
    },
  },
}