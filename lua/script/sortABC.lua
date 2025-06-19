local function sort_bracket_letters()
  local line = vim.api.nvim_get_current_line()

  -- 定义三种括号对
  local brackets = {
    { "%b[]", "%[", "%]" },  -- [ ... ]
    { "%b()", "%(", "%)" },  -- ( ... )
    { "%b{}", "%{", "%}" },  -- { ... }
  }

  for _, b in ipairs(brackets) do
    local pattern, l, r = unpack(b)
    local new_line = line
    local s, e = string.find(new_line, pattern)

    while s do
      local matched = string.sub(new_line, s + 1, e - 1) -- 去掉左右括号
      if matched:match("^[a-zA-Z]+$") then
        local chars = {}
        for c in matched:gmatch(".") do
          table.insert(chars, c)
        end
        table.sort(chars)
        local sorted = table.concat(chars)
        new_line = string.sub(new_line, 1, s) .. sorted .. string.sub(new_line, e)
      end
      s, e = string.find(new_line, pattern, s + 1)
    end

    line = new_line
  end

  vim.api.nvim_set_current_line(line)
end

-- 映射：<leader>sb
vim.keymap.set("n", "<leader>sb", sort_bracket_letters, { desc = "Sort letters in brackets" })
