require 'scripts.composite-entity'

local function init()
    global.composite_entities = global.composite_entities or {}
    global.coal_plants = global.coal_plants or {}
    for _, force in pairs(game.forces) do
        force.manual_crafting_speed_modifier = 2
    end
    remote.call('undeletable-fluids', 'add_deletable_fluid', 'water')
    remote.call('undeletable-fluids', 'add_deletable_fluid', 'steam')
end

script.on_init(function()
    if remote.interfaces['freeplay'] and not script.active_mods.PyBlock then
        remote.call('freeplay', 'set_created_items', {})
        remote.call('freeplay', 'set_ship_items', {
            ['burner-mining-drill'] = 10,
            ['py-overflow-valve'] = 3,
            ['py-underflow-valve'] = 3,
            ['offshore-pump'] = 1
        })
    end
    init()
end)
script.on_configuration_changed(init)

script.on_nth_tick(87, function(event)
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

-- when a chest is killed, drop all its contents
script.on_event(defines.events.on_entity_died, function(event)
    local entity = event.entity
    if not entity.valid or not entity.unit_number then return end
    local inventory = entity.get_inventory(defines.inventory.chest)
    if not inventory then return end
    for i = 1, #inventory do
        local stack = inventory[i]
        if stack.valid_for_read then
            entity.surface.spill_item_stack(entity.position, stack)
        end
    end
    inventory.clear()
end)

-- teleport player to cursor position when they are in map view & wearing a sweater
local armor_inventory = defines.inventory.character_armor
local render_mode = defines.render_mode.game
script.on_event('open-gui', function(event)
    local player = game.get_player(event.player_index)
    if player.render_mode == render_mode then return end
    local armor = player.get_inventory(armor_inventory)[1]
    if armor.valid_for_read and armor.name == 'sweater' then
        player.teleport(event.cursor_position)
    end
end)