require("typst-preview").setup {
   -- Custom format string to open the output link provided with %s
   -- Example: open_cmd = 'firefox %s -P typst-preview --class typst-preview'
   open_cmd = "chromium-browser %s",

   -- Setting this to 'always' will invert black and white in the preview
   -- Setting this to 'auto' will invert depending if the browser has enable
   -- dark mode
   -- Setting this to '{"rest": "<option>","image": "<option>"}' will apply
   -- your choice of color inversion to images and everything else
   -- separately.
   invert_colors = 'always',
}
