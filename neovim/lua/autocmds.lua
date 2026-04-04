require "nvchad.autocmds"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.yaml", "*.yml", "*.tpl" },
  callback = function()
    local dir = vim.fn.expand "%:p:h"
    while dir ~= "/" do
      if vim.fn.filereadable(dir .. "/Chart.yaml") == 1 then
        vim.bo.filetype = "helm"
        return
      end
      dir = vim.fn.fnamemodify(dir, ":h")
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then
      return
    end

    if client.name == "vtsls" then
      -- Define a command to organize imports
      vim.api.nvim_buf_create_user_command(args.buf, "OrganizeImports", function()
        vim.lsp.buf.code_action {
          context = { only = { "source.organizeImports" }, diagnostics = {} },
          apply = true,
        }
      end, { desc = "Organize imports using vtsls" })
    elseif client.name == "eslint" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        command = "LspEslintFixAll",
      })
    end
  end,
})

-- auto close location lists
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.api.nvim_buf_set_keymap(0, "n", "<CR>", "<CR>:cclose<CR>", { noremap = true, silent = true })
  end,
})

-- vim.api.nvim_create_autocmd("BufDelete", {
--   callback = function()
--     local bufs = vim.t.bufs
--     if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
--       vim.cmd "Nvdash"
--     end
--   end,
-- })
