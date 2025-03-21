data:extend({
    {
        type = "fluid",
        name = "is-ore-mixture",
        default_temperature = 25,
        heat_capacity = "0.1kJ",
        base_color = { r = 0.18, g = 0.27, b = 0.29 },
        flow_color = { r = 0.5, g = 0.5, b = 0.5 },
        max_temperature = 100,
        icon = "__infused-science-fixed__/graphics/icons/ore-mixture.png",
        icon_size = 64,
        order = "a[fluid]-a[is-ore-mixture]",
    },
    {
        type = "fluid",
        name = "is-ore-oil-mixture",
        default_temperature = 25,
        heat_capacity = "0.1kJ",
        base_color = { r = 0.09, g = 0.14, b = 0.12 },
        flow_color = { r = 0.5, g = 0.5, b = 0.5 },
        max_temperature = 100,
        icon = "__infused-science-fixed__/graphics/icons/ore-oil-mixture.png",
        icon_size = 64,
        order = "a[fluid]-a[is-ore-oil-mixture]",
    },
    {
        type = "fluid",
        name = "is-infusion-fluid",
        default_temperature = 25,
        heat_capacity = "0.1kJ",
        base_color = { r = 0.64, g = 0.64, b = 0.64 },
        flow_color = { r = 0.8, g = 0.8, b = 0.8 },
        max_temperature = 100,
        icon = "__infused-science-fixed__/graphics/icons/infusion-fluid.png",
        icon_size = 64,
        order = "a[fluid]-a[is-infusion-fluid]",
    },
    {
        type = "item",
        name = "is-infusion-lab",
        icon = "__infused-science-fixed__/graphics/icons/lab.png",
        icon_size = 64,
        subgroup = "production-machine",
        order = "g[is-infusion-lab]",
        place_result = "is-infusion-lab",
        stack_size = 10,
    },
})

if mods["space-age"] then
    local infusedBiolab = table.deepcopy(data.raw.item["biolab"])
    infusedBiolab.name = "is-infusion-biolab"
    infusedBiolab.order = "h[is-infusion-biolab]"
    infusedBiolab.place_result = "is-infusion-biolab"
    data:extend({ infusedBiolab })
end 