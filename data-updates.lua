require 'prototypes.void-machines'
require 'prototypes.residual-gas'
require 'prototypes.heat'
require 'prototypes.mining'
require 'prototypes.biomass'

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

data.raw['logistic-robot']['py-logistic-robot-01'].max_bpayload_size = 1
data.raw['logistic-robot']['py-logistic-robot-02'].max_payload_size = 2
data.raw['logistic-robot']['l-pynobot-mk03'].max_payload_size = 3
data.raw['logistic-robot']['logistic-robot-ht'].max_payload_size = 4

for am = 5, 1, -1 do
    for fm = 5, 1, -1 do
        local name = 'beacon-AM' .. am ..'-FM' .. fm
        local beacon = data.raw.beacon[name]
        beacon.distribution_effectivity = 0.2 * am * fm
    end
end