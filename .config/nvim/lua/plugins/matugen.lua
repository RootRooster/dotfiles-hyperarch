-- previously used pywal
-- return {
--   {
--     "RedsXDD/neopywal.nvim",
--     name = "neopywal",
--     lazy = false,
--     priority = 1000,
--     config = function()
--       require("neopywal").setup()
--       vim.cmd.colorscheme("neopywal")
--     end,
--   },
-- }

vim.api.nvim_create_autocmd("Signal", {
  pattern = "SIGUSR1",
  command = "colorscheme matugen",
})
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = {
          normal = { c = { bg = "NONE" } },
          inactive = { c = { bg = "NONE" } },
          insert = { c = { bg = "NONE" } },
          visual = { c = { bg = "NONE" } },
          replace = { c = { bg = "NONE" } },
          command = { c = { bg = "NONE" } },
        },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "matugen",
    },
  },
}
