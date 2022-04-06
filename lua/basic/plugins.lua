---@diagnostic disable: undefined-global
-- https://github.com/wbthomason/packer.nvim

local packer = require("packer")
packer.init(
    {
        git = {
            clone_timeout = 180,
            default_url_format = "git@github.com:%s"
        }
    }
)
packer.startup(
    {
        -- 所有插件的安装都书写在 function 中
        function()
            -- 包管理器
            use {
                "wbthomason/packer.nvim"
            }

            -- nvim-tree
            use {
                "kyazdani42/nvim-tree.lua",
                requires = {
                    "kyazdani42/nvim-web-devicons" -- optional, for file icon
                },
                config = function()
                    require("conf.nvim-tree")
                end
            }

            -- 优秀的暗色主题
            use {
                "catppuccin/nvim",
                -- 改个别名，因为它的名字是 nvim，可能会冲突
                as = "catppuccin",
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/catppuccin.lua 文件中的代码
                    require("conf.catppuccin")
                end
            }

            -- feline状态栏插件
            use {
                "feline-nvim/feline.nvim",
                config = function()
                    -- 插件加载完成后自动运行 lua/conf/feline.lua文件中的代码
                    require("feline").setup()
                end
            }

            -- gitsigns git插件
            use {
                "lewis6991/gitsigns.nvim",
                requires = {
                    -- 依赖于该插件（一款 Lua 开发使用的插件）
                    "nvim-lua/plenary.nvim"
                },
                config = function()
                    require("gitsigns").setup()
                end
            }

            -- 支持 LSP 状态的 buffer 栏
            use {
                "akinsho/bufferline.nvim",
                requires = {
                    "famiu/bufdelete.nvim" -- 删除 buffer 时不影响现有布局
                },
                config = function()
                    require("conf.bufferline")
                end
            }

            -- 搜索时显示条目
            use {
                "kevinhwang91/nvim-hlslens",
                config = function()
                    require("conf.nvim-hlslens")
                end
            }

            -- 显示缩进线
            use {
                "lukas-reineke/indent-blankline.nvim",
                config = function()
                    require("conf.indent-blankline")
                end
            }

            -- 自动补全括号
            use {
                "windwp/nvim-autopairs",
                config = function()
                    require("conf.nvim-autopairs")
                end
            }

            -- 快速更改单词
            use {
                "AndrewRadev/switch.vim",
                config = function()
                    require("conf.switch")
                end
            }

            -- 快速跳转
            use {
                "phaazon/hop.nvim",
                config = function()
                    require("conf.hop")
                end
            }

            -- 包裹修改
            use {
                "ur4ltz/surround.nvim",
                config = function()
                    require("conf.surround")
                end
            }

            -- 显示光标下相同词汇
            use {
                "RRethy/vim-illuminate",
                config = function()
                    require("conf.vim-illuminate")
                end
            }

            -- 拼写检查器
            use {
                "lewis6991/spellsitter.nvim",
                config = function()
                    require("conf.spellsitter")
                end
            }

            -- 自动保存
            use {
                "Pocco81/AutoSave.nvim",
                config = function()
                    require("conf.AutoSave")
                end
            }

            -- 自动恢复光标位置
            use {
                "ethanholz/nvim-lastplace",
                config = function()
                    require("conf.nvim-lastplace")
                end
            }

            -- 自动会话管理
            use {
                "rmagatti/auto-session",
                config = function()
                    require("conf.auto-session")
                end
            }

            -- 全局替换
            use {
                "nvim-pack/nvim-spectre",
                requires = {
                    "nvim-lua/plenary.nvim", -- Lua 开发模块
                    "BurntSushi/ripgrep" -- 文字查找
                },
                config = function()
                    require("conf.nvim-spectre")
                end
            }

            -- 显示网页色
            use {
                "norcalli/nvim-colorizer.lua",
                config = function()
                    require("conf.nvim-colorizer")
                end
            }

            -- 内置终端
            use {
                "akinsho/toggleterm.nvim",
                config = function()
                    require("conf.toggleterm")
                end
            }

            -- undo tree
            use {
                "mbbill/undotree",
                config = function()
                    require("conf.undotree")
                end
            }

            -- 键位绑定器
            use {
                "folke/which-key.nvim",
                config = function()
                    require("conf.which-key")
                end
            }

            -- 精美弹窗
            use {
                "rcarriga/nvim-notify",
                config = function()
                    require("conf.nvim-notify")
                end
            }

            -- todo tree
            use {
                "folke/todo-comments.nvim",
                config = function()
                    require("conf.todo-comments")
                end
            }

            -- 模糊查找
            use {
                "nvim-telescope/telescope.nvim",
                requires = {
                    "nvim-lua/plenary.nvim", -- Lua 开发模块
                    "BurntSushi/ripgrep", -- 文字查找
                    "sharkdp/fd" -- 文件查找
                },
                config = function()
                    require("conf.telescope")
                end
            }

            -- Coc.nvim
            use {"neoclide/coc.nvim", branch = "release"}

            -- -- LSP 基础服务
            -- use {
            --     "neovim/nvim-lspconfig",
            --     config = function()
            --         require("conf.nvim-lspconfig")
            --     end
            -- }
            --
            -- -- 自动安装 LSP
            -- use {
            --     "williamboman/nvim-lsp-installer",
            --     config = function()
            --         require("conf.nvim-lsp-installer")
            --     end
            -- }
            --
            -- -- LSP UI 美化
            -- use {
            --     "tami5/lspsaga.nvim",
            --     config = function()
            --         require("conf.lspsaga")
            --     end
            -- }

            -- treesitter
            use {
                "nvim-treesitter/nvim-treesitter",
                run = ":TSUpdate",
                requires = {
                    "p00f/nvim-ts-rainbow"
                },
                config = function()
                    require("conf.nvim-treesitter")
                end
            }

            -- git copilot
            use {
                "github/copilot.vim",
                config = function()
                    require("conf.copilot")
                end
            }

            -- 代码注释
            use {
                "numToStr/Comment.nvim",
                requires = {
                    "JoosepAlviste/nvim-ts-context-commentstring"
                },
                config = function()
                    require("conf.Comment")
                end
            }

            -- 代码格式化
            use {
                "sbdchd/neoformat",
                config = function()
                    require("conf.neoformat")
                end
            }

            -- 代码调试基础插件
            use {
                "mfussenegger/nvim-dap",
                config = function()
                    require("conf.nvim-dap")
                end
            }

            -- 为代码调试提供内联文本
            use {
                "theHamsta/nvim-dap-virtual-text",
                requires = {
                    "mfussenegger/nvim-dap"
                },
                config = function()
                    require("conf.nvim-dap-virtual-text")
                end
            }

            -- 为代码调试提供 UI 界面
            use {
                "rcarriga/nvim-dap-ui",
                requires = {
                    "mfussenegger/nvim-dap"
                },
                config = function()
                    require("conf.nvim-dap-ui")
                end
            }

            -- 显示滚动条
            use {
                "petertriho/nvim-scrollbar",
                config = function()
                    require("conf.nvim-scrollbar")
                end
            }

            -- 多光标模式
            use {
                "terryma/vim-multiple-cursors",
                config = function()
                    require("conf.vim-multiple-cursors")
                end
            }

            -- tagbar
            -- use {
            --     "majutsushi/tagbar"
            -- }
            -- -- LSP 进度提示
            -- use {
            --     "j-hui/fidget.nvim",
            --     config = function()
            --         require("conf.fidget")
            --     end
            -- }
            --
            -- -- 插入模式获得函数签名
            -- use {
            --     "ray-x/lsp_signature.nvim",
            --     config = function()
            --         require("conf.lsp_signature")
            --     end
            -- }
            --
            -- -- 灯泡提示代码行为
            -- use {
            --     "kosayoda/nvim-lightbulb",
            --     config = function()
            --         require("conf.nvim-lightbulb")
            --     end
            -- }
        end,
        -- 使用浮动窗口
        config = {
            display = {
                open_fn = require("packer.util").float
            }
        }
    }
)

-- 实时生效配置
vim.cmd(
    [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]
)
