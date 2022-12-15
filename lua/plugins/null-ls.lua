local status, null_ls = pcall(require, "null-ls")
if not status then
    vim.notify("没有找到 null-ls")
    return
end

local clang_format_path = vim.fn.stdpath("config") .. "/static/clang-format"

null_ls.setup({
    debug = true,
    sources = {
        null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.spell,
        -- null_ls.builtins.diagnostics.cpplint,
        null_ls.builtins.formatting.clang_format.with({
            extra_args = { "-style", "file:" .. clang_format_path },
        }),
    },
    -- -- 保存自动格式化
    on_attach = function(client)
        local tmp = false
        if vim.fn.has("nvim-0.8") == 1 then
            tmp = client.server_capabilities.documentFormattingProvider
        else
            tmp = client.resolved_capabilities.document_formatting
        end
        if tmp then
            vim.cmd("autocmd BufWritePre <buffer> lua require('tools').format_with_view()")
        end
    end,
})
