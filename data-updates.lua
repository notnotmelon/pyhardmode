for name, recipe in pairs(data.raw.recipe) do
    if recipe.category == 'py-incineration' then
        data.raw.recipe[name] = nil
    end
end