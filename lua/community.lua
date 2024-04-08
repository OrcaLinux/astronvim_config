-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- change the colorscheme
  { import = "astrocommunity.colorscheme.kanagawa-nvim" },
  -- chage the status bar style
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
}
