local status, cmp = pcall(require, "cmp")
if not status then
    vim.notify("未找到 cmp")
    return
end

cmp.setup({
    -- ghost text
    experimental = {
        ghost_text = true,
    },
    -- 设置中文也能触发
    completion = {
        -- autocomplete = false,
        -- keyword_length = 1,
        keyword_pattern = "[\\u4e00-\\u9fa5a-zA-Z^0-9]",
    },
    -- 指定 snippet 引擎
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    -- 补全源
    sources = cmp.config.sources({
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
    }),

    -- 快捷键设置
    mapping = require("keybindings").cmp(cmp),
    -- 使用Lspkind-nvim显示类型图标
    formatting = require("lsp.ui").formatting,
    sorting = {
        priority_width = 2,
        comparators = {
            require("copilot_cmp.comparators").prioritize,
            require("copilot_cmp.comparators").score,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer" },
    },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
