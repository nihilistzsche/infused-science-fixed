local vanillaScienceNames = {"automation", "logistic", "military", "chemical", "production", "utility"}
local vanillaScience = {}
for _, vanillaPack in ipairs(vanillaScienceNames) do
  vanillaScience[vanillaPack .. "-science-pack"] = true
end

local infusedSciencePacks = {}

local function is_valid_science_pack(science)
  if not science then
    return false
  end
  if science.name == "space-science-pack" or string.starts_with(science.name, "se-") then
    return false
  end
  if science.name:sub(-13) == "-science-pack" then
    return true
  end
  if science.name:sub(-10) == "-tech-card" then
    return true
  end
  if science.name:sub(-13) == "_science_item" then
      return true
  end
end

for _, science in pairs(data.raw["tool"]) do
  if is_valid_science_pack(science) then
    table.insert(infusedSciencePacks, table.deepcopy(science))
  end
end

local useAltOverlay = settings.startup["is-use-alt-overlay"].value
for i, infusedScience in ipairs(infusedSciencePacks) do
  local scienceName = infusedScience.name
  infusedScience.name = "infused-" .. scienceName
  if infusedScience.localised_name then
    if type(infusedScience.localised_name) == "table" then
      infusedScience.localised_name = {"item-name.infused", infusedScience.localised_name}
    else
      infusedScience.localised_name = infusedScience.localised_name .. " - Infused"
    end
  else
    infusedScience.localised_name = {"item-name.infused", {"item-name." .. scienceName}}
  end
  infusedScience.order = "z[" .. i .. infusedScience.name .. "]"

  local infusedOverlay = nil
  if useAltOverlay == "Never" or (useAltOverlay == "Modded only" and vanillaScience[scienceName]) then
    infusedOverlay = "__infused-science__/graphics/icons/infused.png"
  elseif useAltOverlay == "Always" or (useAltOverlay == "Modded only" and not vanillaScience[scienceName]) then
    infusedOverlay = "__infused-science__/graphics/icons/infused_alt.png"
  end

  infusedScience.icons = {
    {icon = infusedScience.icon, icon_size = infusedScience.icon_size},
    {icon = infusedOverlay, icon_size = 64}
  }
  infusedScience.icon = nil
  infusedScience.icon_size = nil

  data:extend(
    {
      infusedScience,
      {
        type = "recipe",
        category = "crafting-with-fluid",
        name = infusedScience.name,
        enabled = false,
        energy_required = 20,
        ingredients = {
          {scienceName, 1},
          {type = "fluid", name = "is-infusion-fluid", amount = 50}
        },
        result_count = 1,
        result = infusedScience.name
      }
    }
  )
end

if mods["AlienSpaceScience"] then
  local tech = data.raw["technology"]["space-science-pack"]
  for i, effect in ipairs(tech.effects) do
    if effect.type == "unlock-recipe" and effect.recipe == "space-science-pack" then
      table.remove(tech.effects, i)
    end
  end

  table.insert(
    data.raw["technology"]["is-infusion-fluid"].effects,
    {type = "unlock-recipe", recipe = "is-infusion-fluid-artifact"}
  )
end
