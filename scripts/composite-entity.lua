local coal_plant = function(entity)
    local picture = entity.surface.create_entity{
        name = entity.name .. '-picture',
        position = entity.position,
        force = entity.force_index
    }
    global.coal_plants[entity.unit_number] = {entity, picture}
    return {picture}
end

local composite_entity_creation = {
    ['py-coal-powerplant-mk01'] = coal_plant,
    ['py-coal-powerplant-mk02'] = coal_plant,
    ['py-coal-powerplant-mk03'] = coal_plant,
    ['py-coal-powerplant-mk04'] = coal_plant,
}

local on_built = {defines.events.on_built_entity, defines.events.on_robot_built_entity, defines.events.script_raised_revive, defines.events.script_raised_built}
script.on_event(on_built, function(event)
    local entity = event.created_entity or event.entity
    if not entity.valid then return end
    local f = composite_entity_creation[entity.name]
    if not f then return end
    local sub_entities = f(entity)
    for _, sub_entity in pairs(sub_entities) do
        sub_entity.destructible = false
		sub_entity.operable = false
		sub_entity.minable = false
		sub_entity.rotatable = false
    end
    global.composite_entities[entity.unit_number] = sub_entities
end)

local on_destroyed = {defines.events.on_player_mined_entity, defines.events.on_robot_mined_entity, defines.events.script_raised_destroy, defines.events.on_entity_died}
script.on_event(on_destroyed, function(event)
    local entity = event.entity
    if not composite_entity_creation[entity.name] then return end
    local sub_entities = global.composite_entities[entity.unit_number]
    if not sub_entities then return end
    for _, sub_entity in pairs(sub_entities) do
        if sub_entity and sub_entity.valid then
            sub_entity.destroy()
        end
    end
    global.composite_entities[entity.unit_number] = nil
end)

script.on_event(defines.events.on_entity_cloned, function(event)
    local source = event.source
    if not composite_entity_creation[source.name] then return end
    on_destroyed{entity = source}
    on_built{entity = event.destination}
    if source.valid then source.destroy() end
end)