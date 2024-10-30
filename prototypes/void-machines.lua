for _, void_machine in pairs {"py-sinkhole", "py-gas-vent"} do
    data.raw["assembling-machine"][void_machine] = data.raw.furnace[void_machine]
    data.raw["assembling-machine"][void_machine].type = "assembling-machine"
    data.raw["assembling-machine"][void_machine].crafting_speed = 1
    data.raw["assembling-machine"][void_machine].energy_source = {
        type = "electric",
        usage_priority = "secondary-input",
    }
    data.raw["assembling-machine"][void_machine].energy_usage = "100kW"
    data.raw.furnace[void_machine] = nil
end

data.raw["assembling-machine"]["py-gas-vent"].crafting_speed = 5
data.raw["assembling-machine"]["py-sinkhole"].fixed_recipe = "water-pyvoid-fluid"
data.raw["assembling-machine"]["py-sinkhole"].collision_mask = {layers = {ground_tile = true, object = true}}

RECIPE("py-gas-vent"):remove_unlock("coal-processing-1")
RECIPE("py-gas-vent"):add_unlock("filtration")
RECIPE("tailings-pond"):remove_unlock("coal-processing-1")
RECIPE("tailings-pond"):add_unlock("filtration-mk02")
RECIPE("tailings-pond"):add_ingredient {"small-parts-03", 10}
RECIPE("tailings-pond"):add_ingredient {"saturated-nexelit-cartridge", 10}
RECIPE("tailings-pond"):add_ingredient {"super-steel", 20}
RECIPE("bio-reactor-mk01"):remove_ingredient("tailings-pond")
RECIPE("bio-reactor-mk01-with-baffles"):remove_ingredient("tailings-pond")
RECIPE("centrifugal-pan-mk01"):remove_ingredient("tailings-pond")

data.raw["item-subgroup"]["py-void-items"].group = "coal-processing"
data.raw["item-subgroup"]["py-void-liquid"].group = "coal-processing"
data.raw["item-subgroup"]["py-void-gas"].group = "coal-processing"
