data:extend({
    {
        type = "recipe",
        name = "is-ore-mixture",
        category = "chemistry",
        energy_required = 5,
        enabled = false,
        ingredients = {
            { type = "item", name = "iron-ore", amount = 3 },
            { type = "item", name = "copper-ore", amount = 3 },
            { type = "item", name = "stone", amount = 2 },
            { type = "item", name = "coal", amount = 2 },
            { type = "fluid", name = "water", amount = 50 },
        },
        results = {
            { type = "fluid", name = "is-ore-mixture", amount = 50 },
        },
        subgroup = "fluid-recipes",
    },
    {
        type = "recipe",
        name = "is-ore-oil-mixture",
        category = "chemistry",
        energy_required = 5,
        enabled = false,
        ingredients = {
            { type = "item", name = "uranium-ore", amount = 2 },
            { type = "fluid", name = "crude-oil", amount = 25 },
            { type = "fluid", name = "is-ore-mixture", amount = 75 },
        },
        results = {
            { type = "fluid", name = "is-ore-oil-mixture", amount = 100 },
        },
        subgroup = "fluid-recipes",
    },
    {
        type = "recipe",
        name = "is-infusion-fluid",
        category = "chemistry",
        energy_required = 10,
        enabled = false,
        ingredients = {
            { type = "item", name = "space-science-pack", amount = 1 },
            { type = "fluid", name = "is-ore-oil-mixture", amount = 100 },
        },
        results = {
            { type = "fluid", name = "is-infusion-fluid", amount = 100 },
        },
        subgroup = "fluid-recipes",
    },
})

local infusionLab = {
    type = "recipe",
    name = "is-infusion-lab",
    category = "crafting-with-fluid",
    energy_required = 10,
    results = {
        { type = "item", name = "is-infusion-lab", amount = 1 }
    },
    enabled = false,
}

if mods["one-more-tier"] and data.raw["item"]["omt-lab"] then
    infusionLab.ingredients = {
        { type = "item", name = "processing-unit", amount = 6 },
        { type = "item", name = "electronic-circuit", amount = 35 },
        { type = "item", name = "iron-gear-wheel", amount = 70 },
        { type = "item", name = "express-transport-belt", amount = 14 },
        { type = "item", name = "low-density-structure", amount = 40 },
        { type = "item", name = "omt-lab", amount = 1 },
        { type = "fluid", name = "is-infusion-fluid", amount = 100 },
    }
else
    infusionLab.ingredients = {
        { type = "item", name = "processing-unit", amount = 10 },
        { type = "item", name = "electronic-circuit", amount = 50 },
        { type = "item", name = "iron-gear-wheel", amount = 100 },
        { type = "item", name = "express-transport-belt", amount = 20 },
        { type = "item", name = "low-density-structure", amount = 50 },
        { type = "item", name = "lab", amount = 1 },
        { type = "fluid", name = "is-infusion-fluid", amount = 100 },
    }
end

data:extend({ infusionLab })

if mods["space-age"] then
    local infusionBiolab = {
        type = "recipe",
        name = "is-infusion-biolab",
        category = "crafting-with-fluid",
        energy_required = 10,
        ingredients = {
            { type = "item", name = "holmium-plate", amount = 10 },
            { type = "item", name = "jelly", amount = 20 },
            { type = "item", name = "quantum-processor", amount = 20 },
            { type = "item", name = "turbo-transport-belt", amount = 5 },
            { type = "item", name = "tungsten-plate", amount = 10 },
            { type = "item", name = "biolab", amount = 1 },
            { type = "fluid", name = "is-infusion-fluid", amount = 200 },
        },
        results = {
            { type = "item", name = "is-infusion-biolab", amount = 1 }
        },
        enabled = false,
    }
    data:extend({ infusionBiolab })
end
if mods["AlienSpaceScience"] then
    data:extend({
        {
            type = "recipe",
            name = "is-infusion-fluid-artifact",
            category = "chemistry",
            energy_required = 20,
            enabled = false,
            ingredients = {
                { type = "item", name = "space-science-pack", amount = 1 },
                { type = "item", name = "alien-artifact", amount = 1 },
                { type = "fluid", name = "is-ore-oil-mixture", amount = 300 },
            },
            results = {
                { type = "fluid", name = "is-infusion-fluid", amount = 300 },
            },
            subgroup = "fluid-recipes",
        },
    })
end
