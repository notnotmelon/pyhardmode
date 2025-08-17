--muddy sludge

if mods.PyBlock then
    RECIPE {
        type = "recipe",
        name = "muddy-sludge-void",
        category = "washer",
        enabled = true,
        energy_required = 4,
        ingredients = {
            {type = "fluid", name = "muddy-sludge", amount = 100},
        },
        results = {
            {type = "fluid", name = "water", amount = 100},
            {type = "item",  name = "soil",  amount = 10},
        },
        main_product = "soil"
    }
else
    RECIPE {
        type = "recipe",
        name = "muddy-sludge-void-electrolyzer",
        category = "electrolyzer",
        enabled = false,
        energy_required = 3,
        ingredients = {
            {type = "fluid", name = "muddy-sludge", amount = 100},
        },
        results = {
            {type = "fluid", name = "water",  amount = 100},
            {type = "fluid", name = "oxygen", amount = 10},
            {type = "item",  name = "soil",   amount = 5},
        },
        main_product = "water"
    }:add_unlock("electrolysis")
end

--yaedols spores

RECIPE {
    type = "recipe",
    name = "yaedols-spores-to-oxygen",
    category = "hpf",
    enabled = false,
    energy_required = 4,
    ingredients = {
        {type = "item", name = "yaedols-spores", amount = 20},
    },
    results = {
        {type = "fluid", name = "oxygen", amount = 20},
    },
    main_product = "oxygen",
} --:add_unlock('yaedols-upgrade')

--flue gas

local fluegas_to_ash = table.deepcopy(data.raw.recipe["fluegas-filtration"])
data.raw.recipe["fluegas-filtration"].results = {}
data.raw.recipe["fluegas-filtration"].energy_required = 2
fluegas_to_ash.name = "fluegas-to-ash"
fluegas_to_ash.category = "quenching-tower"
data:extend {fluegas_to_ash}
RECIPE("fluegas-to-ash"):add_unlock("tar-processing")

data.raw.recipe["fluegas-filtration"]:remove_unlock("filtration")
data.raw.recipe["fluegas-filtration"] = nil

-- ore

--plutonium isotopes

data.raw.recipe["plutonium-seperation"].energy_required = 60

-- acetone

data.raw.fluid["acetone"].fuel_value = "375kJ"
