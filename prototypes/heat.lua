local foundry = {
    {
        position = {2.5, 0.5},
        direction = defines.direction.east
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
}
local coal_plant = {
    {
        position = {0, -6},
        direction = defines.direction.north
    },
}

for name, connections in pairs{
    ['advanced-foundry-mk01'] = foundry,
    ['advanced-foundry-mk02'] = foundry,
    ['advanced-foundry-mk03'] = foundry,
    ['advanced-foundry-mk04'] = foundry,
    ['rhe'] = {
        {
            position = {2, 0},
            direction = defines.direction.east
        },
        {
            position = {-2, 0},
            direction = defines.direction.west
        }
    },
    ['incubator-mk01'] = incubator,
    ['incubator-mk02'] = incubator,
    ['incubator-mk03'] = incubator,
    ['incubator-mk04'] = incubator,
    ['simik-den-mk01'] = simik,
    ['simik-den-mk02'] = simik,
    ['simik-den-mk03'] = simik,
    ['simik-den-mk04'] = simik,
    ['heavy-oil-refinery-mk01'] = heavy_oil,
    ['heavy-oil-refinery-mk02'] = heavy_oil,
    ['heavy-oil-refinery-mk03'] = heavy_oil,
    ['heavy-oil-refinery-mk04'] = heavy_oil,
    ['cracker-mk01'] = cracker,
    ['cracker-mk02'] = cracker,
    ['cracker-mk03'] = cracker,
    ['cracker-mk04'] = cracker,
} do
    local entity = data.raw['assembling-machine'][name]
    entity.energy_source = {
        type = 'heat',
        max_temperature = 1000,
        specific_heat = '1MJ',
        max_transfer = '2GW',
        min_working_temperature = 500,
        minimum_glow_temperature = 350,
        connections = connections,
        pipe_covers = make_4way_animation_from_spritesheet{
            filename = '__base__/graphics/entity/heat-exchanger/heatex-endings.png',
            width = 32,
            height = 32,
            direction_count = 4,
            hr_version = {
                filename = '__base__/graphics/entity/heat-exchanger/hr-heatex-endings.png',
                width = 64,
                height = 64,
                direction_count = 4,
                scale = 0.5
            }
        },
        heat_pipe_covers = make_4way_animation_from_spritesheet(apply_heat_pipe_glow{
            filename = '__base__/graphics/entity/heat-exchanger/heatex-endings-heated.png',
            width = 32,
            height = 32,
            direction_count = 4,
            hr_version = {
                filename = '__base__/graphics/entity/heat-exchanger/hr-heatex-endings-heated.png',
                width = 64,
                height = 64,
                direction_count = 4,
                scale = 0.5
            }
        }),
        heat_picture = {
            north = apply_heat_pipe_glow{
                filename = '__base__/graphics/entity/heat-exchanger/heatex-N-heated.png',
                priority = 'extra-high',
                width = 24,
                height = 48,
                shift = util.by_pixel(-1, 8),
                hr_version = {
                    filename = '__base__/graphics/entity/heat-exchanger/hr-heatex-N-heated.png',
                    priority = 'extra-high',
                    width = 44,
                    height = 96,
                    shift = util.by_pixel(-0.5, 8.5),
                    scale = 0.5
                }
            },
            east = apply_heat_pipe_glow{
                filename = '__base__/graphics/entity/heat-exchanger/heatex-E-heated.png',
                priority = 'extra-high',
                width = 40,
                height = 40,
                shift = util.by_pixel(-21, -13),
                hr_version = {
                    filename = '__base__/graphics/entity/heat-exchanger/hr-heatex-E-heated.png',
                    priority = 'extra-high',
                    width = 80,
                    height = 80,
                    shift = util.by_pixel(-21, -13),
                    scale = 0.5
                }
            },
            south = apply_heat_pipe_glow{
                filename = '__base__/graphics/entity/heat-exchanger/heatex-S-heated.png',
                priority = 'extra-high',
                width = 16,
                height = 20,
                shift = util.by_pixel(-1, -30),
                hr_version = {
                    filename = '__base__/graphics/entity/heat-exchanger/hr-heatex-S-heated.png',
                    priority = 'extra-high',
                    width = 28,
                    height = 40,
                    shift = util.by_pixel(-1, -30),
                    scale = 0.5
                }
            },
            west = apply_heat_pipe_glow{
                filename = '__base__/graphics/entity/heat-exchanger/heatex-W-heated.png',
                priority = 'extra-high',
                width = 32,
                height = 40,
                shift = util.by_pixel(23, -13),
                hr_version = {
                    filename = '__base__/graphics/entity/heat-exchanger/hr-heatex-W-heated.png',
                    priority = 'extra-high',
                    width = 64,
                    height = 76,
                    shift = util.by_pixel(23, -13),
                    scale = 0.5
                }
            }
        }
    }
end

data.raw['utility-sprites'].default.heat_exchange_indication.filename = '__core__/graphics/arrows/heat-exchange-indication.png'

RECIPE('heat-pipe'):remove_unlock('advanced-material-processing-2'):add_unlock('py-burner').ingredients[2].amount = 5
RECIPE('py-burner'):add_ingredient('heat-pipe')

RECIPE('py-coal-powerplant-mk01'):remove_ingredient('mechanical-parts-01'):remove_unlock('coalplant-mk01'):add_unlock('oil-machines-mk01')
RECIPE('py-coal-powerplant-mk01'):add_ingredient{'heat-pipe', 10}
RECIPE('py-coal-powerplant-mk02'):add_ingredient{'heat-pipe', 10}
RECIPE('py-coal-powerplant-mk03'):add_ingredient{'heat-pipe', 10}
RECIPE('py-coal-powerplant-mk04'):add_ingredient{'heat-pipe', 10}
RECIPE('he-01'):remove_unlock('coalplant-mk01')
RECIPE('he-02'):remove_unlock('coalplant-mk02')
RECIPE('he-03'):remove_unlock('coalplant-mk03')
RECIPE('he-04'):remove_unlock('coalplant-mk04')
RECIPE('coal-molten-salt-01'):remove_unlock('coalplant-mk01')
RECIPE('coal-molten-salt-02'):remove_unlock('coalplant-mk02')
RECIPE('coal-molten-salt-03'):remove_unlock('coalplant-mk03')
RECIPE('coal-molten-salt-04'):remove_unlock('coalplant-mk04')
data.raw.recipe['coal-molten-salt-01'] = nil
data.raw.recipe['coal-molten-salt-02'] = nil
data.raw.recipe['coal-molten-salt-03'] = nil
data.raw.recipe['coal-molten-salt-04'] = nil

for name, info in pairs{
    ['py-burner'] = {type = 'furnace', consumption = '500kW', connections = burner, max_temperature = 500},
    ['py-coal-powerplant-mk01'] = {type = 'assembling-machine', consumption = '10MW', connections = coal_plant, max_temperature = 1000},
    ['py-coal-powerplant-mk02'] = {type = 'assembling-machine', consumption = '20MW', connections = coal_plant, max_temperature = 1000},
    ['py-coal-powerplant-mk03'] = {type = 'assembling-machine', consumption = '40MW', connections = coal_plant, max_temperature = 1000},
    ['py-coal-powerplant-mk04'] = {type = 'assembling-machine', consumption = '80MW', connections = coal_plant, max_temperature = 1000},
} do
    local type = info.type
    local entity = data.raw[type][name]
    data.raw[type][name] = nil
    entity.type = 'reactor'
    entity.consumption = info.consumption
    entity.working_light_picture = {
        filename = '__pycoalprocessinggraphics__/graphics/empty.png',
        size = 1,
        priority = 'high',
        direction_count = 1,
        frame_count = 1,
        line_length = 1
    }
    entity.heat_buffer = {
        connections = info.connections,
        specific_heat = '1W',
        max_transfer = '100GW',
        max_temperature = info.max_temperature
    }
    entity.neighbour_bonus = 0
    entity.scale_energy_usage = true
    data:extend{entity}
end