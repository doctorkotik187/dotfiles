vim.opt.number = true
vim.opt.relativenumber = false

-- Terminal clipboard (OSC 52)
local osc52 = require("vim.ui.clipboard.osc52")
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = osc52.copy("+"),
    ["*"] = osc52.copy("*"),
  },
  paste = {
    ["+"] = function()
      return { vim.fn.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype('"') }
    end,
    ["*"] = function()
      return { vim.fn.split(vim.fn.getreg('"'), "\n"), vim.fn.getregtype('"') }
    end,
  },
}
