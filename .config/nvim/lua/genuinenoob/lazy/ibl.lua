return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },

      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = true,
      },

      whitespace = {
        remove_blankline_trail = true,
      },

      exclude = {
        filetypes = {
          "help",
          "dashboard",
          "lazy",
          "mason",
          "notify",
          "terminal",
          "alpha",
          "neo-tree",
          "NvimTree",
        },
        buftypes = {
          "terminal",
          "nofile",
          "quickfix",
          "prompt",
        },
      },
    },
  },
}
