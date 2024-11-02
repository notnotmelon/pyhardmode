local second = 60
local fifteen_seconds = 15 * second
local thirty_seconds = 30 * second
local minute = 60 * second
local three_minutes = 3 * minute
local five_minutes = 5 * minute
local ten_minutes = 10 * minute
local fifteen_minutes = 15 * minute
local halfhour = 30 * minute
local hour = 60 * minute
local two_hours = 2 * hour
local four_hours = 4 * hour
local day = 24 * hour

-- coal processing

ITEM("animal-sample-01"):spoil("plasmids", hour)

-- fusion energy

-- nothing :(

-- alternative energy

ITEM("animal-eye"):spoil("biomass", halfhour)
ITEM("acetaldehyde"):spoil(py.spoil_triggers.puff_of_smoke(), thirty_seconds)

-- alien life

ITEM("meat"):spoil("dried-meat", two_hours)

ITEM("fish"):spoil("fishmeal", halfhour)
ITEM("fish-mk02"):spoil("fishmeal", hour)
ITEM("fish-mk03"):spoil("fishmeal", two_hours)
ITEM("fish-mk04"):spoil("fishmeal", four_hours)