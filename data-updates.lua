local collision_mask_util = require '__core__/lualib/collision-mask-util'
local noise = require('noise')

for _, void_machine in pairs{'py-sinkhole', 'py-gas-vent'} do
    data.raw['assembling-machine'][void_machine] = data.raw.furnace[void_machine]
    data.raw['assembling-machine'][void_machine].type = 'assembling-machine'
    data.raw['assembling-machine'][void_machine].crafting_speed = 1
    data.raw['assembling-machine'][void_machine].energy_source = {
        type = 'electric',
        usage_priority = 'secondary-input',
        emissions_per_minute = 0,
    }
    data.raw['assembling-machine'][void_machine].energy_usage = '100kW'
    data.raw.furnace[void_machine] = nil
end

data.raw['assembling-machine']['py-sinkhole'].fixed_recipe = 'water-pyvoid-fluid'
data.raw['assembling-machine']['py-sinkhole'].collision_mask = {'ground-tile', 'object-layer'}

RECIPE('py-gas-vent'):remove_unlock('coal-processing-1')
RECIPE('py-gas-vent'):add_unlock('filtration')
RECIPE('tailings-pond'):remove_unlock('coal-processing-1')
RECIPE('tailings-pond'):add_unlock('filtration-mk02')
RECIPE('tailings-pond'):add_ingredient{'small-parts-03', 10}
RECIPE('tailings-pond'):add_ingredient{'saturated-nexelit-cartridge', 10}
RECIPE('tailings-pond'):add_ingredient{'super-steel', 20}
RECIPE('bio-reactor-mk01'):remove_ingredient('tailings-pond')
RECIPE('bio-reactor-mk01-with-baffles'):remove_ingredient('tailings-pond')
RECIPE('centrifugal-pan-mk01'):remove_ingredient('tailings-pond')

data.raw['item-subgroup']['py-void-items'].group = 'coal-processing'
data.raw['item-subgroup']['py-void-liquid'].group = 'coal-processing'
data.raw['item-subgroup']['py-void-gas'].group = 'coal-processing'

local resource_rocks = {
    'titanium-rock',
    'regolites',
    'salt-rock',
    'sulfur-patch',
    'uranium-rock',
    'tin-rock',
    'rare-earth-bolide',
    'quartz-rock',
    'phosphate-rock-02',
    'phosphate-rock',
    'nickel-rock',
    'nexelit-rock',
    'lead-rock',
    'iron-rock',
    'zinc-rock',
    'aluminium-rock',
    'chromium-rock',
    'coal-rock',
    'copper-rock',
    'geothermal-crack',
    'volcanic-pipe'
}

local categories = {}
for _, resource in pairs(resource_rocks) do
    resource = data.raw.resource[resource]
    local mask = collision_mask_util.get_mask(resource)
    collision_mask_util.add_layer(mask, 'object-layer')
    resource.collision_mask = mask
    categories[resource.category] = true
    resource.infinite = true
    resource.infinite_depletion_amount = 0
    resource.normal = 10
    resource.minimum = resource.normal
    if resource.autoplace then
        resource.autoplace.richness_expression = noise.define_noise_function(function(x, y, tile, map)
            return 10
        end)
    end
end

for _, miner in pairs(data.raw['mining-drill']) do
    if miner.resource_categories then
        for _, category in pairs(miner.resource_categories) do
            if categories[category] then
                local mask = collision_mask_util.get_mask(miner)
                collision_mask_util.remove_layer(mask, 'object-layer')
                miner.collision_mask = mask
                break
            end
        end
    end
end

data.raw.resource['stone'].minable.fluid_amount = 30
data.raw.resource['stone'].minable.required_fluid = 'carbolic-oil'
data.raw.resource['copper-ore'].minable.fluid_amount = 500
data.raw.resource['copper-ore'].minable.required_fluid = 'water'

data.raw['mining-drill']['electric-mining-drill'].input_fluid_box = electric_mining_drill_fluidbox
data.raw['mining-drill']['burner-mining-drill'].input_fluid_box = {
    production_type = 'input',
    pipe_covers = pipecoverspictures(),
    base_area = 1,
    height = 1,
    base_level = -1,
    pipe_connections = {
        {type = 'input', position = {0.5, 1.5}}
    }
}

for name, connections in pairs{
    ['advanced-foundry-mk01'] = {
        {
            position = {2.7, 0.5},
            direction = defines.direction.north
        }
    },
    ['advanced-foundry-mk02'] = {
        {
            position = {2.7, 0.5},
            direction = defines.direction.north
        }
    },
    ['advanced-foundry-mk03'] = {
        {
            position = {2.7, 0.5},
            direction = defines.direction.north
        }
    },
    ['advanced-foundry-mk04'] = {
        {
            position = {2.7, 0.5},
            direction = defines.direction.north
        }
    },
    ['rhe'] = {
        {
            position = {2.2, 0},
            direction = defines.direction.east
        },
        {
            position = {-2.2, 0},
            direction = defines.direction.west
        }
    },
    ['incubator-mk01'] = {
        {
            position = {-3.2, 2.0},
            direction = defines.direction.west
        }
    },
    ['incubator-mk02'] = {
        {
            position = {-3.2, 2.0},
            direction = defines.direction.west
        }
    },
    ['incubator-mk03'] = {
        {
            position = {-3.2, 2.0},
            direction = defines.direction.west
        }
    },
    ['incubator-mk04'] = {
        {
            position = {-3.2, 2.0},
            direction = defines.direction.west
        }
    },
    ['simik-den-mk01'] = {
        {
            position = {2.0, -7.8},
            direction = defines.direction.north
        }
    },
    ['simik-den-mk02'] = {
        {
            position = {2.0, -7.8},
            direction = defines.direction.north
        }
    },
    ['simik-den-mk03'] = {
        {
            position = {2.0, -7.8},
            direction = defines.direction.north
        }
    },
    ['simik-den-mk04'] = {
        {
            position = {2.0, -7.8},
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