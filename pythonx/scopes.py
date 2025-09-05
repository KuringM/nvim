import vim

# math mode
def math():
    # 在 markdown 文件时，先排除标题和代码块
    ft = vim.eval("&filetype")
    if ft == "markdown":
        syn = vim.eval("synIDattr(synID(line('.'), col('.'), 1), 'name')")
        if "mkdNonListItemBlock" in syn :
            return False

    # 调用 vimtex 的函数 (仍然保留 tex 文件的支持)
    return vim.eval("vimtex#syntax#in_mathzone()") == "1"

# Text Mode
def text():
    return vim.eval("vimtex#syntax#in_mathzone()") == "0"

# Text Mode
def html_text():
    return vim.eval("&filetype") == "html" and vim.eval("vimtex#syntax#in_mathzone()") == "0"
