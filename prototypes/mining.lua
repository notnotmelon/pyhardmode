local collision_mask_util = require "__core__/lualib/collision-mask-util"

local resource_rocks = {
    "titanium-rock",
    "regolites",
    "salt-rock",
    "sulfur-patch",
    "uranium-rock",
    "tin-rock",
    "rare-earth-bolide",
    "quartz-rock",
    "phosphate-rock-02",
    "phosphate-rock",
    "nickel-rock",
    "nexelit-rock",
    "lead-rock",
    "iron-rock",
    "zinc-rock",
    "aluminium-rock",
    "chromium-rock",
    "coal-rock",
    "copper-rock",
    "geothermal-crack",
    "volcanic-pipe"
}

local setting_resource_rocks_disallow_building_over = settings.startup["pyhm-resource-rocks-disallow-building-over"].value

local categories = {}
for _, resource in pairs(resource_rocks) do
    resource = data.raw.resource[resource]
    if setting_resource_rocks_disallow_building_over then
        local mask = collision_mask_util.get_mask(resource)
        mask.layers["object"] = true
        resource.collision_mask = mask
        categories[resource.category] = true
    end
    if settings.startup["pyhm-resource-rocks-infinite"].value then
        resource.infinite = true
        resource.infinite_depletion_amount = 0
        resource.normal = 10
        resource.minimum = resource.normal
        if resource.autoplace then
            resource.autoplace.richness_expression = "10"
        end
    end
end

if setting_resource_rocks_disallow_building_over then
    for _, miner in pairs(data.raw["mining-drill"]) do
        if miner.resource_categories then
            for _, category in pairs(miner.resource_categories) do
                if categories[category] then
                    local mask = collision_mask_util.get_mask(miner)
                    mask.layers["object"] = nil
                    miner.collision_mask = mask
                    break
                end
            end
        end
    end
end

if data.raw.resource["stone"] then
    data.raw.resource["stone"].minable.fluid_amount = 30
    data.raw.resource["stone"].minable.required_fluid = "carbolic-oil"
end
if data.raw.resource["copper-ore"] then
    data.raw.resource["copper-ore"].minable.fluid_amount = 100
    data.raw.resource["copper-ore"].minable.required_fluid = "water"
end

data.raw["mining-drill"]["electric-mining-drill"].input_fluid_box = electric_mining_drill_fluidbox
data.raw["mining-drill"]["burner-mining-drill"].input_fluid_box = {
    production_type = "input",
    pipe_covers = pipecoverspictures(),
    volume = 200,
    pipe_connections = {
        {flow_direction = "input", position = {0.5, -0.5}, direction = defines.direction.north},
    }
}
