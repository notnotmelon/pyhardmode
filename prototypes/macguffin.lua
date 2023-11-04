ITEM {
    type = 'item',
    name = 'macguffin',
    icon = '__pyhardmode__/graphics/macguffin.png',
    icon_size = 64,
    pictures = {
        {size = 256, filename = '__pyhardmode__/graphics/glitch.png', scale = 10, blend_mode = 'multiplicative-with-alpha'},
        {size = 256, filename = '__pyhardmode__/graphics/glitch.png', scale = 10, blend_mode = 'additive-soft'},
        {size = 256, filename = '__pyhardmode__/graphics/glitch.png', scale = 10, blend_mode = 'additive'},
        {size = 256, filename = '__pyhardmode__/graphics/glitch.png', scale = 10, blend_mode = 'normal'},
    },
    flags = {'not-stackable'},
    subgroup = 'space-related',
    order = 'z',
    stack_size = 1
}

--Nexelit-titanium-kevlar-aramid-tritium-unobtanium superpolymer nanowoven biocomposite smart self-healing quantum N-dimensional hyperfabric
RECIPE {
    type = 'recipe',
    name = 'macguffin',
    category = 'antelope',
    enabled = false,
    energy_required = 60,
    ingredients = {
        {type = 'item', name = 'reduced-nexelit', amount = 3},
        {type = 'item', name = 'sintered-ti', amount = 4},
        {type = 'item', name = 'sintered-zinc', amount = 2},
        {type = 'item', name = 'high-grade-quartz', amount = 1},
        {type = 'item', name = 'kevlar-coating', amount = 2},
        {type = 'item', name = 'aramid', amount = 5},
        {type = 'fluid', name = 'tritium', amount = 50},
        {type = 'item', name = 'ernico', amount = 2},
        {type = 'item', name = 'phthalic-anhydride', amount = 3},
        {type = 'item', name = 'nanofibrils', amount = 1},
        {type = 'item', name = 'biopolymer', amount = 2},
        {type = 'item', name = 'fish-egg-mk04', amount = 3},
        {type = 'item', name = 'quantum-dots', amount = 1},
        {type = 'item', name = 'time-crystal', amount = 1},
        {type = 'item', name = 'hyperelastic-material', amount = 2},
        {type = 'item', name = 'cage-antelope', amount = 1},
        {type = 'item', name = 'strangelets', amount = 1},
        {type = 'item', name = 'ulric-infusion', amount = 1},
        {type = 'fluid', name = 'ac-oxygenated', amount = 50},
        {type = 'item', name = 'numal-mk04', amount = 1},
        {type = 'item', name = 'antelope', amount = 1},
        {type = 'item', name = 'replicator-bioreserve', amount = 1},
        {type = 'item', name = 'yag-laser-module', amount = 1},
        {type = 'item', name = 'cognition-osteochain', amount = 2},
        {type = 'item', name = 'pyrolytic-carbon', amount = 2},
        {type = 'item', name = 'pheromones', amount = 1},
        {type = 'item', name = 'navens-abomination', amount = 3},
        {type = 'item', name = 'fungicide', amount = 5},
    },
    results = {
        {type = 'item', name = 'macguffin', amount = 1, probability = 0.1},
        {type = 'item', name = 'caged-antelope', amount = 1, probability = 0.5},
        {type = 'item', name = 'yag-laser-module', amount = 1, probability = 0.9},
    },
    main_product = 'macguffin',
}:add_unlock('space-science-pack')

ITEM {
    type = 'item',
    name = 'quantum-simulation-data',
    icon = '__pyhardmode__/graphics/quantum-simulation-data.png',
    icon_size = 64,
    subgroup = 'space-related',
    order = 'y',
    stack_size = 100
}

data.raw.recipe['space-science-pack'].results = {{name = 'quantum-simulation-data', amount = 1, type = 'item'}}

RECIPE {
    name = 'space-science-pack-real',
    type = 'recipe',
    category = 'quantum',
    enabled = false,
    energy_required = 600,
    ingredients = {
        {type = 'item', name = 'quantum-simulation-data', amount = 2},
        {type = 'item', name = 'macguffin', amount = 1},
    },
    results = {
        {type = 'item', name = 'space-science-pack', amount = 6},
    },
}:add_unlock('quantum')

if not mods['pystellarexpedition'] then
    data.raw['assembling-machine']['quantum-computer'].energy_usage = '10GW'
end