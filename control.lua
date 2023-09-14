require 'scripts.composite-entity'

local function init()
    global.composite_entities = global.composite_entities or {}
    global.coal_plants = global.coal_plants or {}
end

script.on_init(function()
    if remote.interfaces['freeplay'] and not script.active_mods.Pyblock then
        remote.call('freeplay', 'set_created_items', {})
        remote.call('freeplay', 'set_ship_items', {
            ['burner-mining-drill'] = 10,
            ['py-overflow-valve'] = 5,
            ['py-underflow-valve'] = 5,
            ['offshore-pump'] = 1
        })
    end
    init()
end)
script.on_configuration_changed(init)

script.on_nth_tick(37, function(event)
    for unit_number, entities in pairs(global.coal_plants) do
        local coal_plant, picture = entities[1], entities[2]
        if not coal_plant.valid or not picture.valid then
            if coal_plant.valid then
                coal_plant.destroy()
            elseif picture.valid then
                picture.destroy()
            end
            global.coal_plants[unit_number] = nil
        elseif coal_plant.energy ~= 0 then
            picture.destroy()
            local animation = coal_plant.surface.create_entity{
                name = coal_plant.name .. '-animation',
                position = coal_plant.position,
                force = coal_plant.force_index
            }
            animation.destructible = false
            animation.operable = false
            animation.minable = false
            animation.rotatable = false
            global.composite_entities[unit_number] = {animation}
            global.coal_plants[unit_number] = nil
        end
    end
end)