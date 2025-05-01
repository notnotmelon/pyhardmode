-- filter flue gas for particulates; sulfur, ash, soot, etc
  -- first sent to an electrostatic precipitator, although fabric filters can be used as well.
  -- That device removes ash and other particulates by electrostatically charging them, causing them to be attracted to and deposited on plates or other collection devices.
-- denitrification unit that alters the chemical composition of nitrogen oxides through a catalytic reaction with ammonia or urea. The goal is to produce nitrogen gas, rather than nitrogen oxides
  -- Sulfur dioxide is removed by one of a number of processes, most of which involve scrubbers in one form or another. Most U.S. facilities rely on wet scrubbers, which use a slurry of alkaline sorbent
  -- (usually comprising limestone or lime) or seawater to clean the gases. Other technologies include spray-dry scrubbing, which also uses sorbent slurries; a wet sulfuric acid process that recovers
  -- the sulfur in the form of sulfuric acid; dry sorbent injection systems; and a flue gas desulfurization technique known as SNOX, which uses catalytic reactions to clean flue gases of nitrogen oxides (NOx) and particulates, as well as sulfur dioxide.
-- for co2, whatever the thing was that i talked about for N2 separation

-- create flue gas 1-5
-- for i=1,5 do
--   copy = table.deepcopy(data.raw.fluid["flue-gas"])
--   copy.name = copy.name .. "-" .. i
--   data.raw.fluid[copy.name] = copy
-- end

-- modify all existing recipes by either hiding them or changing flue gas to another variant