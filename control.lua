remote.add_interface("infused-science-fixed", {
    milestones_preset_addons = function()
        local ret = {
            ["Infused Science (Fixed)"] = {
                required_mods = { "infused-science-fixed" },
                milestones = {
                    { type = "group", name = "Science" },
                },
            },
        }
        local tbl = ret["Infused Science (Fixed)"]
        for _, science in pairs(game.item_prototypes) do
            if science and science.type == "tool" and science.name:sub(1, 8) == "infused-" then
                log("Adding milestone for: " .. science.name)
                table.insert(tbl.milestones, { type = "item", name = science.name, quantity = 1 })
                table.insert(tbl.milestones, { type = "item", name = science.name, quantity = 1000, next = "x10" })
            end
        end
        return ret
    end,
})
