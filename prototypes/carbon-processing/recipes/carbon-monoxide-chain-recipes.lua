RECIPE {
    type = 'recipe',
    name = 'rough-carbon',
    category = 'hpf',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 75}
    },
    results = {
        {type = 'item', name = 'rough-carbon-dust', amount = 1},
    },
    main_product = 'rough-carbon-dust'
}:add_unlock("coal-processing-1")

RECIPE {
    type = 'recipe',
    name = 'carbon-monoxide',
    category = 'hpf',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 75},
        {type = 'item', name = 'rough-carbon-dust', amount = 1},
    },
    results = {
        {type = 'fluid', name = 'carbon-monoxide', amount = 100},
    },
    main_product = 'carbon-monoxide'
}:add_unlock("coal-processing-1")

RECIPE {
    type = 'recipe',
    name = 'carbon-monoxide-methane-breakup',
    category = 'distilator',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'carbon-monoxide', amount = 100},
        {type = 'fluid', name = 'methane', amount = 125},
        {type = 'fluid', name = 'water', amount = 300},
    },
    results = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 225},
        {type = 'fluid', name = 'hydrogen', amount = 300}
    },
    main_product = 'hydrogen'
}:add_unlock("coal-processing-1")

RECIPE {
    type = 'recipe',
    name = 'methane-reconstitution',
    category = 'distilator',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 225},
        {type = 'fluid', name = 'hydrogen', amount = 100}
    },
    results = {
        {type = 'fluid', name = 'carbon-monoxide', amount = 100},
        {type = 'fluid', name = 'oxygen', amount = 100},
        {type = 'fluid', name = 'methane', amount = 125},
    },
    main_product = 'oxygen'
}:add_unlock("coal-processing-1")

RECIPE {
    type = 'recipe',
    name = 'methane-to-water',
    category = 'distilator',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'methane', amount = 125},
        {type = 'fluid', name = 'oxygen', amount = 100}
    },
    results = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 75},
        {type = 'fluid', name = 'water', amount = 150}
    },
    main_product = 'water'
}:add_unlock("coal-processing-1")