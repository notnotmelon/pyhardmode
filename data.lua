_G.electric_mining_drill_fluidbox = data.raw['mining-drill']['electric-mining-drill'].input_fluid_box

--purest nitrogen

RECIPE {
    type = 'recipe',
    name = 'purest-nitrogen-void',
    category = 'vacuum',
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = 'fluid', name = 'purest-nitrogen-gas', amount = 60}
    },
    results = {
        {type = 'fluid', name = 'pressured-air', amount = 60}
    },
    main_product = 'pressured-air'
}:add_unlock('nitrogen-mk01')
data.raw.recipe['purest-nitrogen-gas'].localised_name = {'recipe-name.fractional-distillation'}
data.raw.recipe['purest-nitrogen-gas'].localised_description = {'recipe-name.fractional-distillation'}

--chlorine

RECIPE {
    type = 'recipe',
    name = 'chloride-void-iron-oxide',
    category = 'hpf',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = 'fluid', name = 'chlorine', amount = 60},
        {type = 'item', name = 'iron-plate', amount = 1},
    },
    results = {
        {type = 'item', name = 'iron-oxide', amount = 1},
    },
    main_product = 'iron-oxide'
}:add_unlock('electrolysis')

RECIPE {
    type = 'recipe',
    name = 'chloride-void-muddy-sludge',
    category = 'hydrocyclone',
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = 'fluid', name = 'water', amount = 100},
        {type = 'fluid', name = 'chlorine', amount = 50},
        {type = 'item', name = 'gravel', amount = 1},
    },
    results = {
        {type = 'fluid', name = 'dirty-water-heavy', amount = 50},
    },
    main_product = 'dirty-water-heavy'
}:add_unlock('advanced-mining-facilities')

--limestone

RECIPE {
    type = 'recipe',
    name = 'limestone-void',
    category = 'secondary-crusher',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = 'item', name = 'soil', amount = 1},
        {type = 'item', name = 'limestone', amount = 2},
    },
    results = {
        {type = 'item', name = 'soil', amount = 2, catalyst_amount = 1},
        {type = 'item', name = 'limestone', amount = 1, catalyst_amount = 1},
    },
    main_product = 'soil'
}:add_unlock('crusher-2')

--sulfur

RECIPE {
    type = 'recipe',
    name = 'sulfur-void-tar',
    category = 'washer',
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = 'item', name = 'sulfur', amount = 1},
        {type = 'item', name = 'kerogen', amount = 1},
        {type = 'fluid', name = 'water', amount = 50},
    },
    results = {
        {type = 'fluid', name = 'tar', amount = 50},
    },
    main_product = 'tar'
}:add_unlock('fluid-processing-machines-1')

RECIPE {
    type = 'recipe',
    name = 'sulfur-void-water',
    category = 'desulfurization',
    enabled = false,
    energy_required = 8,
    ingredients = {
        {type = 'item', name = 'sulfur', amount = 1},
        {type = 'fluid', name = 'water', amount = 50},
    },
    results = {
        {type = 'fluid', name = 'water', amount = 10, catalyst_amount = 10},
    },
    main_product = 'water'
}:add_unlock('desulfurization')

--muddy sludge

RECIPE {
    type = 'recipe',
    name = 'muddy-sludge-void-electrolyzer',
    category = 'electrolyzer',
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = 'fluid', name = 'dirty-water-light', amount = 100},
    },
    results = {
        {type = 'fluid', name = 'water', amount = 100},
        {type = 'fluid', name = 'oxygen', amount = 10},
        {type = 'item', name = 'soil', amount = 5},
    },
    main_product = 'water'
}:add_unlock('electrolysis')

--tailings dust

RECIPE('tailings-classification'):add_unlock('fluid-processing-machines-1').category = 'solid-separator'
data.raw.recipe['tailings-classification'].energy_required = 1
data.raw.recipe['tailings-classification'].results = {
    data.raw.recipe['tailings-classification'].results[1],
    {'ore-titanium', 1},
    {'ore-tin', 1},
}

--coal gas
--aromatics
--slacked lime
--saline water

-- plant/animal

--skin
--photophores
--bonemeal
--blood
--guts
--fish oil
--wastewater
--yaedols spores
--used comb
--anthropod blood

-- ore

--vanadium pulp stage 3
--coal water slurry
--titanium overflow waste
--titanium pulp (stage 3)
--purex concentrate 1
--antimony phosphate 2
--plutonium isotopes

-- oil

--medium disilates
--creosote
--refined natural gas
--anthracene oil
--benzene
--residual oil
--naphtha
--gasolene
--pitch

-- other

--methanol
--coke oven gas
--hydroflouric acid
--vanadates
--glycerol
--ammonia/cyanic acid
--hydrogen chloride
--acetone