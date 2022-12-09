local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("没有找到 null-ls")
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    -- Formatting ---------------------
    --  brew install shfmt
    formatting.shfmt,
    -- StyLua
    formatting.stylua,
    -- frontend
    formatting.prettier.with({ -- 只比默认配置少了 markdown
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        -- "graphql",
        "lua_format",
        "markdown",
        "cmake",
        "clang_format",
      },
      prefer_local = "node_modules/.bin",
    }),
    -- formatting.fixjson,
    -- formatting.black.with({ extra_args = { "--fast" } }),
  },
  -- 保存自动格式化
  on_attach = function(client)
    local tmp = false
    if vim.fn.has("nvim-0.8") == 1 then
      tmp = client.server_capabilities.documentFormattingProvider
    else
      tmp =client.resolved_capabilities.document_formatting
    end
    if tmp then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    end
  end,
})
