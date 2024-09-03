return {
  -- Add themes
  {
    {
      "folke/tokyonight.nvim",
      lazy = false,
      -- enabled = false,
    },
    {
      "catppuccin/nvim",
      lazy = false,
      -- enabled = false,
    },
    {
      "rebelot/kanagawa.nvim",
      lazy = false,
      -- enabled = false,
    },
    {
      "sainnhe/everforest",
      lazy = false,
      config = function()
        vim.g.everforest_background = "hard"
      end,
      -- enabled = false,
    },
    {
      "sainnhe/gruvbox-material",
      lazy = false,
      config = function()
        vim.g.gruvbox_material_background = "hard"
      end,
    },
    {
      "olivercederborg/poimandres.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("poimandres").setup({
          -- leave this setup function empty for default config
          -- or refer to the configuration section
          -- for configuration options
        })
      end,
    },
    {
      "Yazeed1s/oh-lucy.nvim",
      lazy = false,
    },
    {
      "embark-theme/vim",
      lazy = false,
    },
    {
      "shaunsingh/nord.nvim",
      lazy = false,
    },
  },
  -- Configure LazyVim to load themes
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-macchiato",
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Disable inlay hints by default but can still enable them with <leader>uh
      inlay_hints = { enabled = false },
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                -- Disable type checking for pyright
                -- Change vim.g.lazyvim_python_lsp to "basedpyright" for strict type checking
                typeCheckingMode = "off",
              },
            },
          },
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.highlight = {
        enable = true,
        disable = function(_, bufnr)
          local max_filesize = 10000 * 1024 -- 10 MB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(bufnr))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      }
      vim.list_extend(opts.ensure_installed, {
        -- "sql",
        -- "htmldjango",
        -- "gdscript",
        -- "godot_resource",
        -- "wgsl",
        -- "wgsl_bevy",
        -- "norg",
        "zig",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- "html-lsp",
        -- "css-lsp",
        -- "zls",
        -- "mypy",
        -- "ruff",
        -- "sqlfmt",
      })
    end,
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {
      mappings = {
        ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%a&<\\].", register = { cr = false } },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 31,
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- change type
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "", -- this can only be used in the git_status source
            renamed = "󰁕", -- this can only be used in the git_status source
            -- status type
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },

      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false, -- only works on Windows for hidden files/directories
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      window = {
        -- FIX: Borders don't work
        documentation = require("cmp").config.window.bordered(),
        completion = require("cmp").config.window.bordered({
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        }),
      },
      mapping = {
        ["<CR>"] = require("cmp").config.disable,
        -- NOTE: Map Signature help while on insert mode somewhere else
        ["<C-K>"] = function()
          if require("cmp").visible_docs() then
            require("cmp").close_docs()
          else
            require("cmp").open_docs()
          end
        end,
      },
      view = {
        docs = {
          auto_open = false,
        },
      },
    },
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    -- version = "1.8.37",
    config = function()
      vim.g.codeium_no_map_tab = true
      vim.keymap.set("i", "<M-;>", function()
        return vim.fn["codeium#Accept"]()
      end, {
        expr = true,
        noremap = true,
        desc = "Codeium Accept",
      })
    end,
  },
  {
    "mg979/vim-visual-multi",
    init = function()
      vim.g.VM_default_mappings = 0
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Select Cursor Up"] = "<M-C-Up>",
        ["Select Cursor Down"] = "<M-C-Down>",
      }
      vim.g.VM_add_cursor_at_pos_no_mappings = 1
    end,
    keys = {
      {
        "<C-n>",
        mode = { "n", "x", "v" },
        desc = "VM Find Under",
      },
      {
        "<M-C-Up>",
        mode = { "n", "x", "v" },
        desc = "VM Select Cursor Up",
      },
      {
        "<M-C-Down>",
        mode = { "n", "x", "v" },
        desc = "VM Select Cursor Down",
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        command_palette = false,
        lsp_doc_border = true,
      },
      cmdline = {
        view = "cmdline",
      },
      lsp = {
        hover = {
          silent = true,
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      icons = {
        group = " ",
      },
    },
  },
}
