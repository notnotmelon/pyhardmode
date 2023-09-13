require 'scripts.composite-entity'

local function init()
    global.composite_entities = global.composite_entities or {}
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