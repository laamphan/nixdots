---@type ChadrcConfig
local M = {}


M.ui = {
  theme = "bearded-arc",
  nvdash = {
    load_on_startup = true,
  },
}
M.mappings = require "custom/mappings"
M.plugins = "custom.plugins"
return M
