local vanillaScienceNames = { "automation", "logistic", "military", "chemical", "production", "utility", "space" }
local spaceAgeScienceNames = { "metallurgic", "electromagnetic", "agricultural", "cryogenic", "promethium" }
local vanillaScience = {}
for _, vanillaPack in ipairs(vanillaScienceNames) do
    vanillaScience[vanillaPack .. "-science-pack"] = true
end
if mods["space-age"] then
    for _, spaceAgePack in ipairs(spaceAgeScienceNames) do
        vanillaScience[spaceAgePack.."-science-pack"] = true
    end
end

local infusedSciencePacks = {}

local prefixes = {
    ["sem-spg_science-pack-"] = true,
}

local function has_valid_prefix(name, prefix) return name:sub(1, string.len(prefix)) == prefix end

local suffixes = {
    ["-science-pack"] = true,
}

local function has_valid_suffix(name, suffix) return name:sub(-string.len(suffix)) == suffix end

local function is_valid_science_pack(science)
    if not science then return false end
    if science.name:sub(1, string.len("infused-")) == "infused-" then return false end
    if vanillaScience[science.name] then return true end
    for prefix in pairs(prefixes) do
        if has_valid_prefix(science.name, prefix) then return true end
    end
    for suffix in pairs(suffixes) do
        if has_valid_suffix(science.name, suffix) then return true end
    end
    return false
end

for _, science in pairs(data.raw["tool"]) do
    if is_valid_science_pack(science) then table.insert(infusedSciencePacks, table.deepcopy(science)) end
end

local useAltOverlay = settings.startup["is-use-alt-overlay"].value
for i, infusedScience in ipairs(infusedSciencePacks) do
    local scienceName = infusedScience.name
    infusedScience.name = "infused-" .. scienceName
    if infusedScience.localised_name then
        if type(infusedScience.localised_name) == "table" then
            infusedScience.localised_name = { "item-name.infused", infusedScience.localised_name }
        else
            infusedScience.localised_name = infusedScience.localised_name .. " - Infused"
        end
    else
        infusedScience.localised_name = { "item-name.infused", { "item-name." .. scienceName } }
    end
    infusedScience.order = "z[" .. i .. infusedScience.name .. "]"

    local infusedOverlay = nil
    if useAltOverlay == "Never" or (useAltOverlay == "Modded only" and vanillaScience[scienceName]) then
        infusedOverlay = "__infused-science-fixed__/graphics/icons/infused.png"
    elseif useAltOverlay == "Always" or (useAltOverlay == "Modded only" and not vanillaScience[scienceName]) then
        infusedOverlay = "__infused-science-fixed__/graphics/icons/infused_alt.png"
    end

    if infusedScience.icons then
        table.insert(infusedScience.icons, { icon = infusedOverlay, icon_size = 64 })
    else
        infusedScience.icons = {
            { icon = infusedScience.icon, icon_size = infusedScience.icon_size },
            { icon = infusedOverlay, icon_size = 64 },
        }
        infusedScience.icon = nil
        infusedScience.icon_size = nil
    end

    data:extend({
        infusedScience,
        {
            type = "recipe",
            category = "crafting-with-fluid",
            name = infusedScience.name,
            enabled = false,
            energy_required = 20,
            ingredients = {
                { type = "item", name = scienceName, amount = 1 },
                { type = "fluid", name = "is-infusion-fluid", amount = 50 },
            },
            results = {
                { type = "item", name = infusedScience.name, amount = 1 }
            }
        },
    })
end
