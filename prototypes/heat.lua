for name, connections in pairs{
    ['advanced-foundry-mk01'] = {
        {
            position = {2.5, 0.5},
            direction = defines.direction.east
        }
    },
    ['advanced-foundry-mk02'] = {
        {
            position = {2.5, 0.5},
            direction = defines.direction.east
        }
    },
    ['advanced-foundry-mk03'] = {
        {
            position = {2.5, 0.5},
            direction = defines.direction.east
        }
    },
    ['advanced-foundry-mk04'] = {
        {
            position = {2.5, 0.5},
            direction = defines.direction.east
        }
    },
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
    ['incubator-mk01'] = {
        {
            position = {-3, 2.0},
            direction = defines.direction.west
        }
    },
    ['incubator-mk02'] = {
        {
            position = {-3, 2.0},
            direction = defines.direction.west
        }
    },
    ['incubator-mk03'] = {
        {
            position = {-3, 2.0},
            direction = defines.direction.west
        }
    },
    ['incubator-mk04'] = {
        {
            position = {-3, 2.0},
            direction = defines.direction.west
        }
    },
    ['simik-den-mk01'] = {
        {
            position = {2.0, -7.5},
            direction = defines.direction.north
        }
    },
    ['simik-den-mk02'] = {
        {
            position = {2.0, -7.5},
            direction = defines.direction.north
        }
    },
    ['simik-den-mk03'] = {
        {
            position = {2.0, -7.5},
            direction = defines.direction.north
        }
    },
    ['simik-den-mk04'] = {
        {
            position = {2.0, -7.5},
            direction = defines.direction.north
        }
    },
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

RECIPE('heat-pipe'):remove_unlock('advanced-material-processing-2'):add_unlock('py-burner')