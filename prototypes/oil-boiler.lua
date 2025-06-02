local boiler = data.raw.boiler["oil-boiler-mk01"]
data.raw.boiler["oil-boiler-mk01"] = nil

local legacy = table.deepcopy(boiler)
legacy.name = legacy.name .. "-legacy"
legacy.hidden = true
legacy.localised_name = {"", {"entity-name.oil-boiler-mk01"}, " (Legacy)"}
data:extend {legacy}

data:extend {{
    type = "recipe-category",
    name = "oil-boiler-mk01",
}}

RECIPE {
    name = "oil-boiler-water-to-steam",
    energy_required = 5,
    enabled = false,
    ingredients = {
        {type = "fluid", name = "water", amount = 300}
    },
    results = {
        {type = "fluid", name = "steam", amount = 300, temperature = 250},
        {type = "fluid", name = "flue-gas", amount = 60}
    },
    category = "oil-boiler-mk01",
    main_product = "steam"
}

boiler.type = "assembling-machine"
boiler.fixed_recipe = "oil-boiler-water-to-steam"
boiler.crafting_speed = 1
boiler.crafting_categories = {"oil-boiler-mk01"}
boiler.energy_usage = boiler.energy_consumption
boiler.fluid_boxes = {
    {
        volume = 200,
        pipe_covers = py.pipe_covers(false, true, true, true),
        pipe_connections = {
            {flow_direction = "input-output", position = {-2.0, 0.0}, direction = defines.direction.west},
            {flow_direction = "input-output", position = {2.0, 0.0},  direction = defines.direction.east}
        },
        production_type = "input",
        filter = "water"
    },
    {
        volume = 200,
        pipe_covers = py.pipe_covers(false, true, true, true),
        pipe_connections = {
            {flow_direction = "output", position = {1, -2.0}, direction = defines.direction.north}
        },
        production_type = "output",
        filter = "steam"
    },
    {
        volume = 200,
        pipe_covers = py.pipe_covers(false, true, true, true),
        pipe_connections = {
            {flow_direction = "output", position = {-1, -2.0}, direction = defines.direction.north}
        },
        production_type = "output",
        filter = "flue-gas"
    }
}
boiler.graphics_set = {
    working_visualisations = {{
        fadeout = true,
        constant_speed = true,
        animation = {
            layers = {
                {
                    filename = "__pypetroleumhandlinggraphics__/graphics/entity/oil-burner-mk01/anim.png",
                    priority = "extra-high",
                    frame_count = 80,
                    line_length = 10,
                    width = 96,
                    height = 128,
                    animation_speed = 0.4,
                    shift = util.by_pixel(-1, -176),
                },
                {
                    filename = "__pypetroleumhandlinggraphics__/graphics/entity/py-converter-valve.png",
                    priority = "extra-high",
                    frame_count = 1,
                    repeat_count = 80,
                    width = 64,
                    height = 64,
                    shift = util.by_pixel(-1, -6.5),
                    draw_as_glow = true
                }
            }
        }
    }},
    animation = {
        layers = {{
            filename = "__pypetroleumhandlinggraphics__/graphics/entity/oil-burner-mk01/off.png",
            priority = "extra-high",
            width = 196,
            height = 320,
            shift = util.by_pixel(18, -80),
        }}
    },
}
data:extend {boiler}
