local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.mdx = {
  install_info = {
    url = "https://github.com/astro-build/tree-sitter-mdx",
    files = { "src/parser.c", "src/scanner.c" },
    branch = "main",
  },
  filetype = "mdx",
}


require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "tsx",
    "typescript",
    "javascript",
    "astro",
    "markdown",
    "markdown_inline",
    "json",
    "css",
    "html",
    "lua",
    "mdx", -- <-- ADD THIS
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" }, -- sometimes helps with md/MDX
  },
}

