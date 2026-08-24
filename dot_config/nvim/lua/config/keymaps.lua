vim.keymap.set("n", "<A-x>", function()
  Snacks.picker.commands()
end, { desc = "Command Palette" })
