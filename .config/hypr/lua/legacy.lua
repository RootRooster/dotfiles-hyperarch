-- -----------------------------------------------------
-- Readers for the hyprlang-style files that other tools still generate:
--   colors.conf   <- matugen
--   monitors.conf / workspaces.conf <- nwg-displays
--   conf/cursor.conf <- scripts/gtk.sh
-- Keeping them as the source of truth means those tools keep working.
-- -----------------------------------------------------

local M = {}

M.hypr_dir = os.getenv("HOME") .. "/.config/hypr"

local function trim(s)
    return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

-- Returns a list of { key, value } for every `key = value` line (comments stripped).
function M.read_pairs(path)
    local out = {}
    local f = io.open(path, "r")
    if not f then
        return out
    end
    for raw in f:lines() do
        local line = raw:gsub("#.*$", "")
        local k, v = line:match("^%s*([^=]-)%s*=%s*(.-)%s*$")
        if k and k ~= "" then
            table.insert(out, { key = k, value = v })
        end
    end
    f:close()
    return out
end

-- colors.conf: `$name = rgba(...)` -> { name = "rgba(...)" }
function M.colors(path)
    local colors = {}
    for _, p in ipairs(M.read_pairs(path or (M.hypr_dir .. "/colors.conf"))) do
        local name = p.key:match("^%$(.+)$")
        if name then
            colors[name] = p.value
        end
    end
    return colors
end

-- Splits "a, b, c" into { "a", "b", "c" }
function M.split_csv(s)
    local parts = {}
    for part in (s .. ","):gmatch("([^,]*),") do
        table.insert(parts, trim(part))
    end
    return parts
end

M.trim = trim

return M
