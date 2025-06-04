local function escape_html(str)
  return str
    :gsub("&", "&amp;")
    :gsub("<", "&lt;")
    :gsub(">", "&gt;")
end

local function convert_tex_to_latex(content)
  -- 行内数学公式 $...$ → \( ... \)，前面允许非转义字符或行首
  content = content:gsub("([^\\])%$(.-)%$", "%1\\(%2\\)")
  return content
end

local function md_to_html(lines)
  local html_lines = {}
  local in_code_block = false
  local in_list = false
  local in_tex_block = false
  local tex_buffer = {}

  for _, line in ipairs(lines) do
    -- ✅ 单行块级数学：$$ ... $$
    if line:match("^%s*%$%$.*%$%$%s*$") and not line:match("^%s*%$%$%s*$") then
      local content = line:match("%$%$(.-)%$%$")
      content = vim.trim(content or "")
      table.insert(html_lines, '<div class="math">')
      table.insert(html_lines, "\\[" .. content .. "\\]")
      table.insert(html_lines, '</div>')

    -- ✅ 多行块级数学：开始或结束 $$
    elseif line:match("^%s*%$%$%s*$") then
      if in_tex_block then
        table.insert(html_lines, '<div class="math">')
        table.insert(html_lines, "\\[")
        vim.list_extend(html_lines, tex_buffer)
        table.insert(html_lines, "\\]")
        table.insert(html_lines, '</div>')
        tex_buffer = {}
        in_tex_block = false
      else
        in_tex_block = true
      end

    elseif in_tex_block then
      table.insert(tex_buffer, line)

    elseif line:match("^```") then
      if in_code_block then
        table.insert(html_lines, "</pre>")
        in_code_block = false
      else
        table.insert(html_lines, "<pre>")
        in_code_block = true
      end

    elseif in_code_block then
      table.insert(html_lines, escape_html(line))

    elseif line:match("^#") then
      local level = line:match("^(#+)"):len()
      local content = line:match("^#+%s*(.*)")
      content = convert_tex_to_latex(content)
      table.insert(html_lines, string.format("<h%d>%s</h%d>", level, content, level))

    elseif line:match("^%s*[-*+]%s+") then
      if not in_list then
        table.insert(html_lines, "<ul>")
        in_list = true
      end
      local content = line:match("^%s*[-*+]%s+(.*)")
      content = convert_tex_to_latex(content)
      table.insert(html_lines, "<li>" .. content .. "</li>")

    else
      if in_list then
        table.insert(html_lines, "</ul>")
        in_list = false
      end

      local content = line
        :gsub("%*%*(.-)%*%*", "<strong>%1</strong>")
        :gsub("%*(.-)%*", "<em>%1</em>")
      content = convert_tex_to_latex(content)

      if content:match("%S") then
        table.insert(html_lines, "<p>" .. content .. "</p>")
      else
        table.insert(html_lines, "")
      end
    end
  end

  if in_list then table.insert(html_lines, "</ul>") end
  if in_code_block then table.insert(html_lines, "</pre>") end
  if in_tex_block then
    table.insert(html_lines, '<div class="math">')
    table.insert(html_lines, "\\[")
    vim.list_extend(html_lines, tex_buffer)
    table.insert(html_lines, "\\]")
    table.insert(html_lines, '</div>')
  end

  return html_lines
end

local function convert_md_to_html()
  local input_file = vim.api.nvim_buf_get_name(0)
  if not input_file:match("%.md$") then
    print("当前文件不是 Markdown 文件")
    return
  end

  local output_file = input_file:gsub("%.md$", ".html")
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local html_body = md_to_html(lines)

  local html_output = {
    "<!DOCTYPE html>",
    "<html>",
    "<head>",
    "<meta charset='UTF-8'>",
    "<title>Markdown</title>",
    -- ✅ MathJax 脚本注入
    "<script src='https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js'></script>",
    "</head>",
    "<body>",
  }
  vim.list_extend(html_output, html_body)
  table.insert(html_output, "</body>")
  table.insert(html_output, "</html>")

  local f = io.open(output_file, "w")
  if f then
    for _, line in ipairs(html_output) do
      f:write(line .. "\n")
    end
    f:close()
    print("已生成 HTML 文件：" .. output_file)
  else
    print("无法写入文件：" .. output_file)
  end
end

vim.api.nvim_create_user_command('ConvertMarkdownToHTML', convert_md_to_html, {})
