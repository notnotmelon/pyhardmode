for name, recipe in pairs(data.raw.recipe) do
    if recipe.category == 'py-incineration' or recipe.category == 'py-runoff' then
        if name == 'water-pyvoid-fluid' then
            recipe.energy_required = 20
        elseif name == 'zipir1-pyvoid' or name == 'zipir1-pyvoid-hatchery' then
            recipe.enabled = false
            recipe.category = 'hpf'
            recipe.flags = {}
            recipe.hidden = nil
        else
            data.raw.recipe[name] = nil
        end
    elseif recipe.category == 'py-venting' then
        recipe.ingredients[1].amount = 50
        RECIPE(name):add_ingredient('filtration-media'):add_unlock('filtration')
        data.raw.recipe[name].energy_required = 0.5
        recipe.enabled = false
        recipe.flags = {}
        recipe.hidden = nil
    end
end

RECIPE('zipir1-pyvoid'):add_unlock('zipir')

require 'prototypes.pyrrhic'