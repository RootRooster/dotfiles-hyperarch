-- -----------------------------------------------------
-- Monitors
-- Read from monitors.conf / workspaces.conf, which nwg-displays writes.
-- -----------------------------------------------------

local legacy = require("lua.legacy")

local found = false

for _, p in ipairs(legacy.read_pairs(legacy.hypr_dir .. "/monitors.conf")) do
    if p.key == "monitor" then
        local a = legacy.split_csv(p.value)
        local spec = { output = a[1] }
        if a[2] == "disable" then
            spec.disabled = true
        else
            spec.mode     = a[2] ~= "" and a[2] or "preferred"
            spec.position = a[3] or "auto"
            spec.scale    = a[4] or "auto"
            -- optional trailing `key, value` pairs (transform, vrr, bitdepth, mirror, cm, ...)
            local i = 5
            while a[i] and a[i + 1] do
                local v = a[i + 1]
                spec[a[i]] = tonumber(v) or v
                i = i + 2
            end
        end
        hl.monitor(spec)
        found = true
    end
end

-- Fallback for any monitor not listed above (and if the file is missing)
if not found then
    hl.monitor({ output = "", mode = "preferred", position = "auto", scale = 1 })
end

-- workspace = 1, monitor:DP-1, default:true
for _, p in ipairs(legacy.read_pairs(legacy.hypr_dir .. "/workspaces.conf")) do
    if p.key == "workspace" then
        local a = legacy.split_csv(p.value)
        local rule = { workspace = a[1] }
        for i = 2, #a do
            local k, v = a[i]:match("^([^:]+):(.*)$")
            if k == "monitor" then
                rule.monitor = v
            elseif k then
                rule[k] = (v == "true") or (v ~= "false" and v)
            end
        end
        hl.workspace_rule(rule)
    end
end
