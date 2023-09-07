script.on_init(function()
    if remote.interfaces['freeplay'] and not script.active_mods.Pyblock then
        remote.call('freeplay', 'set_created_items', {})
        remote.call('freeplay', 'set_ship_items', {
            ['burner-mining-drill'] = 10,
            ['offshore-pump'] = 1
        })
    end
end)