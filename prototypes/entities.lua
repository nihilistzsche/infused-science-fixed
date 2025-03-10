--[[local function modify_lab_size(size) return math.floor((size * 4 / 3) + 0.5) end

local function modify_lab_layers(layers)
    local base_layers = #layers == 3 and off_layers or on_layers
    for i, layer in ipairs(layers) do
        layer.filename = base_layers.hr[i][1]:gsub("__base__", "__infused-science-fixed__")

        layer.width = modify_lab_size(base_layers.hr[i][2])
        layer.height = modify_lab_size(base_layers.hr[i][3])
    end
end

local base_remnant_path = "__base__/graphics/entity/lab/remnants/"
local base_remnant_layers = { base_remnant_path .. "hr-lab-remnants.png", 266, 196 }

local function modify_lab_remnant_layers(layers)
    for _, layer in ipairs(layers) do
        layer.filename = base_remnant_layers[1]:gsub("__base__", "__infused-science-fixed__")

        layer.width = modify_lab_size(base_remnant_layers[2])
        layer.height = modify_lab_size(base_remnant_layers[3])
    end
end]]

local infusionLab = table.deepcopy(data.raw["lab"]["lab"])
infusionLab.name = "is-infusion-lab"
infusionLab.icon = "__infused-science-fixed__/graphics/icons/lab.png"
infusionLab.minable.result = "is-infusion-lab"
infusionLab.corpse = "is-infusion-lab-remnants"
infusionLab.energy_usage = "150kW"
infusionLab.researching_speed = 1.25
infusionLab.module_slots = 4
infusionLab.inputs = { }
infusionLab.collision_box = { { -1.7, -1.7 }, { 1.7, 1.7 } }
infusionLab.selection_box = { { -2, -2 }, { 2, 2 } }
--modify_lab_layers(infusionLab.on_animation.layers)
--modify_lab_layers(infusionLab.off_animation.layers)

local infusionLabRemnants = table.deepcopy(data.raw["corpse"]["lab-remnants"])
infusionLabRemnants.name = "is-infusion-lab-remnants"
infusionLabRemnants.icon = "__infused-science-fixed__/graphics/icons/lab.png"
infusionLabRemnants.selection_box = { { -2, -2 }, { 2, 2 } }
infusionLabRemnants.tile_width = 4
infusionLabRemnants.tile_height = 4
--modify_lab_remnant_layers(infusionLabRemnants.animation)

data:extend({ infusionLab, infusionLabRemnants })

if mods["space-age"] then
    local infusionBiolab = table.deepcopy(data.raw["lab"]["biolab"])
    infusionBiolab.name = "is-infusion-biolab"
    infusionBiolab.minable.result = "is-infusion-biolab"
    infusionBiolab.corpse = "is-infusion-biolab-remnants"
    infusionBiolab.energy_usage = "150kW"
    infusionBiolab.researching_speed = 1.25
    infusionBiolab.module_slots = 8
    infusionBiolab.inputs = { }
    infusionBiolab.collision_box = { { -1.7, -1.7 }, { 1.7, 1.7 } }
    infusionBiolab.selection_box = { { -2, -2 }, { 2, 2 } }

    local infusionBiolabRemnants = table.deepcopy(data.raw["corpse"]["biolab-remnants"])
    infusionBiolabRemnants.name = "is-infusion-biolab-remnants"
    infusionBiolabRemnants.selection_box = { { -2, -2 }, { 2, 2 } }
    infusionBiolabRemnants.tile_width = 4
    infusionBiolabRemnants.tile_height = 4

    data:extend({ infusionBiolab, infusionBiolabRemnants})
end