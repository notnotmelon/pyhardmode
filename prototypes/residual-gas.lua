RECIPE {
    type = "recipe",
    name = "residual-gas-to-gasoline",
    category = "gas-refinery",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "fluid", name = "residual-gas",  amount = 100},
        {type = "item",  name = "chromite-sand", amount = 1},
    },
    results = {
        {type = "fluid", name = "gasoline", amount = 200},
    },
    main_product = "gasoline"
}:add_unlock("cadaveric-arum-mk03")

RECIPE {
    type = "recipe",
    name = "residual-gas-to-syngas",
    category = "gas-refinery",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "fluid", name = "residual-gas",  amount = 100},
        {type = "item",  name = "chromite-sand", amount = 1},
    },
    results = {
        {type = "fluid", name = "syngas", amount = 200},
    },
    main_product = "syngas"
}:add_unlock("cadaveric-arum-mk02")

RECIPE {
    type = "recipe",
    name = "residual-gas-to-olefins",
    category = "gas-refinery",
    enabled = false,
    energy_required = 10,
    ingredients = {
        {type = "fluid", name = "residual-gas",  amount = 100},
        {type = "item",  name = "chromite-sand", amount = 1},
    },
    results = {
        {type = "fluid", name = "olefin", amount = 200},
    },
    main_product = "olefin"
}:add_unlock("cadaveric-arum")

for _, recipe in pairs {
    "cadaveric-arum-1",
    "cadaveric-arum-2",
    "cadaveric-arum-3",
    "cadaveric-arum-4",
} do
    RECIPE(recipe):add_result {name = "residual-gas", amount = 35, type = "fluid"}
    data.raw.recipe[recipe].main_product = "cadaveric-arum"
end

if not mods.PyBlock then data.raw.fluid["residual-gas"].fuel_value = nil end
data.raw.fluid["residual-oil"].fuel_value = nil
data.raw.fluid["residual-mixture"].fuel_value = nil

RECIPE("msa-void-boric-acid"):add_unlock("cadaveric-arum-upgrade")

RECIPE("residual-mixture"):remove_ingredient("ash")
RECIPE("residual-mixture"):add_ingredient {type = "item", name = "chromite-sand", amount = 1}
