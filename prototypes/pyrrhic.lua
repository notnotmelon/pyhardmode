local function add_to_pyrrhic(tech)
    local t = data.raw.technology[tech]
    if not t then error('Technology ' .. tech .. ' does not exist') end
    TECHNOLOGY('pyrrhic'):add_prereq(tech)
    t.unit = {
        count = 500,
        ingredients = {
            {'automation-science-pack', 200},
            {'py-science-pack-1', 100},
            {'logistic-science-pack', 60},
            {'py-science-pack-2', 30},
            {'chemical-science-pack', 20},
            {'py-science-pack-3', 10},
            {'production-science-pack', 6},
            {'py-science-pack-4', 3},
            {'utility-science-pack', 2},
            {'space-science-pack', 1},
        },
        time = 1200
    }
end

add_to_pyrrhic('sweater')
add_to_pyrrhic('tholin-mk04')
add_to_pyrrhic('smelters-mk04')
add_to_pyrrhic('silver-mk05')
add_to_pyrrhic('nexelit-mk05')
add_to_pyrrhic('mycology-mk05')
add_to_pyrrhic('excavation-3')
add_to_pyrrhic('nuclear-power-mk04')
add_to_pyrrhic('electronics-machines-4')
add_to_pyrrhic('oil-machines-mk04')
add_to_pyrrhic('botany-mk04')
add_to_pyrrhic('land-animals-mk05')
add_to_pyrrhic('atomizer-upgrade')