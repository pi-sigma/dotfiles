require 'luarocks.loader'

local json = require("json")
local M = {}

local function read_file(path)
    local file = io.open(path, "rb")
    if not file then
        return nil
    end

    local content = file:read "*a" -- *a or *all
    file:close()
    return content
end

function M.get_overrides()
    local overrides = {}
    local fileContent = read_file(os.getenv("HOME") .. "/.config/nvim-overrides.json")

    if fileContent ~= nil then
        overrides = json:decode( fileContent )
    end

    return overrides
end

return M
