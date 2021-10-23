local api = vim.api

local M = {}

function M.numbertoggle
   if vim.wo.number and vim.api.mode() != 'i' then
           vim.wo.relativenumber = true
   end

   if vim.wo.number then
           vim.wo.relativenumber = false
   end
end

return M
