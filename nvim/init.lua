local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.loader.enable()
vim.g.mapleader = ","

if vim.g.neovide then
    require("neovide")
    --vim.o.guifont = "Fira Code Retina:h14"
elseif vim.g.GuiFont then
    require("nvim-qt")
end

require("lazy").setup("plugins")

-- NvimTree begin
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
-- NvimTree end

vim.opt.encoding = "utf-8"
vim.opt.background = "dark"
vim.opt.number = true
vim.opt.backup = false
vim.opt.mouse = "a"
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.syntax = "enable"
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 500
vim.opt.completeopt = "menu,menuone,noselect"

vim.opt.cul = true -- cursor line

vim.opt.ch = 0     -- command height

-- Disable statusline in dashboard
vim.api.nvim_create_autocmd(
    "FileType", {
        pattern = "alpha",
        callback = function()
            vim.opt.laststatus = 0
        end
    }
)
vim.api.nvim_create_autocmd(
    "BufUnload", {
        buffer = 0,
        callback = function()
            vim.opt.laststatus = 3
        end
    }
)

vim.cmd [[
    let g:gruvbox_material_foreground = "mix"
    let g:gruvbox_material_better_performance = 1
    let g:gruvbox_material_enable_bold = 1
    let g:gruvbox_material_enable_italic = 1
    let g:gruvbox_material_diagnostic_text_highlight = 1
    let g:gruvbox_material_diagnostic_line_highlight = 1
    colorscheme gruvbox-material
]]

vim.cmd [[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=250}]]

vim.cmd [[
" Automatically reload init.lua when it's saved -- Lazy.vim doesn't support this
"augroup AutoReloadVimRC
"    au!
"    au BufWritePost ~/.config/nvim/init.lua so ~/.config/nvim/init.lua
"augroup end

" Enable syntax highlighting for certain filetype extensions
augroup filetype
    au! BufRead,BufNewFile *.ll set filetype=llvm
    au! BufRead,BufNewFile *.td set filetype=tablegen
    au! BufRead,BufNewFile *Makefile* set filetype=make
augroup END

" Spellcheck GIT commit message
autocmd BufRead COMMIT_EDITMSG setlocal spell

" 120 character line coloring
let &colorcolumn=join(range(121, 256), ",")
]]

--[[
" Show whitespace at the end of the lines
"
" hightlight color
highlight WhitespaceEOL ctermbg=DarkYellow guibg=DarkYellow
match WhitespaceEOL /\s\+$/
au BufWinEnter * match WhitespaceEOL /\s\+$/
au InsertEnter * match WhitespaceEOL /\s\+\%#\@<!$/
au InsertLeave * match WhitespaceEOL /\s\+$/
au BufWinLeave * call clearmatches()
let b:show_whitespace = 1
]]
   --

vim.cmd [[
" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Case insensitive search
set ignorecase
]]

map_key = function(mode, key_binding, commands, options)
    local opts = { noremap = true }
    if options then opts = vim.tbl_extend("force", opts, options) end
    vim.api.nvim_set_keymap(mode, key_binding, commands, opts)
end
map_key("n", "<leader>a", "ggVG")
map_key("n", "<leader><C-h>", ":set hlsearch! hlsearch?<CR>")
map_key("n", "+", "<C-a>")
map_key("n", "-", "<C-x>")
map_key("n", "<leader><C-p>", ":Files<CR>")
map_key("n", "<leader>gbt", ":Gitsigns toggle_current_line_blame<CR>")

-- disable some builtin vim plugins
local default_plugins = {
    "2html_plugin", "getscript", "getscriptPlugin", "gzip", "logipat", "netrw",
    "netrwPlugin", "netrwSettings", "netrwFileHandlers", "matchit", "tar",
    "tarPlugin", "rrhelper", "spellfile_plugin", "vimball", "vimballPlugin",
    "zip", "zipPlugin"
}

for _, plugin in pairs(default_plugins) do vim.g["loaded_" .. plugin] = 1 end
