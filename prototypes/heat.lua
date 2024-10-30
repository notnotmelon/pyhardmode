local pipe_covers = make_4way_animation_from_spritesheet {
    filename = "__base__/graphics/entity/heat-exchanger/heatex-endings.png",
    width = 32,
    height = 32,
    direction_count = 4,
    hr_version = {
        filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings.png",
        width = 64,
        height = 64,
        direction_count = 4,
        scale = 0.5
    }
}
local heat_pipe_covers = make_4way_animation_from_spritesheet(apply_heat_pipe_glow {
    filename = "__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png",
    width = 32,
    height = 32,
    direction_count = 4,
    hr_version = {
        filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-endings-heated.png",
        width = 64,
        height = 64,
        direction_count = 4,
        scale = 0.5
    }
})
local heat_picture = {
    north = apply_heat_pipe_glow {
        filename = "__base__/graphics/entity/heat-exchanger/heatex-N-heated.png",
        priority = "extra-high",
        width = 24,
        height = 48,
        shift = util.by_pixel(-1, 8),
        hr_version = {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-N-heated.png",
            priority = "extra-high",
            width = 44,
            height = 96,
            shift = util.by_pixel(-0.5, 8.5),
            scale = 0.5
        }
    },
    east = apply_heat_pipe_glow {
        filename = "__base__/graphics/entity/heat-exchanger/heatex-E-heated.png",
        priority = "extra-high",
        width = 40,
        height = 40,
        shift = util.by_pixel(-21, -13),
        hr_version = {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-E-heated.png",
            priority = "extra-high",
            width = 80,
            height = 80,
            shift = util.by_pixel(-21, -13),
            scale = 0.5
        }
    },
    south = apply_heat_pipe_glow {
        filename = "__base__/graphics/entity/heat-exchanger/heatex-S-heated.png",
        priority = "extra-high",
        width = 16,
        height = 20,
        shift = util.by_pixel(-1, -30),
        hr_version = {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-S-heated.png",
            priority = "extra-high",
            width = 28,
            height = 40,
            shift = util.by_pixel(-1, -30),
            scale = 0.5
        }
    },
    west = apply_heat_pipe_glow {
        filename = "__base__/graphics/entity/heat-exchanger/heatex-W-heated.png",
        priority = "extra-high",
        width = 32,
        height = 40,
        shift = util.by_pixel(23, -13),
        hr_version = {
            filename = "__base__/graphics/entity/heat-exchanger/hr-heatex-W-heated.png",
            priority = "extra-high",
            width = 64,
            height = 76,
            shift = util.by_pixel(23, -13),
            scale = 0.5
        }
    }
}

local foundry = {
    {
        position = {-2.5, -1.5},
        direction = defines.direction.west
    }
}
local incubator = {
    {
        position = {-3, 2.0},
        direction = defines.direction.west
    }
}
local simik = {
    {
        position = {7.5, -7.5},
        direction = defines.direction.north
    },
    {
        position = {-7.5, -7.5},
        direction = defines.direction.north
    },
    {
        position = {7.5, 7.5},
        direction = defines.direction.south
    },
    {
        position = {-7.5, 7.5},
        direction = defines.direction.south
    },
}
local heavy_oil = {
    {
        position = {5, -6},
        direction = defines.direction.north
    },
    {
        position = {-5, -6},
        direction = defines.direction.north
    }
}
local cracker = {
    {
        position = {3, 0},
        direction = defines.direction.east
    },
    {
        position = {-3, 0},
        direction = defines.direction.west
    }
}
local burner = {
    {
        position = {1, 0},
        direction = defines.direction.east
    },
    {
        position = {-1, 0},
        direction = defines.direction.west
    },
}
local coal_plant = {
    {
        position = {5, -6},
        direction = defines.direction.north
    },
    {
        position = {4, -6},
        direction = defines.direction.north
    },
    {
        position = {-5, -6},
        direction = defines.direction.north
    },
    {
        position = {-4, -6},
        direction = defines.direction.north
    },
    {
        position = {5, 6},
        direction = defines.direction.south
    },
    {
        position = {4, 6},
        direction = defines.direction.south
    },
    {
        position = {-5, 6},
        direction = defines.direction.south
    },
    {
        position = {-4, 6},
        direction = defines.direction.south
    },
}
local rhe = {
    {
        position = {2, 0},
        direction = defines.direction.east
    },
    {
        position = {-2, 0},
        direction = defines.direction.west
    }
}
local rtg = {
    {
        position = {2, 0},
        direction = defines.direction.east
    },
    {
        position = {-2, 0},
        direction = defines.direction.west
    },
    {
        position = {0, -2},
        direction = defines.direction.north
    },
    {
        position = {0, 2},
        direction = defines.direction.south
    }
}

for name, info in pairs {
    ["advanced-foundry-mk01"] = {min_working_temperature = 450, connections = foundry},
    ["advanced-foundry-mk02"] = {min_working_temperature = 1900, connections = foundry},
    ["advanced-foundry-mk03"] = {min_working_temperature = 2900, connections = foundry},
    ["advanced-foundry-mk04"] = {min_working_temperature = 3900, connections = foundry},
    ["rhe"] = {min_working_temperature = 350, connections = rhe},
    ["incubator-mk01"] = {min_working_temperature = 200, connections = incubator},
    ["incubator-mk02"] = {min_working_temperature = 200, connections = incubator},
    ["incubator-mk03"] = {min_working_temperature = 200, connections = incubator},
    ["incubator-mk04"] = {min_working_temperature = 200, connections = incubator},
    ["simik-den-mk01"] = {min_working_temperature = 4500, connections = simik},
    ["simik-den-mk02"] = {min_working_temperature = 4500, connections = simik},
    ["simik-den-mk03"] = {min_working_temperature = 4500, connections = simik},
    ["simik-den-mk04"] = {min_working_temperature = 4500, connections = simik},
    ["heavy-oil-refinery-mk01"] = {min_working_temperature = 750, connections = heavy_oil},
    ["heavy-oil-refinery-mk02"] = {min_working_temperature = 1500, connections = heavy_oil},
    ["heavy-oil-refinery-mk03"] = {min_working_temperature = 2500, connections = heavy_oil},
    ["heavy-oil-refinery-mk04"] = {min_working_temperature = 3500, connections = heavy_oil},
    ["cracker-mk01"] = {min_working_temperature = 750, connections = cracker},
    ["cracker-mk02"] = {min_working_temperature = 1500, connections = cracker},
    ["cracker-mk03"] = {min_working_temperature = 2500, connections = cracker},
    ["cracker-mk04"] = {min_working_temperature = 3500, connections = cracker},
} do
    local entity = data.raw["assembling-machine"][name]
    entity.energy_source = {
        type = "heat",
        max_temperature = 500 + math.floor(info.min_working_temperature / 500) * 500,
        specific_heat = "1MJ",
        max_transfer = "10GW",
        min_working_temperature = info.min_working_temperature,
        minimum_glow_temperature = info.min_working_temperature - 50,
        connections = info.connections,
        pipe_covers = pipe_covers,
        heat_pipe_covers = heat_pipe_covers,
        heat_picture = heat_picture
    }
end

data.raw["utility-sprites"].default.heat_exchange_indication.filename = "__core__/graphics/arrows/heat-exchange-indication.png"

RECIPE("heat-pipe"):remove_unlock("advanced-material-processing-2"):add_unlock("py-burner").ingredients[2].amount = 5

RECIPE("py-coal-powerplant-mk01"):remove_ingredient("mechanical-parts-01"):remove_unlock("coalplant-mk01"):add_unlock("oil-machines-mk01")
RECIPE("py-coal-powerplant-mk01"):add_ingredient {"heat-pipe", 10}
RECIPE("py-coal-powerplant-mk02"):add_ingredient {"heat-pipe", 10}
RECIPE("py-coal-powerplant-mk03"):add_ingredient {"heat-pipe", 10}
RECIPE("py-coal-powerplant-mk04"):add_ingredient {"heat-pipe", 10}
RECIPE("he-01"):remove_unlock("coalplant-mk01")
RECIPE("he-02"):remove_unlock("coalplant-mk02")
RECIPE("he-03"):remove_unlock("coalplant-mk03")
RECIPE("he-04"):remove_unlock("coalplant-mk04")
RECIPE("coal-molten-salt-01"):remove_unlock("coalplant-mk01")
RECIPE("coal-molten-salt-02"):remove_unlock("coalplant-mk02")
RECIPE("coal-molten-salt-03"):remove_unlock("coalplant-mk03")
RECIPE("coal-molten-salt-04"):remove_unlock("coalplant-mk04")
data.raw.recipe["coal-molten-salt-01"] = nil
data.raw.recipe["coal-molten-salt-02"] = nil
data.raw.recipe["coal-molten-salt-03"] = nil
data.raw.recipe["coal-molten-salt-04"] = nil

for _, coal_plant in pairs {
    "py-coal-powerplant-mk01",
    "py-coal-powerplant-mk02",
    "py-coal-powerplant-mk03",
    "py-coal-powerplant-mk04",
} do
    local animation = {
        type = "simple-entity-with-owner",
        name = coal_plant .. "-animation",
        icon = data.raw["assembling-machine"][coal_plant].icon,
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation", "not-on-map"},
        collision_box = data.raw["assembling-machine"][coal_plant].collision_box,
        collision_mask = {layers = {}},
        selectable_in_game = false,
        hidden = true,
        animations = data.raw["assembling-machine"][coal_plant].graphics_set.animation
    }
    for _, layer in pairs(animation.animations.layers) do
        layer.animation_speed = 1 / 6
    end
    local picture = {
        type = "simple-entity-with-owner",
        name = coal_plant .. "-picture",
        icon = data.raw["assembling-machine"][coal_plant].icon,
        icon_size = 64,
        flags = {"placeable-neutral", "player-creation", "not-on-map"},
        collision_box = data.raw["assembling-machine"][coal_plant].collision_box,
        collision_mask = {layers = {}},
        selectable_in_game = false,
        hidden = true,
        picture = data.raw["assembling-machine"][coal_plant].graphics_set.animation
    }
    data:extend {animation, picture}
end

local rtg_light = {
    layers = {
        table.remove(data.raw["burner-generator"]["py-rtg"].animation.layers, 2),
        table.remove(data.raw["burner-generator"]["py-rtg"].animation.layers, 2),
    }
}

for name, info in pairs {
    ["py-burner"] = {specific_heat = "2.5MJ", copy_animation = true, type = "furnace", consumption = "2.5MW", connections = burner, max_temperature = 500},
    ["py-coal-powerplant-mk01"] = {specific_heat = "10MJ", type = "assembling-machine", consumption = "10MW", connections = coal_plant, max_temperature = 1000},
    ["py-coal-powerplant-mk02"] = {specific_heat = "20MJ", type = "assembling-machine", consumption = "20MW", connections = coal_plant, max_temperature = 2000},
    ["py-coal-powerplant-mk03"] = {specific_heat = "30MJ", type = "assembling-machine", consumption = "30MW", connections = coal_plant, max_temperature = 3000},
    ["py-coal-powerplant-mk04"] = {specific_heat = "40MJ", type = "assembling-machine", consumption = "40MW", connections = coal_plant, max_temperature = 4000},
    ["py-rtg"] = {specific_heat = "5MJ", copy_animation = true, type = "burner-generator", consumption = "2MW", connections = rtg, max_temperature = 5000, neighbour_bonus = 2},
} do
    local type = info.type
    local entity = data.raw[type][name]
    data.raw[type][name] = nil
    entity.type = "reactor"
    entity.consumption = info.consumption
    entity.working_light_picture = {
        filename = "__pycoalprocessinggraphics__/graphics/empty.png",
        size = 1,
        priority = "high",
        direction_count = 1,
        frame_count = 1,
        line_length = 1
    }
    entity.heat_buffer = {
        connections = info.connections,
        specific_heat = "1MJ",
        max_transfer = "100GW",
        max_temperature = info.max_temperature,
    }
    entity.neighbour_bonus = info.neighbour_bonus or 0
    entity.scale_energy_usage = true
    if info.copy_animation and not entity.picture then
        entity.picture = entity.animation
    end
    if entity.burner then
        entity.energy_source = entity.burner
    end
    entity.energy_source.effectivity = 5
    data:extend {entity}
    entity.localised_description = {"", {"entity-description." .. entity.name}, "\n", {"entity-description.max-temperature", tostring(info.max_temperature)}}
end

data.raw.reactor["py-rtg"].working_light_picture = rtg_light
data.raw.reactor["py-rtg"].scale_energy_usage = true
for i = 1, 4 do
    data.raw.reactor["py-coal-powerplant-mk0" .. i].integration_patch = {
        filename = "__pyhardmode__/graphics/coal-plant.png",
        size = {416, 416}
    }
end

data.raw.reactor["py-burner"].energy_source.fuel_categories = {"biomass"}
data.raw.reactor["py-burner"].energy_source.burnt_inventory_size = 0
local horizontal_pipe = {
    hr_version = {
        filename = "__base__/graphics/entity/heat-pipe/hr-heat-pipe-straight-horizontal-1.png",
        size = {64, 64},
        scale = 0.5
    },
    filename = "__base__/graphics/entity/heat-pipe/heat-pipe-straight-horizontal-1.png",
    size = {32, 32},
}
data.raw.reactor["py-burner"].connection_patches_connected = {horizontal_pipe, horizontal_pipe}

data.raw["heat-pipe"]["heat-pipe"].heat_buffer.specific_heat = "200kJ"
data.raw["heat-pipe"]["heat-pipe"].heat_buffer.max_temperature = 5000

local nuclear_reactor = data.raw.reactor["nuclear-reactor"]
nuclear_reactor.scale_energy_usage = true
nuclear_reactor.heat_buffer.max_temperature = 1000
nuclear_reactor.heat_buffer.specific_heat = "200kJ"
nuclear_reactor.energy_source.effectivity = 0.01
nuclear_reactor.consumption = "100MW"
nuclear_reactor.localised_description = {"", {"entity-description.nuclear-reactor"}, "\n", {"entity-description.max-temperature", "1000"}}

data.raw.furnace["electric-furnace"].energy_usage = "5MW"
data.raw.furnace["electric-furnace"].crafting_speed = 4
data.raw.furnace["electric-furnace"].energy_source = {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = {pollution = 10},
}

RECIPE("py-burner"):remove_ingredient("titanium-plate"):remove_ingredient("steel-plate"):remove_unlock("py-burner"):add_unlock("steel-processing")

data.raw["heat-pipe"]["heat-pipe"].heat_buffer.min_temperature_gradient = 2

data.raw["assembling-machine"]["incubator-mk01"].energy_usage = "3MW"
data.raw["assembling-machine"]["incubator-mk02"].energy_usage = "6MW"
data.raw["assembling-machine"]["incubator-mk03"].energy_usage = "9MW"
data.raw["assembling-machine"]["incubator-mk04"].energy_usage = "12MW"
data.raw["assembling-machine"]["simik-den-mk01"].energy_usage = "10MW"
data.raw["assembling-machine"]["simik-den-mk02"].energy_usage = "15MW"
data.raw["assembling-machine"]["simik-den-mk03"].energy_usage = "20MW"
data.raw["assembling-machine"]["simik-den-mk04"].energy_usage = "25MW"

RECIPE("py-rtg"):remove_unlock("nuclear-power-mk02"):add_unlock("simik-mk01")
