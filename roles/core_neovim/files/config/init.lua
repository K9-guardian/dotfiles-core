pcall(require, "preinit")

require("core.settings")
require("core.sessions")
require("core.resurrect")
require("core.keymaps")
require("core.plugins")

pcall(require, "postinit")
