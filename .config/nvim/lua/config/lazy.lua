local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- lazyvim core
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- language extras
    { import = "lazyvim.plugins.extras.lang.clojure" },
    { import = "lazyvim.plugins.extras.lang.go" },
    { import = "lazyvim.plugins.extras.lang.kotlin" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.rust" },

    -- user plugins & overrides
    { import = "plugins" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",        -- legacy vim archive unpacker
        "tarPlugin",   -- legacy tar viewer
        "tohtml",      -- ancient :TOhtml syntax-to-html converter
        "tutor",       -- built-in tutorial runner
        "netrwPlugin", -- legacy vim file browser (LazyVim uses Snacks/Neo-tree)
        "rplugin",     -- legacy remote plugin provider scanner
        "spellfile",   -- automated spellfile downloader
      },
    },
  },
})
