RECIPE {
    type = 'recipe',
    name = 'residual-gas-subsitution',
    category = 'moon',
    enabled = false,
    energy_required = 255,
    ingredients = {
        {type = 'fluid', name = 'water', amount = 100},
        {type = 'fluid', name = 'residual-gas', amount = 100},
        {type = 'item', name = 'moondrop-seed', amount = 1}
    },
    results = {
        {type = 'fluid', name = 'methane', amount = 60}
    },
    main_product = 'methane'
}:add_unlock("moondrop")

RECIPE {
    type = 'recipe',
    name = 'methane-reconstitution-moondrop',
    category = 'distilator',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 900},
        {type = 'fluid', name = 'hydrogen', amount = 400},
        {type = 'item', name = 'moondrop-seeds', amount = 1}
    },
    results = {
        {type = 'fluid', name = 'carbon-monoxide', amount = 400},
        {type = 'fluid', name = 'oxygen', amount = 400},
        {type = 'fluid', name = 'methane', amount = 550},
    },
    main_product = 'methane'
}:add_unlock("moondrop")