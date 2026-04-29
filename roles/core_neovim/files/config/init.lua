pcall(require, "preinit")

require("core.settings")
require("core.keymaps")
require("core.tabline")
require("core.autocmds")
require("core.sessions")
require("core.resurrect")
require("core.plugins")

pcall(require, "postinit")
