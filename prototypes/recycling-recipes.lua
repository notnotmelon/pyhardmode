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
data.raw.recipe['purest-nitrogen-gas'].localised_description = {'recipe-description.fractional-distillation'}

--oxygen

RECIPE {
    type = 'recipe',
    name = 'water-from-oxygen-and-hydrogen',
    category = 'quenching-tower',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = 'fluid', name = 'oxygen', amount = 100},
        {type = 'fluid', name = 'hydrogen', amount = 200},
    },
    results = {
        {type = 'fluid', name = 'water', amount = 300},
    },
    main_product = 'water'
}:add_unlock('electrolysis')

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
    energy_required = 0.5,
    ingredients = {
        {type = 'item', name = 'soil', amount = 2},
        {type = 'item', name = 'limestone', amount = 3},
    },
    results = {
        {type = 'item', name = 'soil', amount = 3, catalyst_amount = 2},
        {type = 'item', name = 'limestone', amount = 2, catalyst_amount = 2},
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
    energy_required = 1,
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

RECIPE('organics-from-dirty-water'):remove_unlock('fluid-separation'):add_unlock('biomassplant-mk04')

if mods.PyBlock then
    RECIPE {
        type = 'recipe',
        name = 'muddy-sludge-void',
        category = 'washer',
        enabled = true,
        energy_required = 4,
        ingredients = {
            {type = 'fluid', name = 'dirty-water-light', amount = 100},
        },
        results = {
            {type = 'fluid', name = 'water', amount = 100},
            {type = 'item', name = 'soil', amount = 10},
        },
        main_product = 'soil'
    }
else
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
end

--coal gas

RECIPE {
    type = 'recipe',
    name = 'coal-gas-void',
    category = 'hpf',
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = 'fluid', name = 'coal-gas', amount = 50},
    },
    results = {
        {type = 'item', name = 'ash', amount = 1},
    },
    main_product = 'ash'
}:add_unlock('coal-processing-1')

--slacked lime

RECIPE {
    type = 'recipe',
    name = 'slacked-lime-void',
    category = 'evaporator',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = 'fluid', name = 'slacked-lime', amount = 60},
    },
    results = {
        {type = 'item', name = 'lime', amount = 1},
        {type = 'item', name = 'gravel', amount = 1},
    },
    main_product = 'lime'
}:add_unlock('fluid-processing-machines-1')

--tailings dust

RECIPE('tailings-classification'):add_unlock('fluid-processing-machines-1').category = 'solid-separator'
data.raw.recipe['tailings-classification'].energy_required = 1
data.raw.recipe['tailings-classification'].results = {
    data.raw.recipe['tailings-classification'].results[1],
    {'ore-titanium', 1},
    {'ore-tin', 1},
}

-- plant/animal

--skin

RECIPE {
    type = 'recipe',
    name = 'skin-to-lead',
    category = 'atomizer',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'item', name = 'skin', amount = 7},
    },
    results = {
        {type = 'item', name = 'ore-lead', amount = 5},
    },
    main_product = 'ore-lead',
}:add_unlock('molecular-decohesion')

RECIPE {
    type = 'recipe',
    name = 'skin-fatty-acids',
    category = 'olefin',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'item', name = 'skin', amount = 50},
        {type = 'fluid', name = 'middle-processed-lard', amount = 20},
    },
    results = {
        {type = 'fluid', name = 'fatty-acids', amount = 50},
    },
    main_product = 'fatty-acids',
}:add_unlock('eva')

--bonemeal

RECIPE {
    type = 'recipe',
    name = 'bonemeal-to-geothermal-water',
    category = 'atomizer',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'item', name = 'bonemeal', amount = 5},
    },
    results = {
        {type = 'fluid', name = 'geothermal-water', amount = 60},
    },
    main_product = 'geothermal-water',
}--:add_unlock('ulric-upgrade')

--bones

RECIPE {
    type = 'recipe',
    name = 'bones-to-kerogen',
    category = 'atomizer',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'item', name = 'bones', amount = 5},
    },
    results = {
        {type = 'item', name = 'kerogen', amount = 8},
    },
    main_product = 'kerogen',
}:add_unlock('molecular-decohesion')

--guts

RECIPE {
    type = 'recipe',
    name = 'guts-to-acetic-acid',
    category = 'atomizer',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'item', name = 'guts', amount = 20},
    },
    results = {
        {type = 'fluid', name = 'acetic-acid', amount = 60},
    },
    main_product = 'acetic-acid',
}:add_unlock('molecular-decohesion-mk02')

RECIPE {
    type = 'recipe',
    name = 'guts-to-jerky',
    category = 'smelting',
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = 'item', name = 'guts', amount = 10},
    },
    results = {
        {type = 'item', name = 'dried-meat', amount = 5},
    },
    main_product = 'dried-meat',
}:add_unlock('microbiology-mk01')

RECIPE {
    type = 'recipe',
    name = 'jerky-to-phytoplankton',
    category = 'plankton',
    enabled = false,
    energy_required = 30,
    ingredients = {
        {type = 'fluid', name = 'water', amount = 500},
        {type = 'item', name = 'dried-meat', amount = 1},
    },
    results = {
        {type = 'fluid', name = 'phytoplankton', amount = 10},
    },
    main_product = 'phytoplankton',
}:add_unlock('microbiology-mk01')

--wastewater

RECIPE {
    type = 'recipe',
    name = 'waste-water-void',
    category = 'quenching-tower',
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = 'fluid', name = 'waste-water', amount = 50},
        {type = 'fluid', name = 'chlorine', amount = 10},
    },
    results = {
        {type = 'fluid', name = 'water', amount = 50},
    },
    main_product = 'water',
}:add_unlock('fish-mk01')

--yaedols spores

RECIPE {
    type = 'recipe',
    name = 'yaedols-spores-to-oxygen',
    category = 'hpf',
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = 'item', name = 'yaedols-spores', amount = 20},
    },
    results = {
        {type = 'fluid', name = 'oxygen', amount = 20},
    },
    main_product = 'oxygen',
}--:add_unlock('yaedols-upgrade')

--used comb

RECIPE {
    type = 'recipe',
    name = 'used-comb-to-residual-mixture',
    category = 'eaf',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = 'item', name = 'used-comb', amount = 3},
        {type = 'item', name = 'graphite', amount = 1},
    },
    results = {
        {type = 'fluid', name = 'residual-mixture', amount = 60},
    },
    main_product = 'residual-mixture',
}:add_unlock('arqad')

--arthropod blood

RECIPE {
    type = 'recipe',
    name = 'arthropod-blood-to-blood',
    category = 'bio-reactor',
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = 'fluid', name = 'arthropod-blood', amount = 30},
        {type = 'item', name = 'grade-1-iron', amount = 1},
    },
    results = {
        {type = 'fluid', name = 'blood', amount = 30},
        {type = 'item', name = 'grade-1-copper', amount = 1},
    },
    main_product = 'blood'
}:add_unlock('water-invertebrates-mk01')

--chitin

RECIPE {
    type = 'recipe',
    name = 'chitin-void',
    category = 'tar',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {'chitin', 3},
        {type = 'fluid', name = 'middle-oil', amount = 100},
        {type = 'fluid', name = 'steam', amount = 50, minimum_temperature = 250},
    },
    results = {
        {type = 'fluid', name = 'carbolic-oil', amount = 100},
        {type = 'fluid', name = 'naphthalene-oil', amount = 50},
    },
    main_product = 'carbolic-oil',
}:add_unlock('rendering')

--sodium hydroxide

RECIPE {
    type = 'recipe',
    name = 'sodium-hydroxide-void',
    category = 'washer',
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = 'fluid', name = 'water', amount = 100},
        {type = 'item', name = 'sodium-hydroxide', amount = 10},
    },
    results = {
        {type = 'fluid', name = 'water-saline', amount = 100},
    },
    main_product = 'water-saline',
}:add_unlock('electrolysis')

--flue gas

local fluegas_to_ash = table.deepcopy(data.raw.recipe['fluegas-filtration'])
data.raw.recipe['fluegas-filtration'].results = {}
data.raw.recipe['fluegas-filtration'].energy_required = 2
fluegas_to_ash.name = 'fluegas-to-ash'
fluegas_to_ash.category = 'quenching-tower'
data:extend{fluegas_to_ash}
RECIPE('fluegas-to-ash'):add_unlock('tar-processing')

-- ore

--vanadium pulp stage 3

RECIPE {
    type = 'recipe',
    name = 'vanadium-pulp-3-void',
    category = 'agitator',
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = 'fluid', name = 'vpulp3', amount = 100},
        {type = 'fluid', name = 'coalbed-gas', amount = 50},
    },
    results = {
        {type = 'fluid', name = 'vpulp1', amount = 50},
        {type = 'fluid', name = 'flue-gas', amount = 50},
    },
    main_product = 'vpulp1',
}:add_unlock('vanadium-processing')

--titanium overflow waste

RECIPE {
    type = 'recipe',
    name = 'titanium-overflow-waste-void',
    category = 'evaporator',
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = 'fluid', name = 'ti-overflow-waste', amount = 25},
    },
    results = {
        {type = 'item', name = 'ti-rejects', amount = 1},
    },
    main_product = 'ti-rejects',
}:add_unlock('titanium-mk02')

--titanium pulp (stage 3)

RECIPE {
    type = 'recipe',
    name = 'titanium-pulp-stage-3-void',
    category = 'pan',
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = 'fluid', name = 'ti-pulp-03', amount = 60},
    },
    results = {
        {type = 'fluid', name = 'ti-overflow-waste', amount = 30},
        {type = 'fluid', name = 'mibc', amount = 30},
    },
    main_product = 'mibc',
}:add_unlock('titanium-mk02')

--purex concentrate 1 & antimony phosphate 2

RECIPE {
    type = 'recipe',
    name = 'purex-antimony-void',
    category = 'scrubber',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'sb-phosphate-2', amount = 60},
        {type = 'fluid', name = 'purex-concentrate-1', amount = 30},
        {type = 'item', name = 'plastic-bar', amount = 1},
    },
    results = {
        {type = 'fluid', name = 'phosphorous-acid', amount = 120},
        {type = 'item', name = 'sb-oxide', amount = 1, probability = 0.30},
        {type = 'item', name = 'plastic-bar', amount = 1, probability = 0.7},
    },
    main_product = 'phosphorous-acid',
}:add_unlock('uranium-processing')

--plutonium isotopes

RECIPE {
    type = 'recipe',
    name = 'plutonium-shuffle-1',
    category = 'neutron-absorber',
    enabled = false,
    energy_required = 200 / 0.4517,
    ingredients = {
        {type = 'fluid', name = 'plutonium-peroxide', amount = 35},
        {type = 'item', name = 'pu-239', amount = 1},
        {type = 'item', name = 'pu-241', amount = 1},
    },
    results = {
        {type = 'item', name = 'pu-240', amount = 1},
        {type = 'item', name = 'pu-242', amount = 1},
    },
    main_product = 'pu-240',
}:add_unlock('uranium-processing')

RECIPE {
    type = 'recipe',
    name = 'plutonium-shuffle-2',
    category = 'neutron-absorber',
    enabled = false,
    energy_required = 200 / 0.986,
    ingredients = {
        {type = 'fluid', name = 'plutonium-peroxide', amount = 35},
        {type = 'item', name = 'pu-239', amount = 1},
        {type = 'item', name = 'pu-240', amount = 1},
    },
    results = {
        {type = 'item', name = 'pu-238', amount = 1},
        {type = 'item', name = 'pu-242', amount = 1},
    },
    main_product = 'pu-242',
}:add_unlock('uranium-processing')

RECIPE {
    type = 'recipe',
    name = 'plutonium-shuffle-3',
    category = 'neutron-absorber',
    enabled = false,
    energy_required = 200 / 0.71,
    ingredients = {
        {type = 'fluid', name = 'plutonium-peroxide', amount = 35},
        {type = 'item', name = 'pu-242', amount = 2},
    },
    results = {
        {type = 'item', name = 'pu-241', amount = 1},
        {type = 'item', name = 'pu-239', amount = 1},
    },
    main_product = 'pu-241',
}:add_unlock('uranium-processing')

RECIPE {
    type = 'recipe',
    name = 'plutonium-shuffle-4',
    category = 'neutron-absorber',
    enabled = false,
    energy_required = 200 / 0.362,
    ingredients = {
        {type = 'fluid', name = 'plutonium-peroxide', amount = 35},
        {type = 'item', name = 'pu-241', amount = 1},
        {type = 'item', name = 'pu-242', amount = 1},
    },
    results = {
        {type = 'item', name = 'pu-239', amount = 1},
        {type = 'item', name = 'pu-240', amount = 1},
    },
    main_product = 'pu-239',
}:add_unlock('uranium-processing')

data.raw.recipe['plutonium-seperation'].energy_required = 60

--sand

RECIPE {
    type = 'recipe',
    name = 'sand-void-glass',
    category = 'glassworks',
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = 'item', name = 'sand', amount = 5},
        {type = 'item', name = 'ore-quartz', amount = 4},
    },
    results = {
        {type = 'fluid', name = 'molten-glass', amount = 10},
    },
    main_product = 'molten-glass',
}:add_unlock('basic-substrate')

-- oil

--tar

RECIPE {
    type = 'recipe',
    name = 'tar-to-carbolic',
    category = 'distilator',
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = 'fluid', name = 'tar', amount = 100},
        {type = 'fluid', name = 'steam', amount = 100, minimum_temperature = 250},
        {type = 'item', name = 'raw-coal', amount = 1},
    },
    results = {
        {type = 'item', name = 'rich-clay', amount = 1, probability = 0.3},
        {type = 'item', name = 'ash', amount = 1},
        {type = 'fluid', name = 'coal-gas', amount = 35},
        {type = 'fluid', name = 'carbolic-oil', amount = 10},
    },
    main_product = 'carbolic-oil'
}:add_unlock('coal-processing-1')

--medium disilates

RECIPE {
    type = 'recipe',
    name = 'medium-distillate-to-high-distillate',
    category = 'cracker',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'fluid', name = 'medium-distillate', amount = 100},
        {type = 'fluid', name = 'steam', amount = 300},
        {type = 'item', name = 'sncr-alloy', amount = 1},
    },
    results = {
        {type = 'fluid', name = 'high-distillate', amount = 100},
    }
}:add_unlock('light-oil-mk01')

--anthracene oil

RECIPE {
    type = 'recipe',
    name = 'anthracene-oil-creosote',
    category = 'tar',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = 'fluid', name = 'anthracene-oil', amount = 50},
    },
    results = {
        {type = 'fluid', name = 'creosote', amount = 20},
    },
    main_product = 'creosote'
}:add_unlock('creosote')

--refined natural gas

RECIPE {
    type = 'recipe',
    name = 'formaldehyde-from-refined-natural-gas',
    category = 'gas-refinery',
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = 'fluid', name = 'refined-natural-gas', amount = 100},
        {type = 'fluid', name = 'pressured-air', amount = 100},
        {type = 'fluid', name = 'hot-molten-salt', amount = 30},
    },
    results = {
        {type = 'fluid', name = 'methanal', amount = 50},
        {type = 'fluid', name = 'carbon-dioxide', amount = 100},
        {type = 'fluid', name = 'molten-salt', amount = 30},
    },
    main_product = 'methanal'
}:add_unlock('petroleum-gas-mk01')

RECIPE {
    type = 'recipe',
    name = 'refined-natural-gas-to-condensates',
    category = 'compressor',
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = 'fluid', name = 'refined-natural-gas', amount = 150},
        {type = 'fluid', name = 'water', amount = 200},
        {type = 'fluid', name = 'gasoline', amount = 5},
    },
    results = {
        {type = 'fluid', name = 'condensates', amount = 100},
        {type = 'fluid', name = 'steam', amount = 200, temperature = 150},
        {type = 'fluid', name = 'naphtha', amount = 50},
    },
    main_product = 'condensates',
}:add_unlock('petroleum-gas-mk01')

-- other

--methanol

RECIPE {
    type = 'recipe',
    name = 'methanol-void-denitrification',
    category = 'methanol',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = 'fluid', name = 'methanol', amount = 100},
        {type = 'fluid', name = 'waste-water', amount = 100},
    },
    results = {
        {type = 'fluid', name = 'nitrogen', amount = 100},
        {type = 'fluid', name = 'water', amount = 100},
    },
    main_product = 'water'
}:add_unlock('methanol-processing-1')

-- msa acid

RECIPE {
    type = 'recipe',
    name = 'msa-void-boric-acid',
    category = 'mixer',
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = 'fluid', name = 'boric-acid', amount = 100},
        {type = 'fluid', name = 'msa', amount = 100},
    },
    results = {
        {type = 'fluid', name = 'water', amount = 200},
    },
    main_product = 'water'
}

--coke oven gas

RECIPE {
    type = 'recipe',
    name = 'cog-void-soot',
    category = 'wet-scrubber',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = 'fluid', name = 'coke-oven-gas', amount = 30, fluidbox_index = 1},
        {type = 'fluid', name = 'water', amount = 10, fluidbox_index = 2},
    },
    results = {
        {type = 'item', name = 'soot', amount = 1},
    },
    main_product = 'soot'
}:add_unlock('hot-air-mk02')

--fluorine gas

RECIPE {
    type = 'recipe',
    name = 'fluorine-to-olefins',
    category = 'olefin',
    enabled = false,
    energy_required = 5,
    ingredients = {
        {type = 'item', name = 'nickel-plate', amount = 1},
        {type = 'fluid', name = 'fluorine-gas', amount = 100},
        {type = 'fluid', name = 'crude-oil', amount = 50},
    },
    results = {
        {type = 'fluid', name = 'olefin', amount = 100},
        {type = 'fluid', name = 'naphtha', amount = 50},
    },
    main_product = 'olefin'
}:add_unlock('phosphorous-processing')

--ammonia

RECIPE('cyanic-acid-01'):remove_unlock('advanced-electronics'):add_unlock('melamine')

--hydrogen chloride

RECIPE {
    type = 'recipe',
    name = 'hydrogen-chloride-void',
    category = 'chemistry',
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = 'fluid', name = 'hydrogen-chloride', amount = 100},
        {type = 'item', name = 'small-lamp', amount = 1},
    },
    results = {
        {type = 'fluid', name = 'chlorine', amount = 100},
        {type = 'fluid', name = 'hydrogen', amount = 100},
        {type = 'item', name = 'small-lamp', amount = 1, probability = 0.5},
    },
    main_product = 'chlorine'
}:add_unlock('filtration')

--acetone

RECIPE {
    type = 'recipe',
    name = 'acetone-void-degrease',
    category = 'grease',
    enabled = false,
    energy_required = 3,
    ingredients = {
        {type = 'fluid', name = 'grease', amount = 25},
        {type = 'fluid', name = 'water', amount = 100},
        {type = 'fluid', name = 'acetone', amount = 50},
    },
    results = {
        {type = 'fluid', name = 'dirty-water-heavy', amount = 200},
    },
}:add_unlock('paramagnetic-material')

--used control rod

RECIPE {
    type = 'recipe',
    name = 'used-control-rod-to-iron-oxide',
    category = 'electrolyzer',
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = 'item', name = 'used-control-rod', amount = 1},
        {type = 'fluid', name = 'hot-molten-salt', amount = 50},
    },
    results = {
        {type = 'item', name = 'iron-oxide', amount = 1},
        {type = 'item', name = 'control-rod', amount = 1, probability = 0.5},
        {type = 'fluid', name = 'neutron', amount = 50},
        {type = 'fluid', name = 'molten-salt', amount = 50},
    },
    main_product = 'control-rod'
}:add_unlock('nuclear-power')

-- pressured water
RECIPE {
    type = 'recipe',
    name = 'pressured-water-inverted',
    category = 'vacuum',
    enabled = false,
    energy_required = 2.5,
    ingredients = {
        {type = 'fluid', name = 'pressured-water', amount = 200}
    },
    results = {
        {type = 'fluid', name = 'water', amount = 200}
    }
}:add_unlock('fluid-pressurization')

--vaccumm
RECIPE {
    type = 'recipe',
    name = 'vacuum-void',
    category = 'vacuum',
    enabled = false,
    energy_required = 1,
    ingredients = {
        {type = 'fluid', name = 'vacuum', amount = 10}
    },
    results = {},
    icon = data.raw.fluid['vacuum'].icon,
    icon_size = data.raw.fluid['vacuum'].icon_size,
    subgroup = data.raw.fluid['vacuum'].subgroup,
}:add_unlock('fluid-pressurization')

--pressured air
RECIPE {
    type = 'recipe',
    name = 'pressured-air-void',
    category = 'vacuum',
    enabled = false,
    energy_required = 2,
    ingredients = {
        {type = 'fluid', name = 'pressured-air', amount = 20}
    },
    results = {},
    icon = data.raw.fluid['pressured-air'].icon,
    icon_size = data.raw.fluid['pressured-air'].icon_size,
    subgroup = data.raw.fluid['pressured-air'].subgroup,
}:add_unlock('fluid-pressurization')