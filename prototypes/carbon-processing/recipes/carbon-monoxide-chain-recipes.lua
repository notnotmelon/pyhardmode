RECIPE {
    type = 'recipe',
    name = 'rough-carbon',
    category = 'hpf',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 300}
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
        {type = 'fluid', name = 'carbon-dioxide', amount = 300},
        {type = 'item', name = 'rough-carbon-dust', amount = 1},
    },
    results = {
        {type = 'fluid', name = 'carbon-monoxide', amount = 400},
    },
    main_product = 'carbon-monoxide'
}:add_unlock("coal-processing-1")

RECIPE {
    type = 'recipe',
    name = 'carbon-monoxide-methane-breakup',
    category = 'distillator',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'carbon-monoxide', amount = 400},
        {type = 'fluid', name = 'methane', amount = 500},
        {type = 'fluid', name = 'water', amount = 1200},
    },
    results = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 900},
        {type = 'fluid', name = 'hydrogen', amount = 1200}
    }
}:add_unlock("coal-processing-1")

RECIPE {
    type = 'recipe',
    name = 'methane-reconstitution',
    category = 'distillator',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 900},
        {type = 'fluid', name = 'hydrogen', amount = 400}
    },
    results = {
        {type = 'fluid', name = 'carbon-monoxide', amount = 400},
        {type = 'fluid', name = 'oxygen', amount = 400},
        {type = 'fluid', name = 'methane', amount = 500},
    },
    main_product = 'oxygen'
}:add_unlock("coal-processing-1")

RECIPE {
    type = 'recipe',
    name = 'methane-to-water',
    category = 'distillator',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'methane', amount = 500},
        {type = 'fluid', name = 'oxygen', amount = 400}
    },
    results = {
        {type = 'fluid', name = 'carbon-dioxide', amount = 300},
        {type = 'fluid', name = 'water', amount = 600}
    },
    main_product = 'water'
}:add_unlock("coal-processing-1")