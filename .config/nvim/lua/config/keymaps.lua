vim.keymap.set("n", "<A-x>", function()
  Snacks.picker.commands()
end, { desc = "Command Palette" })

vim.api.nvim_create_user_command("Wa", "wa", {})
