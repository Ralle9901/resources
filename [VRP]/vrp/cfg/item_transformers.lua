local cfg = {}

-- define static item transformers
-- see https://github.com/ImagicTheCat/vRP to understand the item transformer concept/definition

cfg.item_transformers = {
  -- example of harvest item transformer
  {
    name="Vand/Tacos", -- menu name
    -- permissions = {"harvest.water_bottle_tacos"}, -- you can add permissions
    r=0,g=125,b=255, -- color
    max_units=20,
    units_per_minute=100,
    x=1861,y=3680.5,z=33.26, -- pos
    radius=5, height=1.5, -- area
    recipes = {
      ["Tap vand"] = { -- action name
        description="Tap vand til dine flasker.", -- action description
		work=1,
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["water"] = 1
        }
      },
      ["Hent tacos"] = { -- action name
        description="Hent tacos.", -- action description
		work=1,
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={ -- items given per unit
          ["tacos"] = 1
        }
      }
    }
    --, onstart = function(player,recipe) end, -- optional start callback
    -- onstep = function(player,recipe) end, -- optional step callback
    -- onstop = function(player,recipe) end -- optional stop callback
  },
  {
    name="Fitness", -- menu name
    r=255,g=125,b=0, -- color
    max_units=1000,
    units_per_minute=1000,
    x=-1202.96252441406,y=-1566.14086914063,z=4.61040639877319,
    radius=7.5, height=1.5, -- area
    recipes = {
      ["Styrke"] = { -- action name
        description="Forøg din styrke.", -- action description
		work=1,
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={}, -- items given per unit
        aptitudes={ -- optional
          ["physical.strength"] = 1 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
  {
    name="Hacker", -- menu name
	permissions = {"hacker.0day"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=5,
    units_per_minute=5,
    x=707.357238769531,y=-966.98876953125,z=30.4128551483154,
    radius=2, height=1.0, -- area
    recipes = {
      ["Find 0days"] = { -- action name
        description="Look for 0day exploits.", -- action description
		work=1,
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
			["0day"] = 1,
		}, -- items given per unit
        aptitudes={ -- optional
			["hacker.hacking"] = 1 -- "group.aptitude", give 1 exp per unit
        }
      }
    }
  },
  {
    name="Pengetransport", -- menu name
	permissions = {"bankdriver.money"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=236.87298583984,y=217.09535217285,z=106.28678894043,
    radius=2, height=1.0, -- area
    recipes = {
      ["Bankpenge"] = { -- action name
		description="Få penge for en missions.", -- action description
		work=1,
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
			["bank_money"] = 500000
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  },
  {
    name="Bankrøveri", -- menu name
	permissions = {"bank.robbery"}, -- you can add permissions
    r=255,g=125,b=0, -- color
    max_units=1,
    units_per_minute=1,
    x=265.94982910156,y=213.54983520508,z=101.68338775635,
    radius=2, height=1.0, -- area
    recipes = {
      ["Bankpenge"] = { -- action name
		description="Få fat i pengene.", -- action description
		work=1,
        in_money=0, -- money taken per unit
        out_money=0, -- money earned per unit
        reagents={}, -- items taken per unit
        products={
			["dirty_money"] = 500000
		}, -- items given per unit
        aptitudes={} -- optional
      }
    }
  }
}

-- define transformers randomly placed on the map
cfg.hidden_transformers = {
  ["Kulmine"] = {
    def = {
      name="Kulmine", -- menu name
      permissions = {"mining.harvest"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=175,
      units_per_minute=100,
      x=0,y=0,z=0, -- pos
      radius=5, height=5.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="coalmine", -- Unique id for blip
	  blipicon=501,
	  blipcolor=40,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Kul"] = { -- action name
			description="Udvind kul for at fremstille diamanter.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={ -- items given per unit
				["kul"] = 1,
          }
        }
      }
    },
    positions = {
	  {2908.2556152344,2787.9638671875,46.201290130615}
    },
	duration = 60 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Guldmine"] = {
    def = {
      name="Guldmine", -- menu name
      permissions = {"mining.harvest"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=175,
      units_per_minute=100,
      x=0,y=0,z=0, -- pos
      radius=5, height=5.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="goldmine", -- Unique id for blip
	  blipicon=501,
	  blipcolor=70,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Guldmalm"] = { -- action name
			description="Udvind guld fra guldmalm.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={ -- items given per unit
				["guldmalm"] = 1,
          }
        }
      }
    },
    positions = {
	  {-596.28533935547,2089.5959472656,131.41285705566}
    },
	duration = 60 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Jernmine"] = {
    def = {
      name="Jernmine", -- menu name
      permissions = {"mining.harvest"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=175,
      units_per_minute=100,
      x=0,y=0,z=0, -- pos
      radius=5, height=5.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="ironmine", -- Unique id for blip
	  blipicon=501,
	  blipcolor=22,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Jernmalm"] = { -- action name
			description="Jernmalm bruges til at fremstille jern.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={ -- items given per unit
				["jernmalm"] = 1,
          }
        }
      }
    },
    positions = {
	  {2997.3598632813,2751.0842285156,44.208843231201}
    },
	duration = 60 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Kul process"] = {
    def = {
      name="Kul process", -- menu name
      permissions = {"mining.process"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=175,
      units_per_minute=100,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="coalprocess", -- Unique id for blip
	  blipicon=501,
	  blipcolor=40,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Fremstil diamanter"] = { -- action name
			description="Brug kul til at fremstille diamanter.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={
				["kul"] = 20
			}, -- items taken per unit
			products={ -- items given per unit
				["diamant"] = 1
			}
        }
      }
    },
    positions = {
     {2776.9641113281,1427.2604980469,24.520523071289}
    },
	duration = 120 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Jern process"] = {
    def = {
      name="Jern process", -- menu name
      permissions = {"mining.process"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=175,
      units_per_minute=100,
      x=0,y=0,z=0, -- pos
      radius=5, height=5.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="ironprocess", -- Unique id for blip
	  blipicon=501,
	  blipcolor=22,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Fremstil jern"] = { -- action name
			description="Udvind jern fra jernmalm.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={
				["jernmalm"] = 10
			}, -- items taken per unit
			products={ -- items given per unit
				["jern"] = 1
			}
        }
      }
    },
    positions = {
     {2714.560546875,1710.1124267578,24.633918762207}
    },
	duration = 120 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Guld process"] = {
    def = {
      name="Guld process", -- menu name
      permissions = {"mining.process"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=175,
      units_per_minute=100,
      x=0,y=0,z=0, -- pos
      radius=5, height=1.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="goldprocess", -- Unique id for blip
	  blipicon=501,
	  blipcolor=70,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Fremstil guld"] = { -- action name
			description="Brug guldmalm til at fremstille guld.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={
				["guldmalm"] = 20
			}, -- items taken per unit
			products={ -- items given per unit
				["guld"] = 1
			}
        }
      }
    },
    positions = {
     {2781.2080078125,1710.5539550781,24.627914428711}
    },
	duration = 120 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Syre Fremstilling"] = {
    def = {
      name="Syre Fremstilling", -- menu name
      permissions = {"drugseller.harvest"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100,
      units_per_minute=100,
      x=0,y=0,z=0, -- pos
      radius=5, height=5.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="acidfarm", -- Unique id for blip
	  blipicon=310,
	  blipcolor=1,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Fremstil syre"] = { -- action name
			description="Fremstil syre som skal bruges til at fremstille LSD.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={ -- items given per unit
				["acid"] = 1,
          }
        }
      }
    },
    positions = {
	  {1394.6091308594,3609.69921875,38.941921234131}
    },
	duration = 60 -- 5 days (time before switching position, min 5 mins.)
  },
  ["LSD fremstilling"] = {
    def = {
      name="LSD fremstilling", -- menu name
      permissions = {"drugseller.process"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100,
      units_per_minute=100,
      x=0,y=0,z=0, -- pos
      radius=10, height=1.5, -- area
	  blip=false, -- Should transformer have blip
	  blipid="acidprocess", -- Unique id for blip
	  blipicon=310,
	  blipcolor=2,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Fremstil LSD"] = { -- action name
			description="Brug syre til at fremstille LSD.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={
				["acid"] = 2
			}, -- items taken per unit
			products={ -- items given per unit
				["lsd"] = 1
			}
        }
      }
    },
    positions = {
     {-79.16527557373,-1393.2487792969,29.35998916626}
    },
	duration = 120 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Kokaplante Farm"] = {
    def = {
      name="Kokaplante Farm", -- menu name
      permissions = {"drugseller.harvest"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=100,
      units_per_minute=100,
      x=0,y=0,z=0, -- pos
      radius=10, height=5.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="cocafarm", -- Unique id for blip
	  blipicon=501,
	  blipcolor=1,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Høst kokaplanter"] = { -- action name
			description="Høst kokaplanter til at fremstille Kokain.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={ -- items given per unit
				["cocaineplant"] = 1,
          }
        }
      }
    },
    positions = {
	  {-885.51940917969,4394.400390625,20.940845489502}
    },
	duration = 60 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Weed Farm"] = {
    def = {
      name="Weed Farm", -- menu name
      permissions = {"drugseller.harvest"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=200,
      units_per_minute=200,
      x=0,y=0,z=0, -- pos
      radius=10, height=5.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="weedfarm", -- Unique id for blip
	  blipicon=469,
	  blipcolor=2,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Høst hampblade"] = { -- action name
			description="Høst hampblade til at fremstille hash.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={}, -- items taken per unit
			products={ -- items given per unit
				["weed"] = 1,
          }
        }
      }
    },
    positions = {
      {2219.0180664063,5576.9311523438,53.803630828857},
      {-1948.5727539063,1835.9000244141,177.12725830078},
	  {-102.1524887085,1910.0651855469,196.93280029297},
	  {2653.4780273438,-862.01019287109,28.930114746094},
	  {-78.528434753418,-1402.9813232422,29.360010147095}
    },
	duration = 60 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Hash fremstilling"] = {
    def = {
      name="Hash fremstilling", -- menu name
      permissions = {"drugseller.process"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=175,
      units_per_minute=40,
      x=0,y=0,z=0, -- pos
      radius=10, height=1.5, -- area
	  blip=false, -- Should transformer have blip
	  blipid="weedprocess", -- Unique id for blip
	  blipicon=140,
	  blipcolor=2,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Fremstil hash"] = { -- action name
			description="Lav hampblade om til hash.", -- action description
			work=1,
			in_money=0, -- money taken per unit
			out_money=0, -- money earned per unit
			reagents={
				["weed"] = 2
			}, -- items taken per unit
			products={ -- items given per unit
				["hash"] = 1
			}
        }
      }
    },
    positions = {
      {1043.6083984375,-3204.9763183594,-38.156841278076}
    },
	duration = 120 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Guldsmed"] = {
    def = {
      name="Guldsmed", -- menu name
      permissions = {"mining.sell"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=200,
      units_per_minute=20,
      x=0,y=0,z=0, -- pos
      radius=5, height=2.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="goldseller", -- Unique id for blip
	  blipicon=431,
	  blipcolor=70,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Sælg Guld"] = { -- action name
          description="Sælg Guld.", -- action description
		  work=1,
          in_money=0, -- money taken per unit
          out_money=4000, -- money earned per unit
          reagents={
            ["guld"] = 1
          }, -- items taken per unit
          products={} -- items given per unit
        }
      }
    },
    positions = {
      {112.92890930176,-919.72497558594,29.946001052856}
    },
	duration = 30 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Jern forhandler"] = {
    def = {
      name="Jern forhandler", -- menu name
      permissions = {"mining.sell"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=200,
      units_per_minute=20,
      x=0,y=0,z=0, -- pos
      radius=5, height=2.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="jernseller", -- Unique id for blip
	  blipicon=431,
	  blipcolor=22,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Sælg jern"] = { -- action name
          description="Sælg jern.", -- action description
		  work=1,
          in_money=0, -- money taken per unit
          out_money=1500, -- money earned per unit
          reagents={
            ["jern"] = 1
          }, -- items taken per unit
          products={} -- items given per unit
        }
      }
    },
    positions = {
      {844.42065429688,-2361.8388671875,30.343671798706}
    },
	duration = 30 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Smykkeforretning"] = {
    def = {
      name="Smykkeforretning", -- menu name
      permissions = {"mining.sell"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=200,
      units_per_minute=20,
      x=0,y=0,z=0, -- pos
      radius=5, height=2.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="diamondseller", -- Unique id for blip
	  blipicon=431,
	  blipcolor=67,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Sælg diamanter"] = { -- action name
          description="Sælg diamanter.", -- action description
		  work=1,
          in_money=0, -- money taken per unit
          out_money=2500, -- money earned per unit
          reagents={
            ["diamant"] = 1
          }, -- items taken per unit
          products={} -- items given per unit
        }
      }
    },
    positions = {
      {-620.74896240234,-228.5858001709,38.057048797607}
    },
	duration = 30 -- 5 days (time before switching position, min 5 mins.)
  },
  ["LSD dealer"] = {
    def = {
      name="LSD dealer", -- menu name
      permissions = {"drugseller.sell"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=175,
      units_per_minute=15,
      x=0,y=0,z=0, -- pos
      radius=5, height=2.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="lsdselling", -- Unique id for blip
	  blipicon=280,
	  blipcolor=1,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Sælg LSD"] = { -- action name
          description="Sælg noget LSD.", -- action description
		  work=1,
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={
            ["lsd"] = 1
          }, -- items taken per unit
          products={
            ["dirty_money"] = 350
          } -- items given per unit
        }
      }
    },
    positions = {
	  {-1001.3867797852,4850.56640625,274.60586547852}
    },
	duration = 30 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Kokain dealer"] = {
    def = {
      name="Kokain dealer", -- menu name
      permissions = {"drugseller.sell"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=175,
      units_per_minute=15,
      x=0,y=0,z=0, -- pos
      radius=5, height=2.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="cocaineselling", -- Unique id for blip
	  blipicon=280,
	  blipcolor=1,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Sælg kokain"] = { -- action name
          description="Sælg noget kokain.", -- action description
		  work=1,
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={
            ["cocaine"] = 1
          }, -- items taken per unit
          products={
            ["dirty_money"] = 400
          } -- items given per unit
        }
      }
    },
    positions = {
	  {515.31115722656,170.57192993164,99.37100982666}
    },
	duration = 30 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Hash dealer"] = {
    def = {
      name="Hash dealer", -- menu name
      permissions = {"drugseller.sell"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=200,
      units_per_minute=20,
      x=0,y=0,z=0, -- pos
      radius=5, height=2.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="drugselling", -- Unique id for blip
	  blipicon=280,
	  blipcolor=2,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Sælg hash"] = { -- action name
          description="Sælg noget hash.", -- action description
		  work=1,
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={
            ["hash"] = 1
          }, -- items taken per unit
          products={
            ["dirty_money"] = 250
          } -- items given per unit
        }
      }
    },
    positions = {
      {-27.405261993408,-1494.9222412109,29.362087249756},
      {-214.38349914551,-1615.5772705078,33.869281768799},
      {86.839195251465,-1968.1009521484,19.747436523438},
      {326.84768676758,-2048.3442382813,19.833221435547},
      {398.93127441406,-1851.3887939453,25.820734024048},
      {233.34669494629,-1754.5816650391,28.031553268433},
      {-81.88208770752,-1610.021484375,30.482448577881},
	  {954.72918701172,-195.72966003418,72.208473205566},
	  {2438.748046875,4962.654296875,45.810596466064}
    },
	duration = 30 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Hvidvaskning"] = {
    def = {
      name="Hvidvaskning", -- menu name
      permissions = {"bande.launder"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=250,
      units_per_minute=25,
      x=0,y=0,z=0, -- pos
      radius=10, height=3.5, -- area
	  blip=false, -- Should transformer have blip
	  blipid="moneylaunder", -- Unique id for blip
	  blipicon=500,
	  blipcolor=37,
	  marker=false,
	  markerid=0,
	  markerdata={0,0,0,0,0,0,0,0}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Hvidvask penge"] = { -- action name
          description="Hvidvask sorte penge (90%).", -- action description
		  work=1,
          in_money=0, -- money taken per unit
          out_money=900, -- money earned per unit
          reagents={
            ["dirty_money"] = 1000
          }, -- items taken per unit
          products={
          } -- items given per unit
        }
      }
    },
    positions = {
      {1124.4180908203,-3195.7202148438,-40.201103973389}
    },
	duration = 180 -- 5 days (time before switching position, min 5 mins.)
  },
  ["Sårbar hæveautomat"] = {
    def = {
      name="Sårbar hæveautomat", -- menu name
      permissions = {"hacker.0day"}, -- you can add permissions
      r=0,g=200,b=0, -- color
      max_units=2,
      units_per_minute=0,
      x=0,y=0,z=0, -- pos
      radius=4, height=1.5, -- area
	  blip=true, -- Should transformer have blip
	  blipid="hackableatm", -- Unique id for blip
	  blipicon=434,
	  blipcolor=2,
	  marker=true,
	  markerid="hackableatm",
	  markerdata={1,1,0.5,133,187,101,125,150}, -- sx,sy,sz,r,g,b,a,vis_distance
      recipes = {
        ["Hack hæveautomat"] = { -- action name
          description="Hack hæveautomaten for at få penge ud.", -- action description
	   	  work=1,
          in_money=0, -- money taken per unit
          out_money=0, -- money earned per unit
          reagents={
            ["0day"] = 1
          }, -- items taken per unit
          products={
            ["dirty_money"] = 5000
          } -- items given per unit
        }
      }
    },
    positions = {
      {-386.733,6045.953,31.501},
      {-284.037,6224.385,31.187},
      {-284.037,6224.385,31.187},
      {-135.165,6365.738,31.101},
      {-110.753,6467.703,31.784},
      {-94.9690,6455.301,31.784},
      {155.4300,6641.991,31.784},
      {174.6720,6637.218,31.784},
      {1703.138,6426.783,32.730},
      {1735.114,6411.035,35.164},
      {1702.842,4933.593,42.051},
      {1967.333,3744.293,32.272},
      {1821.917,3683.483,34.244},
      {1174.532,2705.278,38.027},
      {540.0420,2671.007,42.177},
      {2564.399,2585.100,38.016},
      {2558.683,349.6010,108.050},
      {2558.051,389.4817,108.660},
      {1077.692,-775.796,58.218},
      {1139.018,-469.886,66.789},
      {1168.975,-457.241,66.641},
      {1153.884,-326.540,69.245},
      {381.2827,323.2518,103.270},
      {236.4638,217.4718,106.840},
      {265.0043,212.1717,106.780},
      {285.2029,143.5690,104.970},
      {157.7698,233.5450,106.450},
      {-164.568,233.5066,94.919},
      {-1827.04,785.5159,138.020},
      {-1409.39,-99.2603,52.473},
      {-1205.35,-325.579,37.870},
      {-1215.64,-332.231,37.881},
      {-2072.41,-316.959,13.345},
      {-2975.72,379.7737,14.992},
      {-2962.60,482.1914,15.762},
      {-2955.70,488.7218,15.486},
      {-3044.22,595.2429,7.595},
      {-3144.13,1127.415,20.868},
      {-3241.10,996.6881,12.500},
      {-3241.11,1009.152,12.877},
      {-1305.40,-706.240,25.352},
      {-538.225,-854.423,29.234},
      {-711.156,-818.958,23.768},
      {-717.614,-915.880,19.268},
      {-526.566,-1222.90,18.434},
      {-256.831,-719.646,33.444},
      {-203.548,-861.588,30.205},
      {112.4102,-776.162,31.427},
      {112.9290,-818.710,31.386},
      {119.9000,-883.826,31.191},
      {149.4551,-1038.95,29.366},
      {-846.304,-340.402,38.687},
      {-1204.35,-324.391,37.877},
      {-1216.27,-331.461,37.773},
      {-56.1935,-1752.53,29.452},
      {-261.692,-2012.64,30.121},
      {-273.001,-2025.60,30.197},
      {314.187,-278.621,54.170},
      {-351.534,-49.529,49.042},
      {24.589,-946.056,29.357},
      {-254.112,-692.483,33.616},
      {-1570.197,-546.651,34.955},
      {-1415.909,-211.825,46.500},
      {-1430.112,-211.014,46.500},
      {33.232,-1347.849,29.497},
      {129.216,-1292.347,29.269},
      {287.645,-1282.646,29.659},
      {289.012,-1256.545,29.440},
      {295.839,-895.640,29.217},
      {1686.753,4815.809,42.008},
      {-302.408,-829.945,32.417},
      {5.134,-919.949,29.557}
    },
	duration = 15 -- 10 minutes (time before switching position, min 5 mins.)
  }
}

-- configure the information reseller (can sell hidden transformers positions)
cfg.informer = {
  infos = {
    ["Narkotika Ingredienser"] = 20000,
	["Sælg stoffer"] = 20000
  },
  positions = {
    {1821.12390136719,3685.9736328125,34.2769317626953},
    {1804.2958984375,3684.12280273438,34.217945098877}
  },
  interval = 9999999, -- interval in minutes for the reseller respawn
  duration = 1, -- duration in minutes of the spawned reseller
  blipid = 133,
  blipcolor = 2
}

return cfg