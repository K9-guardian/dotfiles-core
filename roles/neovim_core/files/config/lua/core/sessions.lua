local tty_id = vim.fn.system(
   'readlink /proc/' .. vim.fn.getpid() .. '/fd/0'
):match('(%d+)%s*$')

if not tty_id then return end

if not vim.g.sessiondir then
   vim.g.sessiondir = vim.fn.expand('~/.local/share/nvim/sessions')
end

-- Generate unique path for this session
local function get_session_path()
   local sanitized_cwd = vim.fn.getcwd():gsub('[/\\]', '%%')
   local session_cwd_dir = vim.g.sessiondir .. '/' .. sanitized_cwd

   -- Create directory for sessions
   if vim.fn.isdirectory(session_cwd_dir) == 0 then
      vim.fn.mkdir(session_cwd_dir, 'p')
   end

   return session_cwd_dir .. '/' .. tty_id .. '.vim'
end

-- Add any additional session options if necessary
-- vim.opt.sessionoptions:append("")

-- Group for all session-related autocommands
vim.api.nvim_create_augroup("auto_session", {})

-- Save session on write and buffer exit
vim.api.nvim_create_autocmd({ "VimLeave", "VimLeavePre", "BufWritePost" }, {
   group = "auto_session",
   callback = function()
      -- Don't save sessions for temporary buffers
      if vim.bo.filetype == 'gitcommit'
          or vim.bo.filetype == 'help' then
         return
      end
      vim.cmd('mksession! ' .. vim.fn.fnameescape(get_session_path()))
   end,
})

-- Load session on starting nvim. Can be disabled with `NVIM_NO_AUTO_SESSION=1 nvim`.
vim.api.nvim_create_autocmd("VimEnter", {
   group = "auto_session",
   nested = true, -- Trigger syntax/plugins after loading session
   callback = function()
      if vim.fn.argc() == 0 and not vim.env.NVIM_NO_AUTO_SESSION then
         local session_path = get_session_path()
         if vim.fn.filereadable(session_path) == 1 then
            vim.cmd('source ' .. vim.fn.fnameescape(session_path))
         end
      end
   end,
})
