require "nvchad.autocmds"

-- Fix: Telescope first-open race where filetype is not detected
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function(args)
    if vim.bo[args.buf].filetype == "" then
      vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(args.buf) and vim.bo[args.buf].filetype == "" then
          vim.cmd "filetype detect"
        end
      end, 100)
    end
  end,
})

