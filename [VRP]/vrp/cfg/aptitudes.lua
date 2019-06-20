
local cfg = {}

-- exp notes:
-- levels are defined by the amount of xp
-- with a step of 5: 5|15|30|50|75 (by default)
-- total exp for a specific level, exp = step*lvl*(lvl+1)/2
-- level for a specific exp amount, lvl = (sqrt(1+8*exp/step)-1)/2

-- define groups of aptitudes
--- _title: title of the group
--- map of aptitude => {title,init_exp,max_exp}
---- max_exp: -1 for infinite exp
cfg.gaptitudes = {
  ["physical"] = {
    _title = "Fysisk",
    ["strength"] = {"Styrke", 30, 505} -- required, level 3 to 6 (by default, can carry 10kg per level)
  },
  ["science"] = {
    _title = "Videnskab",
    ["chemicals"] = {"Kemikalier", 0, -1}, -- example
    ["mathematics"] = {"Matematik", 0, -1} -- example
  },
  ["laboratory"] = {
    _title = "Laboratorie",
	["cocaine"] = {"Kokain produktion", 0, -1},
	["weed"] = {"Hash produktion", 0, -1},
	["lsd"] = {"LSD produktion", 0, -1}
  },
  ["hacker"] = {
    _title = "Hacking",
	["logic"] = {"Logik", 0, -1},
	["c++"] = {"C++ kodning", 0, -1},
	["lua"] = {"LUA kodning", 0, -1},
	["hacking"] = {"Exploiting", 0, -1}
  }
}

return cfg
