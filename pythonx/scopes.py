import vim

# math mode
def math():
	return vim.eval("vimtex#syntax#in_mathzone()") == "1"

# Text Mode
def text():
    return vim.eval("vimtex#syntax#in_mathzone()") == "0"
