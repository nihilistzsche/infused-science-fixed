local function modify_lab_size(size)
    return math.floor((size * 4 / 3) + 0.5)
end

local function modify_lab_layers(layers)
    for _, layer in ipairs(layers) do
        layer.filename = layer.filename:gsub("__base__", "__infused-science__")
        layer.hr_version.filename = layer.hr_version.filename:gsub("__base__", "__infused-science__")
    
        layer.width = modify_lab_size(layer.width)
        layer.height = modify_lab_size(layer.height)
        layer.hr_version.width = modify_lab_size(layer.hr_version.width)
        layer.hr_version.height = modify_lab_size(layer.hr_version.height)
    end
end

local infusionLab = table.deepcopy(data.raw["lab"]["lab"])
infusionLab.name = "is-infusion-lab"
infusionLab.icon = infusionLab.icon:gsub("__base__", "__infused-science__")
infusionLab.minable.result = "is-infusion-lab"
infusionLab.corpse = "is-infusion-lab-remnants"
infusionLab.energy_usage = "150kW"
infusionLab.researching_speed = 1.25
infusionLab.module_specification.module_slots = 4
infusionLab.inputs = {"space-science-pack"}
infusionLab.collision_box = {{-1.7, -1.7}, {1.7, 1.7}}
infusionLab.selection_box = {{-2, -2}, {2, 2}}
modify_lab_layers(infusionLab.on_animation.layers)
modify_lab_layers(infusionLab.off_animation.layers)

local infusionLabRemnants = table.deepcopy(data.raw["corpse"]["lab-remnants"])
infusionLabRemnants.name = "is-infusion-lab-remnants"
infusionLabRemnants.icon = infusionLabRemnants.icon:gsub("__base__", "__infused-science__")
infusionLabRemnants.selection_box = {{-2, -2}, {2, 2}}
infusionLabRemnants.tile_width = 4
infusionLabRemnants.tile_height = 4
modify_lab_layers(infusionLabRemnants.animation)

data:extend({infusionLab, infusionLabRemnants})
