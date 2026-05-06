require("tokyonight").setup {
   style = "night",
   transparent = true,
   styles = {
      sidebars = "transparent",
      floats = "transparent",
   },
   on_colors = function(colors)
      colors.fg_gutter = colors.purple
   end,
   on_highlights = function(highlights, colors)
      highlights.Folded = {
         bg = colors.bg,
         fg = colors.comment
      }

      highlights.LspReferenceText.bg = colors.bg_highlight
      highlights.LspReferenceRead.bg = colors.bg_highlight
      highlights.LspReferenceWrite.bg = colors.bg_highlight

      highlights.TabLine.bg = "NONE"
      highlights.TabLineFill.bg = "NONE"
      highlights.StatusLine.fg = colors.fg_gutter
      highlights.StatusLine.bg = "NONE"
      highlights.StatusLineNC.fg = colors.fg_gutter
      highlights.StatusLineNC.bg = "NONE"
   end,
}

vim.cmd("colorscheme tokyonight")
