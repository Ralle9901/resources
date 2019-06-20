
-- this file configure the cloakrooms on the map

local cfg = {}

-- prepare surgeries customizations
local surgery_male = { model = "mp_m_freemode_01"}
local surgery_female = { model = "mp_f_freemode_01"}
local emergency_male = { model = "s_m_m_paramedic_01"}
local emergency_female = { model = "s_f_y_scrubs_01"}
local cop_male = { model = "s_m_y_cop_01"}
local cop_female = { model = "s_f_y_cop_01"}
local fbi_male = { model = "s_m_m_ciasec_01"}
local fbi_female = { model = "ig_michelle"}
local sheriff_male = { model = "s_m_y_sheriff_01"}
local sheriff_female = { model = "s_f_y_ranger_01"}
local swat_male = { model = "s_m_y_swat_01"}
local hway_cop = { model = "s_m_y_hwaycop_01"}


for i=0,19 do
  surgery_female[i] = {0,0}
  surgery_male[i] = {0,0}
end

-- cloakroom types (_config, map of name => customization)
--- _config:
---- permissions (optional)
---- not_uniform (optional): if true, the cloakroom will take effect directly on the player, not as a uniform you can remove
cfg.cloakroom_types = {
  ["Politi"] = {
    _config = { permissions = {"police.cloakroom"} },
    -- ["Mande uniform"] = {
      -- [3] = {30,0},
      -- [4] = {25,2},
      -- [6] = {24,0},
      -- [8] = {58,0},
      -- [11] = {55,0},
      -- ["p2"] = {2,0}
    -- },
    -- ["Kvinde uniform"] = {
      -- [3] = {35,0},
      -- [4] = {30,0},
      -- [6] = {24,0},
      -- [8] = {6,0},
      -- [11] = {48,0},
      -- ["p2"] = {2,0}
    -- },
	["Betjent (Mand)"] = cop_male,
	["Betjent (Kvinde)"] = cop_female,
    ["Civilbetjent (Mand)"] = fbi_male,
    ["Civilbetjent (Kvinde)"] = fbi_female,
    ["Indsatsleder (Mand)"] = sheriff_male,
    ["MC Betjent (Mand)"] = hway_cop,
	["AKS (Mand)"] = swat_male
  },
  ["Ambulanceredder"] = {
    _config = { permissions = {"emergency.cloakroom"} },
    ["Mand"] = emergency_male,
    ["Kvinde"] = emergency_female
  },
  ["Tøjbutik"] = {
    _config = { not_uniform = true },
    ["Mand"] = surgery_male,
    ["Kvinde"] = surgery_female
  }
}

cfg.cloakrooms = {
  {"Politi", 450,-992.70,30.689605712891},
  {"Politi", 1857.1024169922,3689.2727050781,34.267082214355},
  {"Politi", -448.68127441406,6015.9873046875,31.71639251709},
  {"Ambulanceredder",1148.8043212891,-1528.3171386719,35.382881164551}
}

return cfg
