local cfg = {}

-- example of study transformer
local itemtr_study = {
  name="Bogreol", -- menu name
  r=0,g=255,b=0, -- color
  max_units=20,
  units_per_minute=10,
  x=0,y=0,z=0, -- pos (doesn't matter as home component)
  radius=1.1, height=1.5, -- area
  recipes = {
    ["Kemibog"] = { -- action name
      description="Læs kemi", -- action description
	  work=1,
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={}, -- items given per unit
      aptitudes={ -- optional
        ["science.chemicals"] = 1 -- "group.aptitude", give 1 exp per unit
      }
    },
    ["Matematikbog"] = { -- action name
      description="Læs matematik", -- action description
	  work=1,
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={}, -- items given per unit
      aptitudes={ -- optional
        ["science.mathematics"] = 1 -- "group.aptitude", give 1 exp per unit
      }
    }
  }
}

----------------------------------------------------------------------------------------- laboratory
local itemtr_laboratory = {
  name="Arbejdsbord", -- menu name
  r=0,g=255,b=0, -- color
  max_units=250,
  units_per_minute=25,
  x=0,y=0,z=0, -- pos (doesn't matter as home component)
  radius=1.1, height=1.5, -- area
  recipes = {
    ["Kokain"] = { -- action name
      description="Lav kokain", -- action description
	  work=0.75,
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={ -- items taken per unit
	  ["cocaineplant"] = 3
	  
	  },
      products={ -- items given per unit
	  ["cocaine"] = 2
	  }, 
      aptitudes={ -- optional
        ["laboratory.cocaine"] = 5, -- "group.aptitude", give 1 exp per unit
		["science.chemicals"] = 10
	  }
    }
  }
}

----------------------------------------------------------------------------------------- laboratory
local itemtr_laboratory2 = {
  name="Skolebord", -- menu name
  r=0,g=255,b=0, -- color
  max_units=250,
  units_per_minute=25,
  x=0,y=0,z=0, -- pos (doesn't matter as home component)
  radius=3.0, height=1.5, -- area
  recipes = {
    ["Kokain"] = { -- action name
      description="Lav kokain", -- action description
	  work=1,
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={ -- items taken per unit
	  ["cocaineplant"] = 4
	  },
      products={ -- items given per unit
	  ["cocaine"] = 3
	  }, 
      aptitudes={ -- optional
        ["laboratory.cocaine"] = 3, -- "group.aptitude", give 1 exp per unit
		["science.chemicals"] = 7
	  }
    }
  }
}
----------------------------------------------------------------------------------------- HawksAle
local itemtr_home = {
  name="Skolebord", -- menu name
  r=0,g=255,b=0, -- color
  max_units=100,
  units_per_minute=25,
  x=0,y=0,z=0, -- pos (doesn't matter as home component)
  radius=1.1, height=1.5, -- area
  recipes = {
    ["Kokain"] = { -- action name
      description="Lav kokain", -- action description
	  work=0.7,
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={ -- items taken per unit
	  ["cocaineplant"] = 3
	  
	  },
      products={ -- items given per unit
	  ["cocaine"] = 1
	  }, 
      aptitudes={ -- optional
        ["laboratory.cocaine"] = 2, -- "group.aptitude", give 1 exp per unit
		["science.chemicals"] = 5
	  }
    },
	["LSD"] = { -- action name
     description="Lav LSD", -- action description
	 work=1,
     in_money=0, -- money taken per unit
     out_money=0, -- money earned per unit
     reagents={ -- items taken per unit
	 ["acid"] = 2
	 },
     products={ -- items given per unit
	 ["lsd"] = 4
	 }, 
     aptitudes={ -- optional
       ["laboratory.lsd"] = 2, -- "group.aptitude", give 1 exp per unit
		["science.chemicals"] = 5
	 }
    }
  }
}
------------------------------------------------ hacker

local itemtr_hacker = {
  name="Hack", -- menu name
  r=0,g=255,b=0, -- color
  max_units=20,
  units_per_minute=10,
  x=0,y=0,z=0, -- pos (doesn't matter as home component)
  radius=1.1, height=1.5, -- area
  recipes = {
    ["PDF"] = { -- action name
      description="Læs en PDF", -- action description
	  work=1,
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={}, -- items given per unit
      aptitudes={ -- optional
        ["hacker.logic"] = 10 -- "group.aptitude", give 1 exp per unit
      }
    },
    ["C++ PDF"] = { -- action name
      description="Læs en C++ PDF", -- action description
	  work=1,
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={}, -- items given per unit
      aptitudes={ -- optional
        ["hacker.c++"] = 1 -- "group.aptitude", give 1 exp per unit
      }
    },
	["LUA PDF"] = { -- action name
      description="Læs en LUA pdf", -- action description
	  work=1,
      in_money=0, -- money taken per unit
      out_money=0, -- money earned per unit
      reagents={}, -- items taken per unit
      products={}, -- items given per unit
      aptitudes={ -- optional
        ["hacker.lua"] = 1 -- "group.aptitude", give 1 exp per unit
      }
    }
  }
}

-- default flats positions from https://github.com/Nadochima/HomeGTAV/blob/master/List

-- define the home slots (each entry coordinate should be unique for ALL types)
-- each slots is a list of home components
--- {component,x,y,z} (optional _config)
--- the entry component is required
cfg.slot_types = {
  ["basic_flat"] = {
    {
      {"entry",-782.171,324.589,223.258},
      {"chest",-773.718078613281,325.144409179688,223.266357421875, _config = {weight=200}},
      {"wardrobe",-760.885437011719,325.457153320313,217.061080932617},
      {"gametable",-755.40185546875,318.263214111328,221.875823974609},
      {"itemtr", _config = itemtr_study, -758.670104980469,315.048156738281,221.854904174805},
      {"itemtr", _config = itemtr_hacker, -778.154296875,326.660491943359,223.25764465332}
    },
    {
      {"entry",-774.171,333.589,207.621},
      {"chest",-782.118591308594,332.147399902344,207.629608154297, _config = {weight=200}},
      {"wardrobe",-795.118469238281,331.631256103516,201.42431640625},
      {"gametable",-800.763427734375,338.574951171875,206.239105224609},
      {"itemtr", _config = itemtr_study, -797.283447265625,342.134338378906,206.21842956543},
	  {"itemtr", _config = itemtr_hacker, -777.960876464844,330.808135986328,207.620849609375}
    },
    {
      {"entry",-774.171,333.589,159.998},
      {"chest",-782.66015625,332.523284912109,160.010223388672, _config = {weight=200}},
      {"wardrobe",-795.550964355469,332.229614257813,153.804931640625},
      {"gametable",-801.228942871094,339.106231689453,158.619750976563},
      {"itemtr", _config = itemtr_study, -797.896728515625,342.543273925781,158.599044799805},
      {"itemtr", _config = itemtr_hacker, -778.430236816406,331.083160400391,160.001556396484}
    },
    {
      {"entry",-596.689,59.139,108.030},
      {"chest",-604.427001953125,57.0807762145996,108.035743713379, _config = {weight=200}},
      {"wardrobe",-617.180358886719,56.9536590576172,101.830520629883},
      {"gametable",-623.078796386719,63.688045501709,106.645317077637},
      {"itemtr", _config = itemtr_study, -619.724853515625,67.1367950439453,106.624366760254},
      {"itemtr", _config = itemtr_hacker, -600.219604492188,55.7631721496582,108.027030944824}
    },
    {
      {"entry",-1451.557,-523.546,69.556},
      {"chest",-1457.28601074219,-529.699523925781,69.565315246582, _config = {weight=200}},
      {"wardrobe",-1467.07995605469,-536.98583984375,63.3601188659668},
      {"gametable",-1476.12658691406,-534.873474121094,68.1748962402344},
      {"itemtr", _config = itemtr_study, -1475.36840820313,-530.117126464844,68.1540756225586},
      {"itemtr", _config = itemtr_hacker, -1452.96923828125,-528.350952148438,69.5566177368164}
    },
    {
      {"entry",-1452.185,-522.640,56.929},
      {"chest",-1457.3740234375,-529.737854003906,56.9376449584961, _config = {weight=200}},
      {"wardrobe",-1467.7158203125,-537.308349609375,50.732494354248},
      {"gametable",-1476.12670898438,-534.895751953125,55.547306060791},
      {"itemtr", _config = itemtr_study, -1475.39453125,-530.135192871094,55.5264129638672},
      {"itemtr", _config = itemtr_hacker, -1452.95886230469,-528.371948242188,56.9289970397949}
    },
    {
      {"entry",-907.900,-370.608,109.440},
      {"chest",-914.79296875,-375.26416015625,109.448974609375, _config = {weight=200}},
      {"wardrobe",-926.047912597656,-381.470153808594,103.243774414063},
      {"gametable",-934.216979980469,-378.082336425781,108.05859375},
      {"itemtr", _config = itemtr_study, -932.810302734375,-373.413330078125,108.03776550293},
      {"itemtr", _config = itemtr_hacker, -910.40234375,-374.561859130859,109.440299987793}
    },
    {
      {"entry",-921.124,-381.099,85.480},
      {"chest",-915.268737792969,-375.818084716797,85.4891815185547, _config = {weight=200}},
      {"wardrobe",-904.0673828125,-369.910552978516,79.2839508056641},
      {"gametable",-895.890075683594,-373.167846679688,84.0987701416016},
      {"itemtr", _config = itemtr_study, -897.224792480469,-377.828887939453,84.0779266357422},
      {"itemtr", _config = itemtr_hacker, -919.742492675781,-376.550506591797,85.4804763793945}
    },
    {
      {"entry",-464.453,-708.617,77.086},
      {"chest",-466.566558837891,-700.528991699219,77.0956268310547, _config = {weight=200}},
      {"wardrobe",-466.892852783203,-687.88720703125,70.8903503417969},
      {"gametable",-459.870513916016,-682.054565429688,75.7051773071289},
      {"itemtr", _config = itemtr_study, -456.510467529297,-685.274841308594,75.6842498779297},
      {"itemtr", _config = itemtr_hacker, -467.985504150391,-704.850036621094,77.0868835449219}
    },
    {
      {"entry",-470.647,-689.459,53.402},
      {"chest",-469.077453613281,-697.664672851563,53.4144515991211, _config = {weight=200}},
      {"wardrobe",-468.939910888672,-710.398986816406,47.2093048095703},
      {"gametable",-475.543884277344,-716.226867675781,52.0241050720215},
      {"itemtr", _config = itemtr_study, -479.113037109375,-712.874938964844,52.0032043457031},
      {"itemtr", _config = itemtr_hacker, -467.812896728516,-693.403869628906,53.4058074951172}
    }
  },
  ["other_flat"] = {
    {
      {"entry",-784.363,323.792,211.996},
      {"chest",-766.744384765625,328.375,211.396545410156, _config = {weight=500}},
      {"wardrobe",-793.502136230469,326.861846923828,210.796630859375},
      {"gametable",-781.973083496094,338.788482666016,211.231979370117},
      {"itemtr", _config = itemtr_study, -778.560241699219,333.439453125,211.197128295898},
      {"itemtr", _config = itemtr_hacker, -762.913757324219,332.328216552734,211.396484375}
    },
    {
      {"entry",-603.997,58.954,98.200},
      {"chest",-621.323669433594,54.2074241638184,97.5995330810547, _config = {weight=500}},
      {"wardrobe",-594.668823242188,55.5750961303711,96.9996185302734},
      {"gametable",-606.140441894531,43.8849754333496,97.4350128173828},
      {"itemtr", _config = itemtr_study, -608.968322753906,49.1769981384277,97.4001312255859},
      {"itemtr", _config = itemtr_hacker, -625.2353515625,50.4472694396973,97.5995254516602}
    },
    {
      {"entry",-1453.013,-539.629,74.044},
      {"chest",-1466.57763671875,-528.339294433594,73.4436492919922, _config = {weight=500}},
      {"wardrobe",-1449.85034179688,-549.231323242188,72.8437194824219},
      {"gametable",-1466.37182617188,-546.663757324219,73.279052734375},
      {"itemtr", _config = itemtr_study, -1463.84411621094,-541.1962890625,73.2442169189453},
      {"itemtr", _config = itemtr_hacker, -1472.04296875,-527.374267578125,73.4436416625977}
    },
    {
      {"entry",-912.547,-364.706,114.274},
      {"chest",-926.693176269531,-377.596130371094,113.674102783203, _config = {weight=500}},
      {"wardrobe",-903.66650390625,-364.023223876953,113.074157714844},
      {"gametable",-908.407165527344,-379.825714111328,113.509590148926},
      {"itemtr", _config = itemtr_study, -913.553588867188,-376.692016601563,113.474617004395},
      {"itemtr", _config = itemtr_hacker, -928.425598144531,-382.820159912109,113.67407989502}
    }
  },
  ["bs"] = {
    {
      {"entry",-77.770088195801,-830.07702636719,243.38578796387,337.61010742188},
      {"chest",-82.688194274902,-801.22283935547,243.38592529297,223.98059082031, _config = {weight=500}},
      {"wardrobe",-57.866149902344,-808.45983886719,243.38595581055,257.79531860352},
      {"gametable",-61.459686279297,-806.82043457031,243.38589477539,236.55990600586},
      {"itemtr", _config = itemtr_study, -68.861656188965,-804.93286132813,243.40077209473,151.62330627441},
      {"itemtr", _config = itemtr_hacker, -69.397972106934,-806.97741699219,243.4008026123,305.44772338867}
    },
  },
  ["plantation_flat"] = {
    {
      {"entry",1906.6708984375,3711.19384765625,32.8070220947266},
      {"chest",1903.47888183594,3715.30200195313,32.7704811096191, _config = {weight=500}},
      {"wardrobe",1902.52734375,3714.08325195313,32.7693138122559},
      {"gametable",-102.721557617188,2817.1640625,53.1586837768555},
      {"itemtr", _config = itemtr_laboratory, 1900.09545898438,3711.39282226563,32.767204284668}
    }
  },
  ["hillcrest_2862"] = {
    {
      {"entry",-682.25927734375,592.38665771484,145.3929901123},
      {"chest",-671.66259765625,581.21563720704,144.97026062012, _config = {weight=500}},
      {"wardrobe",-671.67584228516,587.41827392578,141.56982421875},
      {"gametable",-667.28289794922,582.45123291016,144.99137878418},
      {"itemtr", _config = itemtr_study, -682.49377441406,595.89477539062,137.76594543458},
      {"itemtr", _config = itemtr_hacker, -675.53448486328,589.27001953125,137.76976013184}
    }
  },
  ["hillcrest_2868"] = {
    {
      {"entry",-753.35546875,622.33984375,142.61422729492},
      {"chest",-772.80297851562,613.44268798828,143.73114013672, _config = {weight=500}},
      {"wardrobe",-767.20959472656,611.01141357422,140.33073425292},
      {"gametable",-773.43127441406,608.92578125,143.75227355958},
      {"itemtr", _config = itemtr_study, -755.21228027344,617.90789794922,136.52676391602},
      {"itemtr", _config = itemtr_hacker, -764.10174560546,613.85009765625,136.53062438964}
    }
  },
  ["hillcrest_2874"] = {
    {
      {"entry",-859.88775634766,691.07940673828,152.86071777344},
      {"chest",-859.17980957032,675.21997070312,152.45338439942, _config = {weight=500}},
      {"wardrobe",-855.3422241211,680.181640625,149.05296325684},
      {"gametable",-854.4730834961,673.67510986328,152.48028564454},
      {"itemtr", _config = itemtr_study, -863.05639648438,692.94213867188,145.25280761718},
      {"itemtr", _config = itemtr_hacker, -862.6376953125,700.24072265625,145.25300598144}
    }
  },
  ["mad_wayne_thunder_2113"] = {
    {
      {"entry",-1289.750366211,449.55059814454,97.90251159668},
      {"chest",-1290.3693847656,433.66738891602,97.49510192871, _config = {weight=500}},
      {"wardrobe",-1286.1365966796,438.11212158204,94.094818115234},
      {"gametable",-1285.7749023438,431.61834716796,97.52214050293},
      {"itemtr", _config = itemtr_study, -1292.9389648438,451.55081176758,90.294616699218},
      {"itemtr", _config = itemtr_hacker, -1291.8834228516,458.83129882812,90.294616699218}
    }
  },
  ["normandy_2117"] = {
    {
      {"entry",-571.93273925782,661.89178466796,145.83987426758},
      {"chest",-576.38037109375,646.50732421875,145.43251037598, _config = {weight=500}},
      {"wardrobe",-571.14770507812,649.9058227539,142.03213500976},
      {"gametable",-572.5669555664,643.47204589844,145.45962524414},
      {"itemtr", _config = itemtr_study, -574.39739990234,664.38293457032,138.23197937012},
      {"itemtr", _config = itemtr_hacker, -571.74578857422,671.3052368164,138.23197937012}
    }
  },
  ["north_conker_2044"] = {
    {
      {"entry",341.880,437.759,149.394},
      {"chest",328.5173034668,430.13842773438,148.97131347656, _config = {weight=500}},
      {"wardrobe",334.40032958984,428.49002075196,145.57090759278},
      {"gametable",328.61373901368,425.75439453125,148.99256896972},
      {"itemtr", _config = itemtr_study, 345.31307983398,437.0609741211,141.7670288086},
      {"itemtr", _config = itemtr_hacker, 337.04071044922,431.87118530274,141.7707824707}
    }
  },
  ["north_conker_2045"] = {
    {
      {"entry",373.71838378906,423.68692016602,145.90785217286},
      {"chest",369.33474731446,408.25213623046,145.50053405762, _config = {weight=500}},
      {"wardrobe",374.40264892578,411.73895263672,142.10028076172},
      {"gametable",373.0806274414,405.1827697754,145.5274963379},
      {"itemtr", _config = itemtr_study, 371.13583374024,426.13513183594,138.2999572754},
      {"itemtr", _config = itemtr_hacker, 374.02404785156,433.18807983398,138.2999572754}
    }
  },
  ["whispymound_3677"] = {
    {
      {"entry",117.1784210205,559.80603027344,184.30485534668},
      {"chest",118.35543060302,543.90454101562,183.89755249024, _config = {weight=500}},
      {"wardrobe",122.00944519042,548.93389892578,180.4972076416},
      {"gametable",123.03867340088,542.50183105468,183.92448425292},
      {"itemtr", _config = itemtr_study, 114.01847076416,561.49688720704,176.69696044922},
      {"itemtr", _config = itemtr_hacker, 114.31466674804,568.91192626954,176.696975708}
    }
  },
  ["wild_oats_3655"] = {
    {
      {"entry",-174.27947998046,497.62170410156,137.6668548584},
      {"chest",-170.5906829834,482.64450073242,137.24424743652, _config = {weight=500}},
      {"wardrobe",-167.4889831543,487.82168579102,133.84381103516},
      {"gametable",-166.12393188476,481.45397949218,137.26531982422},
      {"itemtr", _config = itemtr_study, -172.6614074707,500.60311889648,130.04000854492},
      {"itemtr", _config = itemtr_hacker, -169.88256835938,491.48318481446,130.04354858398}
    }
  },
  ["la_fuente_blanca"] = {
    {
      {"entry",1396.7633056641,1141.8763427734,114.33366394043},
      {"chest",1397.8409423828,1164.1024169922,114.33365631104, _config = {weight=200}},
      {"wardrobe",1400.3676757813,1159.6374511719,114.33363342285},
      {"gametable",1396.7829589844,1132.1831054688,114.33366394043}
    }
  },
  ["sharks_bolig"] = {
    {
      {"entry",-76.541931152344,-826.51110839844,243.38577270508,337.32467651367},
      {"chest",-81.75080871582,-801.22509765625,243.40075683594,73.926048278809, _config = {weight=50000}},
      {"wardrobe",-78.823265075684,-810.94653320313,243.38581848145,336.40078735352},
      {"gametable",-62.057289123535,-808.47436523438,243.38592529297,243.84716796875},
      {"itemtr", _config = itemtr_study,-64.920196533203,-814.76989746094,243.38592529297,71.361267089844},
      {"itemtr", _config = itemtr_home,-78.772972106934,-805.79949951172,243.38591003418,164.54354858398},
      {"itemtr", _config = itemtr_hacker,-80.527236938477,-801.76458740234,243.40078735352,239.93695068359}
    }
  },
  ["George_industries_49"] = {
    {
      {"entry",-140.79359436035,-617.57257080078,168.82051086426,213.4972076416},
      {"chest",-128.04237365723,-633.68511962891,168.82051086426,89.053398132324, _config = {weight=20000}},
      {"wardrobe",-131.65711975098,-628.21618652344,168.75799560547,176.61224365234},
      {"gametable",-148.03350830078,-643.97326660156,168.82046508789,275.02777099609},
      {"itemtr", _config = itemtr_study,-145.68884277344,-636.66333007813,168.82049560547,281.24923706055},
      {"itemtr", _config = itemtr_home,-128.91493225098,-638.67236328125,168.82048034668,19.004396438599},
      {"itemtr", _config = itemtr_hacker,-126.03672027588,-641.14959716797,168.8353729248,111.80244445801}
    }
  },
  ["Super_Lab_1"] = {
    {
      {"entry",1088.7530517578,-3188.1923828125,-38.993469238281,359.40747070313},
      {"chest",1094.7694091797,-3192.953125,-38.993469238281,353.44497680664, _config = {weight=2000}},
      {"itemtr", _config = itemtr_laboratory2,1093.2122802734,-3196.1967773438,-38.130744934082,13.325164794922}
    }
  },
  ["Paranemt_office_49"] = {
    {
      {"entry",-1902.3215332031,-572.39575195313,19.097211837769,161.35374450684},
      {"chest",-1906.0355224609,-570.84814453125,19.097211837769,52.386035919189, _config = {weight=20000}},
      {"wardrobe",-1901.8291015625,-573.44445800781,19.097213745117,266.13870239258},
      {"gametable",-1906.9412841797,-577.02154541016,19.095851898193,340.87213134766},
      {"itemtr", _config = itemtr_study,-1912.3829345703,-570.93572998047,19.097211837769,252.42233276367},
      {"itemtr", _config = itemtr_home,00.00,00.00,00.00,00.00},
      {"itemtr", _config = itemtr_hacker,00.00,00.00,00.00,00.00}
    }
  },
  ["lafamilia"] = {
    {
      {"entry",-2689.7231445313,1294.0224609375,142.60992431641,69.976318359375},
      {"chest",-2687.2917480469,1330.7758789063,142.63740539551,340.14248657227, _config = {weight=5000}},
      {"wardrobe",-2698.5456542969,1281.0930175781,142.93772888184,151.62284851074},
      {"gametable",-2697.5983886719,1292.1877441406,138.2799987793,105.30104064941},
      {"itemtr", _config = itemtr_study,-2695.6447753906,1286.1829833984,142.98007202148,359.9899597168},
      {"itemtr", _config = itemtr_home,00.00,00.00,00.00,00.00},
      {"itemtr", _config = itemtr_hacker,00.00,00.00,00.00,00.00}
    }
  },
  ["skrederne"] = {
    {
      {"entry",-1352.9074707031,-753.94708251953,22.318687438965,44.463237762451},
      {"chest",-1353.0617675781,-749.05554199219,26.211555480957,11.826389312744, _config = {weight=50000}},
      {"wardrobe",-1354.5625,-749.28552246094,38.289699554443,173.10224914551},
      {"gametable",-1343.4437255859,-758.29772949219,38.316543579102,94.711418151855},
	  {"itemtr", _config = itemtr_laboratory,-1339.5018310547,-755.33654785156,30.175443649292,197.93661499023}
    }
  },
  ["satu"] = {
    {
      {"entry",1396.8648681641,1141.5692138672,114.3335723877,270.17434692383},
      {"chest",1400.0008544922,1139.8724365234,114.33364105225,268.76953125, _config = {weight=50000}},
      {"wardrobe",1400.560546875,1141.5284423828,114.33364105225,30.439367294312},
      {"gametable",1407.3444824219,1147.7208251953,114.33364105225,106.0347442627},
	  {"itemtr", _config = itemtr_laboratory,1392.2346191406,1145.2874755859,114.33364105225,137.82467651367},
	  {"itemtr", _config = itemtr_study,1399.2316894531,1161.3612060547,114.33364105225,105.64409637451}
    }
  }
}

-- define home clusters
cfg.homes = {
  ["Basis hus 1 (1 Mil)"] = {
    slot = "basic_flat",
    entry_point = {-635.665,44.155,42.697},
    buy_price = 1000000,
    sell_price = 750000,
    max = 99,
    blipid=40,
    blipcolor=5
  },
  ["Basis hus 2 (1 Mil)"] = {
    slot = "basic_flat",
    entry_point = {-1446.769,-538.531,34.740},
    buy_price = 1000000,
    sell_price = 750000,
    max = 99,
    blipid=40,
    blipcolor=5
  },
  ["Villa (5 Mil)"] = {
    slot = "other_flat",
    entry_point = {-770.921,312.537,85.698},
    buy_price = 5000000,
    sell_price = 3000000,
    max = 10,
    blipid=40,
    blipcolor=5
  },
  ["Laboratorie (3.5 Mil)"] = {
    slot = "plantation_flat",
    entry_point = {1907.19848632813,3710.33862304688,32.7361106872559},
    buy_price = 3500000,
    sell_price = 2625000,
    max = 50,
    blipid=499,
    blipcolor=5
  },
    ["Villa Hillcrest Ave. 1 (10 Mil)"] = {
    slot = "hillcrest_2862",
    entry_point = {-687.23986816406,595.61053466796,143.64205932618},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
    ["Devils Tribe"] = {
    slot = "bs",
    entry_point = {-783.70434570313,-390.6960144043,37.333419799805,332.5309753418},
    buy_price = 5,
    sell_price = 1,
    max = 1,
    blipid=40,
    blipcolor=5
  },
    ["Saturdarah"] = {
    slot = "satu",
    entry_point = {1395.0219726563,1141.841796875,114.6270904541,265.79699707031},
    buy_price = 5,
    sell_price = 1,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Villa Hillcrest Ave. 2 (10 Mil)"] = {
    slot = "hillcrest_2868",
    entry_point = {-753.34210205078,622.29455566406,142.60691833496},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Villa Hillcrest Ave. 3 (10 Mil)"] = {
    slot = "hillcrest_2874",
    entry_point = {-853.05487060546,695.79260253906,148.78691101074},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Villa Mad Wayne Thunder Dr. (10 Mil)"] = {
    slot = "mad_wayne_thunder_2113",
    entry_point = {-1294.3248291016,454.8874206543,97.468086242676},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Villa Normandy Dr. (10 Mil)"] = {
    slot = "normandy_2117",
    entry_point = {-559.59295654296,664.24340820312,145.45669555664},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Villa North Conker Ave. 1 (10 Mil)"] = {
    slot = "north_conker_2044",
    entry_point = {346.842,440.745,147.702},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Villa North Conker Ave. 2 (10 Mil)"] = {
    slot = "north_conker_2045",
    entry_point = {373.089,427.822,145.684},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Villa Whispymound Dr. (10 Mil)"] = {
    slot = "whispymound_3677",
    entry_point = {119.36456298828,564.40447998046,183.95928955078},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
  ["Villa Wild Oats Dr. (10 Mil)"] = {
    slot = "wild_oats_3655",
    entry_point = {-175.56649780274,502.26806640625,137.42027282714},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 1,
    blipid=40,
    blipcolor=5
  },
    ["Super Laboratorie"] = {
    slot = "Super_Lab_1",
    entry_point = {-562.74267578125,-886.88037109375,25.202363967896},
    buy_price = 10000000,
    sell_price = 7500000,
    max = 10,
    blipid=269,
    blipcolor=46
  --},
    --["Western Boulevard"] = {
    --slot = "Paranemt_office_49",
    --entry_point = {-1898.3756103516,-572.33245849609,11.846000671387,156.53680419922},
    --buy_price = 100000000,
    --sell_price = 75000000,
    --max = 1,
    --blipid=00,
    --blipcolor=48
  }
}

return cfg