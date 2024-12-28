require "prototypes.void-machines"
require "prototypes.residual-gas"
require "prototypes.heat"
require "prototypes.mining"
require "prototypes.biomass"

RECIPE("tailings-classification"):remove_unlock("separation")
data.raw.fluid["acetylene"].fuel_value = "750kJ"
data.raw.fluid["coke-oven-gas"].fuel_value = "750kJ"
data.raw.fluid["black-liquor"].fuel_value = nil
data.raw.item["raw-coal"].fuel_value = "1.5MJ"
data.raw.item["coal-dust"].fuel_value = "1.5MJ"
RECIPE("print-brain"):remove_unlock("organ-printing-mk02"):add_unlock("organ-printing")
RECIPE("blood-to-zinc"):remove_unlock("molecular-decohesion-mk02"):add_unlock("molecular-decohesion").results[1].amount = 7

data.raw["assembling-machine"]["eaf-mk01"].energy_usage = "30MW"
data.raw["assembling-machine"]["eaf-mk02"].energy_usage = "60MW"
data.raw["assembling-machine"]["eaf-mk03"].energy_usage = "90MW"
data.raw["assembling-machine"]["eaf-mk04"].energy_usage = "120MW"

RECIPE("yaedols-spores-to-oxygen"):add_unlock("yaedols-upgrade")
RECIPE("bonemeal-to-geothermal-water"):add_unlock("ulric-upgrade")

if settings.startup["pyhm-decrease-containers-inventory-size"].value then
    local function reduce_size(prototype_type, prototype_name, reduction_factor)
        data.raw[prototype_type][prototype_name].inventory_size = math.ceil(data.raw[prototype_type][prototype_name].inventory_size / reduction_factor)
    end
    local function reduce_container_size(prototype_type, container)
        for container_filter, reduction_factor in pairs{
            ["wooden-chest"] = 4,         -- 4
            ["iron-chest"] = 4,           -- 8
            ["steel-chest"] = 2.4,        -- 20
            ["py-shed"] = 1.875,          -- 40
            ["py-storehouse"] = 1.875,    -- 80
            ["py-warehouse"] = 3.75,      -- 120
            ["py-deposit"] = 5,           -- 160
            ["active-provider-chest"] = 2.4,
            ["passive-provider-chest"] = 2.4,
            ["buffer-chest"] = 2.4,
            ["storage-chest"] = 2.4,
            ["requester-chest"] = 2.4,
        } do
            if string.find(container.name, container_filter, 1, true) then
                data.raw[prototype_type][container.name].inventory_size = math.ceil(container.inventory_size / reduction_factor)
                return
            end
        end
        -- Every other container. 8 is chosen because containers below that size are often used for other puposes than just storage, and it wouldn't be a significant nerf anyway
        if container.inventory_size >= 8 then
            data.raw[prototype_type][container.name].inventory_size = math.ceil(container.inventory_size / 2)
        end
    end
    for _, container in pairs(data.raw["container"]) do
        reduce_container_size("container", container)
    end
    for _, container in pairs(data.raw["logistic-container"]) do
        reduce_container_size("logistic-container", container)
    end
    if mods["cargo-ships"] then
        reduce_size("cargo-wagon", "cargo_ship", 4)
    end
end

RECIPE("neutron-absorber-mk01"):remove_unlock("nuclear-power"):add_unlock("uranium-processing")

if not mods.pystellarexpedition then
    RECIPE("military-science-pack"):add_ingredient {"guar-gum", 1}
    RECIPE("military-science-pack"):add_ingredient {"zipir1", 1}
    RECIPE("capacitor2"):add_ingredient {"cadaveric-arum-seeds", 5}
    RECIPE("chemical-science-pack"):add_ingredient {"mukmoux", 2}
    RECIPE("py-science-pack-3"):add_ingredient {"gas-bladder", 5}
    RECIPE("arqad-propolis-01"):remove_ingredient("dhilmos-egg"):add_ingredient("dhilmos")
    RECIPE("arqad-propolis-02"):remove_ingredient("dhilmos-egg"):add_ingredient {"dhilmos", 2}
end

data.raw.unit["caravan"].affected_by_tiles = false
data.raw.unit["flyavan"].affected_by_tiles = false
data.raw.unit["nukavan"].affected_by_tiles = false

RECIPE("seaweed-to-chelator"):remove_unlock("phytomining-mk02")
data.raw.recipe["seaweed-to-chelator"] = nil

if mods["aai-loaders"] then
    for loader, fluid in pairs {
        ["aai-loader"] = "stripped-distillate",
        ["aai-fast-loader"] = "grease",
        ["aai-express-loader"] = "nexelit-slurry",
    } do
        data.raw["storage-tank"][loader .. "-pipe"].fluid_box.filter = fluid
        local localised_description = data.raw.technology[loader].localised_description
        localised_description[3] = fluid
        localised_description = {"", localised_description, " (", {"fluid-name." .. fluid}, ")"}
        data.raw.technology[loader].localised_description = localised_description
        data.raw["loader-1x1"][loader].localised_description = localised_description
        data.raw.item[loader].localised_description = localised_description
    end

    TECHNOLOGY("aai-loader"):add_prereq("light-oil-mk02").unit.count = 1300
    TECHNOLOGY("aai-fast-loader"):add_pack("py-science-pack-3").unit.count = 1100
    TECHNOLOGY("aai-express-loader"):add_prereq("nexelit-mk03").unit.count = 1200
end

data.raw["logistic-robot"]["py-logistic-robot-mk01"].max_payload_size = 1
data.raw["logistic-robot"]["py-logistic-robot-mk02"].max_payload_size = 2
data.raw["logistic-robot"]["py-logistic-robot-mk03"].max_payload_size = 3
data.raw["logistic-robot"]["py-logistic-robot-mk04"].max_payload_size = 4

RECIPE("creosote-to-aromatics"):add_unlock("creosote"):add_ingredient {type = "fluid", name = "gasoline", amount = 35}.hidden = false

RECIPE("primers"):add_ingredient {"shell", 2}
RECIPE("primers-02"):add_ingredient {"shell", 2}
RECIPE("primers-03"):add_ingredient {"shell", 2}

data.raw.recipe["purex-waste-vitrification"].results[4].amount = 1

data.raw.recipe["planter-box"].ingredients[3].amount = 9

-- add fluid inputs to antelope-enclosure-mk01
data.raw["assembling-machine"]["antelope-enclosure-mk01"].fluid_boxes_off_when_no_fluid_recipe = true
data.raw["assembling-machine"]["antelope-enclosure-mk01"].fluid_boxes = {
    {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{flow_direction = "input", position = {-8, 0}, direction = defines.direction.east}}
    },
    {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {{flow_direction = "input", position = {8, 0}, direction = defines.direction.east}}
    },
}

data.raw.recipe["space-science-pack-real"].allow_productivity = true

table.insert(data.raw.technology["steam-power"].effects, {
    type = "mining-with-fluid",
    modifier = true
})

if not mods.PyBlock and register_cache_file ~= nil then
    register_cache_file({"pyhardmode", "pycoalprocessing", "pyfusionenergy", "pyindustry", "pyrawores", "pyhightech", "pypetroleumhandling", "pyalienlife", "pyalternativeenergy"}, "__pyhardmode__/cached-configs/pyalienlife+pyalternativeenergy+pycoalprocessing+pyfusionenergy+pyhardmode+pyhightech+pyindustry+pypetroleumhandling+pyrawores")
end
