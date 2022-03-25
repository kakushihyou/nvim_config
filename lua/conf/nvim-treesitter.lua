require "nvim-treesitter.configs".setup(
    {
        -- 安装 language parser
        -- :TSInstallInfo 命令查看支持的语言
        ensure_installed = {
            "gomod",
            "java",
            "http",
            "markdown",
            "vue",
            "go",
            "rust",
            "toml",
            "yaml",
            "json",
            "lua",
            "html",
            "css",
            "vim",
            "lua",
            "javascript",
            "typescript",
            "tsx"
        },
        -- 启用代码高亮功能
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false
        },
        -- 启用增量选择
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>",
                node_incremental = "<CR>",
                node_decremental = "<BS>",
                scope_incremental = "<TAB>"
            }
        },
        -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
        indent = {
            enable = true
        },
        -- 彩虹括号
        rainbow = {
            enable = true,
            extended_mode = true
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
        },
        -- 根据当前上下文定义文件类型，由 nvim-ts-context-commentstring 插件提供
        context_commentstring = {
            enable = true
        }
    }
)
-- 开启 Folding
--vim.wo.foldmethod = 'expr'
--vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
--vim.wo.foldlevel = 99
