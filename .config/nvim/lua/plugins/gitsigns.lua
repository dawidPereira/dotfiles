return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup({
        on_attach = function()
          vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "DiffAdd" })
          vim.api.nvim_set_hl(0, "GitSignsChange", { link = "DiffChange" })
          vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "DiffDelete" })
          vim.api.nvim_set_hl(0, "GitSignsTopdelete", { link = "DiffDelete" })
          vim.api.nvim_set_hl(0, "GitSignsChangedelete", { link = "DiffChange" })
        end,
      })
    end,
  },
}
