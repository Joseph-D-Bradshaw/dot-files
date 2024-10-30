local M = {}

function M.complete_task()
  local date = os.date("%Y-%m-%d")
  -- Move to the end of the current line and append the completion text
  vim.api.nvim_command("normal! A [completion:: " .. date .. "]")
end

vim.api.nvim_create_user_command("Kill me", M.complete_task, {})

return M
