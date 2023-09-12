local FUN = require '__pycoalprocessing__/prototypes/functions/functions'
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

data.raw['assembling-machine']['py-gas-vent'].crafting_speed = 5
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
RECIPE('tailings-classification'):remove_unlock('separation')
data.raw.item['ash'].stack_size = 500
data.raw.fluid['acetylene'].fuel_value = '750kJ'
data.raw.fluid['coke-oven-gas'].fuel_value = '750kJ'
RECIPE('print-brain'):remove_unlock('organ-printing-mk02'):add_unlock('organ-printing')
RECIPE('blood-to-zinc'):remove_unlock('molecular-decohesion-mk02'):add_unlock('molecular-decohesion').results[1].amount = 7

data.raw['assembling-machine']['eaf-mk01'].energy_usage = '30MW'
data.raw['assembling-machine']['eaf-mk02'].energy_usage = '60MW'
data.raw['assembling-machine']['eaf-mk03'].energy_usage = '90MW'
data.raw['assembling-machine']['eaf-mk04'].energy_usage = '120MW'

RECIPE('yaedols-spores-to-oxygen'):add_unlock('yaedols-upgrade')
RECIPE('bonemeal-to-geothermal-water'):add_unlock('ulric-upgrade')

for _, chest_type in pairs{'basic', 'active-provider', 'passive-provider', 'buffer', 'storage', 'requester'} do
    local container_type = chest_type == 'basic' and 'container' or 'logistic-container'
    local steel = chest_type == 'basic' and 'steel-chest' or ('logistic-chest-' .. chest_type)
    data.raw[container_type][steel].inventory_size = 20
    data.raw[container_type]['py-shed-' .. chest_type].inventory_size = 40
    data.raw[container_type]['py-storehouse-' .. chest_type].inventory_size = 80
    data.raw[container_type]['py-warehouse-' .. chest_type].inventory_size = 120
    data.raw[container_type]['py-deposit-' .. chest_type].inventory_size = 160
end
data.raw.container['wooden-chest'].inventory_size = 4
data.raw.container['iron-chest'].inventory_size = 8

data.raw['electric-energy-interface']['pydrive_skin'].energy_source.buffer_capacity = '200MW'
data.raw['electric-energy-interface']['pydrive_skin'].energy_usage = '200MW'

RECIPE('neutron-absorber-mk01'):remove_unlock('nuclear-power'):add_unlock('uranium-processing')

if not mods.pystellarexpedition then
    RECIPE('military-science-pack'):add_ingredient{'guar-gum', 1}
    RECIPE('military-science-pack'):add_ingredient{'zipir1', 1}
    RECIPE('capacitor2'):add_ingredient{'cadaveric-arum-seeds', 5}
    RECIPE('chemical-science-pack'):add_ingredient{'mukmoux', 2}
    RECIPE('py-science-pack-3'):add_ingredient{'gas-bladder', 5}
    RECIPE('arqad-propolis-01'):remove_ingredient('dhilmos-egg'):add_ingredient('dhilmos')
    RECIPE('arqad-propolis-02'):remove_ingredient('dhilmos-egg'):add_ingredient{'dhilmos', 2}
end

data.raw.unit['caravan'].affected_by_tiles = false
data.raw.unit['flyavan'].affected_by_tiles = false
data.raw.unit['nukavan'].affected_by_tiles = false

local function undo_biomass(item, type)
    local prototype = data.raw[type][item]
    if not prototype then error(item) end
    prototype.localised_description = nil
    RECIPE('biomass-' .. item):remove_unlock('compost')
    data.raw.recipe['biomass-' .. item] = nil
end

undo_biomass('tar', 'fluid')
undo_biomass('fawogae-spore', 'item')
undo_biomass('fawogae-spore-mk02', 'item')
undo_biomass('fawogae-spore-mk03', 'item')
undo_biomass('fawogae-spore-mk04', 'item')
undo_biomass('navens-spore', 'item')
undo_biomass('bhoddos-spore', 'item')
undo_biomass('yaedols-spores', 'item')
undo_biomass('yaedols-spores-mk02', 'item')
undo_biomass('yaedols-spores-mk03', 'item')
undo_biomass('yaedols-spores-mk04', 'item')
undo_biomass('saps', 'item')
undo_biomass('sap-seeds', 'item')
undo_biomass('dirty-water-light', 'fluid')

-- animal parts
undo_biomass('bonemeal', 'item')
undo_biomass('bones', 'item')
undo_biomass('brain', 'item')
undo_biomass('carapace', 'item')
undo_biomass('chitin', 'item')
undo_biomass('meat', 'item')
undo_biomass('guts', 'item')
undo_biomass('skin', 'item')
undo_biomass('shell', 'item')
undo_biomass('blood', 'fluid')
undo_biomass('psc', 'fluid')
undo_biomass('xenogenic-cells', 'fluid')
undo_biomass('arthropod-blood', 'fluid')

local function nerf_biomass(item, type, multiplier)
    local prototype = data.raw[type][item]
    if not prototype then error(item) end
    local input = data.raw.recipe['biomass-' .. item].ingredients[1]
    local biomass_amount = data.raw.recipe['biomass-' .. item].results[1].amount
    input.amount = input.amount * multiplier
    prototype.localised_description = nil
    FUN.add_to_description(type, prototype, {'item-description.compost-amount', math.floor(biomass_amount / input.amount * 10) / 10})
end

nerf_biomass('kicalk-seeds', 'item', 2)
nerf_biomass('kicalk-seeds-mk02', 'item', 2)
nerf_biomass('kicalk-seeds-mk03', 'item', 2)
nerf_biomass('kicalk-seeds-mk04', 'item', 2)
nerf_biomass('kicalk', 'module', 3)
nerf_biomass('kicalk-mk02', 'module', 2)
nerf_biomass('kicalk-mk03', 'module', 2)
nerf_biomass('kicalk-mk04', 'module', 2)
nerf_biomass('seaweed', 'module', 4)
nerf_biomass('fawogae', 'module', 2)
nerf_biomass('log', 'item', 2)
nerf_biomass('wood', 'item', 2)
nerf_biomass('wood-seeds', 'item', 4)
nerf_biomass('moss', 'module', 5)
nerf_biomass('native-flora', 'item', 2)

RECIPE('seaweed-to-chelator'):remove_unlock('phytomining-mk02')
data.raw.recipe['seaweed-to-chelator'] = nil

for loader, fluid in pairs{
    ['aai-loader'] = 'fish-oil',
    ['aai-fast-loader'] = 'bio-oil',
    ['aai-express-loader'] = 'grease',
} do
    data.raw['storage-tank'][loader .. '-pipe'].fluid_box.filter = fluid
    local localised_description = data.raw.technology[loader].localised_description
    localised_description[3] = fluid
    localised_description = {'', localised_description, ' (', {'fluid-name.' .. fluid}, ')'}
    data.raw.technology[loader].localised_description = localised_description
    data.raw['loader-1x1'][loader].localised_description = localised_description
    data.raw.item[loader].localised_description = localised_description
end

data.raw['logistic-robot']['py-logistic-robot-01'].max_payload_size = 1
data.raw['logistic-robot']['py-logistic-robot-02'].max_payload_size = 2
data.raw['logistic-robot']['l-pynobot-mk03'].max_payload_size = 3
data.raw['logistic-robot']['logistic-robot-ht'].max_payload_size = 4