local function force_string_setting(setting, type, value)
    data.raw[type][setting].allowed_values = {value}
    data.raw[type][setting].default_value = value
    data.raw[type][setting].hidden = true
end

force_string_setting('aai-loaders-lubricant-recipe', 'string-setting', 'disabled')
force_string_setting('aai-loaders-mode', 'string-setting', 'lubricated')
force_string_setting('undeletable_fluids_flush_action', 'string-setting', 'prevent')
force_string_setting('undeletable_fluids_removal_action', 'string-setting', 'prevent')
force_string_setting('undeletable_fluids_destruction_action', 'string-setting', 'prevent')
force_string_setting('undeletable_fluids_minimum_threshold', 'int-setting', 200)