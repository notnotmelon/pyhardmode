local FUN = require '__pycoalprocessing__/prototypes/functions/functions'

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