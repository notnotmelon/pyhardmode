local collision_mask_util = require '__core__/lualib/collision-mask-util'

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
    'geothermal-crack'
}

local categories = {}
for _, resource in pairs(resource_rocks) do
    resource = data.raw.resource[resource]
    local mask = collision_mask_util.get_mask(resource)
    collision_mask_util.add_layer(mask, 'object-layer')
    resource.collision_mask = mask
    categories[resource.category] = true
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