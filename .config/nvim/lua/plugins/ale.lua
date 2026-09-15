return {
  {
  'dense-analysis/ale',
  config = function()
    -- Configuration goes here.
    local g = vim.g

    -- g.ale_close_preview_on_insert = 1
    g.ale_cursor_detail = 1
    -- g.ale_detail_to_floating_preview = 1
    g.ale_echo_cursor = 1
    g.ale_echo_msg_error_str = ""
    g.ale_echo_msg_format = '%severity% %code% (%linter%) %s'
    g.ale_echo_msg_info_str = ""
    g.ale_echo_msg_warning_str = ""
    -- g.ale_floating_window_border = {'│', '─', '╭', '╮', '╯', '╰', '│', '─'}
    g.ale_keep_list_window_open = 0
    g.ale_lint_delay = 10000
    g.ale_lint_on_save = 1
    g.ale_list_vertical = 0
    g.ale_list_window_size = 3
    g.ale_open_list = 0
    g.ale_sign_column_always = 1
    g.ale_sign_error = ""
    g.ale_sign_highlight_linenrs = 1
    g.ale_sign_info = ""
    g.ale_sign_style_error = '>>'
    g.ale_sign_style_warning = '>'
    g.ale_sign_warning = ""
    g.ale_use_global_executables = 1
    g.ale_vim_vint_show_style_issues = 0
    g.ale_xml_xmllint_indentsize = 2
    g.ale_python_flake8_options = "--extend-ignore=E501,I001"

    local ale_linters = {}
    ale_linters.css = { "stylelint" }
    ale_linters.javascript = { "eslint" }
    ale_linters.less = { "stylelint" }
    ale_linters.lua = { "luacheck" }
    ale_linters.python = { "flake8" }
    ale_linters.xml = { "xmllint" }
    vim.g.ale_linters = ale_linters

    local ale_fixers = {}
    ale_fixers.css = {'stylelint','remove_trailing_lines','trim_whitespace'}
    ale_fixers.html = {'html-beautify','remove_trailing_lines','trim_whitespace'}
    ale_fixers.xml = {'xmllint','remove_trailing_lines','trim_whitespace'}
    ale_fixers.svg = {'xmllint','remove_trailing_lines','trim_whitespace'}
    ale_fixers.javascript = { 'eslint','remove_trailing_lines','trim_whitespace' }
    ale_fixers.less = {'stylelint','remove_trailing_lines','trim_whitespace'}
    ale_fixers.python = { "remove_trailing_lines","trim_whitespace", }
    ale_fixers.vim = {'remove_trailing_lines','trim_whitespace'}
    ale_fixers.typescript = {'remove_trailing_lines','trim_whitespace'}
    ale_fixers.typescriptreact = {'remove_trailing_lines','trim_whitespace'}
    vim.g.ale_fixers = ale_fixers

    local ale_pattern_options = {}
    ale_pattern_options["\\.user\\.css$"] = {
      ale_fixers = { "stylelint", "trim_whitespace" },
      ale_linters = { "stylelint" }
    }
    ale_pattern_options["\\.min\\.js$"] = {
      ale_enabled = 0
    }
    ale_pattern_options["\\.min\\.mjs$"] = {
      ale_enabled = 0
    }
    ale_pattern_options["\\.min\\.cjs$"] = {
      ale_enabled = 0
    }
    ale_pattern_options["\\.min\\.css$"] = {
      ale_enabled = 0
    }
    ale_pattern_options["\\.user\\.js$"] = {
      ale_fixers = { "remove_trailing_lines", "trim_whitespace", "eslint" },
      ale_linters = { "eslint" }
    }
    ale_pattern_options["\\.cjs$"] = {
      ale_fixers = { "remove_trailing_lines", "trim_whitespace", "tsserver" },
      ale_linters = { "tsserver" }
    }
    ale_pattern_options["\\.user\\.less$"] = {
      ale_fixers = { "stylelint", "trim_whitespace" },
      ale_linters = { "stylelint" }
    }
    ale_pattern_options["init\\.vim$"] = {
      ale_fixers = { "vint", "trim_whitespace" },
      ale_linters = { "vint" }
    }
    ale_pattern_options["plugins\\.lua$"] = {
      ale_fixers = { "remove_trailing_lines", "trim_whitespace" },
      ale_linters = { "luacheck" }
    }
    ale_pattern_options["README\\.md$"] = {
      ale_fixers = { "remove_trailing_lines", "trim_whitespace" },
      ale_linters = { "cocmarkdownlint" }
    }
    ale_pattern_options["\\.nvim\\.md$"] = {
      ale_enabled = 0
    }
    ale_pattern_options["\\node-modules\\.md$"] = {
      ale_enabled = 0
    }

    vim.g.ale_pattern_options = ale_pattern_options

    vim.cmd([[
    function! IsAleLintingNow()
      return ale#engine#IsCheckingBuffer(bufnr()) ? "\uf0fc \uF254" : "\uf0fc \uf00c"
    endfunction]])
  end
}
}
