for name, recipe in pairs(data.raw.recipe) do
    if recipe.category == 'py-incineration' or recipe.category == 'py-runoff' then
        if name == 'zipir1-pyvoid' or name == 'zipir1-pyvoid-hatchery' then
            recipe.enabled = false
            recipe.category = 'hpf'
            recipe.flags = {}
            recipe.hidden = nil
        else
            data.raw.recipe[name] = nil
        end
    end
end

RECIPE('zipir1-pyvoid'):add_unlock('zipir')
RECIPE('py-sinkhole'):remove_unlock('steel-processing')

data.raw.recipe['py-sinkhole'] = nil
data.raw.furnace['py-sinkhole'] = nil
data.raw.item['py-sinkhole'] = nil

--data.raw['recipe-category']['py-incineration'] = nil
data.raw['recipe-category']['py-runoff'] = nil

for name, recipe in pairs(data.raw.recipe) do
    if recipe.category == 'py-venting' then
        RECIPE(name):add_ingredient('filtration-media')
        data.raw.recipe[name].energy_required = 1
    end
end

RECIPE('py-gas-vent'):remove_unlock('coal-processing-1')
RECIPE('py-gas-vent'):add_unlock('filtration')
RECIPE('tailings-pond'):remove_unlock('coal-processing-1')
RECIPE('tailings-pond'):add_unlock('filtration-mk02')
RECIPE('tailings-pond'):add_ingredient{'small-parts-03', 10}
RECIPE('tailings-pond'):add_ingredient{'saturated-nexelit-cartridge', 10}
RECIPE('tailings-pond'):add_ingredient{'super-steel', 20}

RECIPE('bio-reactor-mk01'):remove_ingredient('tailings-pond')
RECIPE('bio-reactor-mk01-with-baffles'):remove_ingredient('tailings-pond')
RECIPE('centrifugal-pan-mk01'):remove_ingredient('tailings-pond')