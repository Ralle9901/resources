
-- define all language properties

local lang = {
  common = {
    welcome = "Velkommen til Atlantix, For at bruge vores menu skal du trykke på F9. God fornøjelse.",
    no_player_near = "Ingen spiller i nærheden.",
    invalid_value = "Forkert værdi.",
    invalid_name = "Forkert navn.",
    not_found = "Ikke fundet.",
    request_refused = "Anmodning afvist.",
    wearing_uniform = "Pas på, du er i uniform.",
    not_allowed = "Ikke tilladt."
  },
  weapon = {
    pistol = "Pistol"
  },
  survival = {
    starving = "Sulter",
    thirsty = "Tørster"
  },
  money = {
    display = "{1} <span class=\"symbol\">DKK </span>",
    given = "Gav {1} DKK.",
    received = "Modtog {1} DKK.",
    not_enough = "Ikke nok penge.",
    paid = "Betalte <font color=#ddf904>{1}</font> DKK.",
    paid2 = "Betalte {1} DKK.",
    give = {
      title = "Giv penge",
      description = "Giv penge til den nærmeste spiller.",
      prompt = "Beløb givet:"
    }
  },
  inventory = {
    title = "Inventar",
    description = "Åben inventar.",
    iteminfo = "({1})<br /><br />{2}<br /><em>{3} kg</em>",
    info_weight = "Vægt {1}/{2} kg",
    give = {
      title = "Giv",
      description = "Giv ting til den nærmeste spiller.",
      prompt = "Giv antal (max {1}):",
      given = "Gav {2} | {1}.",
      received = "Modtog {2} | {1}.",
      received1 = "Modtog {2} | {1}.",
    },
    trash = {
      title = "Ødelæg",
      description = "Destruer ting.",
      prompt = "Antal til destruering (max {1}):",
      done = "Destruerede {2} | {1}."
    },
    missing = "Mangler {2} | {1}.",
    full = "Inventar fyldt.",
    chest = {
      title = "Bagklap",
      already_opened = "Denne bagklap er allerede åbnet af en anden.",
      full = "Baggagerummet er fyldt.",
      take = {
        title = "Tag",
        prompt = "Antal du tager (max {1}):"
      },
      put = {
        title = "Lig",
        prompt = "Antal du ligger (max {1}):"
      }
    }
  },
  atm = {
    title = "Automat",
    info = {
      title = "Info",
      bank = "Bank: {1} DKK"
    },
    deposit = {
      title = "Indsæt",
      description = "Pung til bank",
      prompt = "Beløb til indsætning:",
      deposited = "{1} DKK indsat."
    },
    withdraw = {
      title = "Hæv",
      description = "Bank til pung",
      prompt = "Beløb du ønsker at hæve.",
      withdrawn = "<font color=#ddf904>{1}</font> DKK hævet.",
      not_enough = "Du har ikke nok penge i banken."
    }
  },
  business = {
    title = "Virksomhed",
    directory = {
      title = "Retning",
      description = "Virksomhed.",
      dprev = "> Tilbage",
      dnext = "> Næste",
      info = "<em>Kapital: </em>{1} DKK<br /><em>Ejer: </em>{2} {3}<br /><em>Registrerings#: </em>{4}<br /><em>Telefon: </em>{5}"
    },
    info = {
      title = "Virksomhedsinformationer",
      info = "<em>Navn: </em>{1}<br /><em>Kapital: </em>{2} DKK<br /><em>Overfør kapital: </em>{3} DKK<br /><br/>Overfør kapital til næste regnskabsår."
    },
    addcapital = {
      title = "Tilføj kapital",
      description = "Tilføj kapital til din virksomhed.",
      prompt = "Beløb der skal tilføjes:",
      added = "{1} DKK blev tilføjet til virksomheskapitalen."
    },
    launder = {
      title = "Hvidvaskning",
      description = "Brug din virksomhed til at vaske penge.",
      prompt = "Beløb der skal vaskes (max {1} DKK): ",
      laundered = "<font color=#ddf904>{1}</font> DKK vasket.",
      not_enough = "Du har ikke nok sorte penge."
    },
    open = {
      title = "Start virksomhed",
      description = "Start virksomhed, minimums kapitalet er på {1} DKK.",
      prompt_name = "Virmsomhedsnavn (kan ikke ændres, max {1} karakter):",
      prompt_capital = "Kapital (min {1})",
      created = "~g~Virmsomhed startet."
      
    }
  },
  cityhall = {
    title = "Rådhuset",
    identity = {
      title = "Ny identitet",
      description = "Skift identitet, det koster = {1} DKK.",
      prompt_firstname = "Fornavn:",
      prompt_name = "Efternavn:",
      prompt_age = "Alder:",
    },
    menu = {
      title = "Identitet",
      info = "<em>Fornavn: </em>{2}<br /><em>Efternavn: </em>{1}<br /><em>Alder: </em>{3}<br /><em>CPR: </em>{4}<br /><em>Mobilnummer: </em>{5}<br /><em>Kørekort: </em>{8}<br /><em>Adresse: </em>{6} {7}"
    }
  },
  police = {
    title = "Politi",
    wanted = "Eftersøgt: {1}",
    not_handcuffed = "Ikke i håndjern.",
    cuffs = "Fik håndjern på/Fjernet håndjern",
    cloakroom = {
      title = "Skab",
      uniform = {
        title = "Uniform",
        description = "Skift uniform."
      }
    },
    pc = {
      title = "PC",
      searchreg = {
        title = "Søg i personregistret",
        description = "Søg ID efter CPR.",
        prompt = "Indtast CPR:"
      },
	  searchphone = {
        title = "Søg i telefonregistret",
        description = "Søg ID efter Mobil.",
        prompt = "Indtast Mobil NR:"
      },
      closebusiness = {
        title = "Luk virksomhed",
        description = "Luk nærmeste spillers virksomhed.",
        request = "Er du sikker på, at du vil lukke {3} ejet af {1} {2}?",
        closed = "~g~Virksomhed lukket."
      },
      trackveh = {
        title = "Søg indregistrering",
        description = "Spor bilen via registreringsnummeret.",
        prompt_reg = "Indtast registreringsnummer:",
        prompt_note = "Indtast årsag:",
        tracking = "Sporing startet.",
        track_failed = "Sporing af {1} ({2}) ~n~slog fejl.",
        tracked = "Sporede {1} ({2})"
      },
      records = {
        show = {
          title = "Vis liste",
          description = "Hvis liste over eftersøgte registreringsnumre."
        },
        delete = {
          title = "Tøm",
          description = "Tøm listen over eftersøgte registreringsnumre.",
          deleted = "Listen blev tømt"
        }
      }
    },
    menu = {
      handcuff = {
        title = "Håndjern",
        description = "Sæt i håndjern/fjern håndjern på nærmeste spiller."
      },
      putinveh = {
        title = "Placer i bilen",
        description = "Placer nærmeste spiller i bilen."
      },
      license = {
        title = "Fjern kørekort",
        description = "Fjern kørekort fra person."
      },
      searchcar = {
        title = "Slå CPR/Nummerplade op",
        prompt = "CPR/Nummerplade:",
        description = ""
      },
      getoutveh = {
        title = "Tag ud af bilen",
        description = "Tag nærmeste spiller ud af bilen."
      },
      askid = {
        title = "Bed om ID",
        description = "Spørg om ID fra den nærmeste spiller.",
        request = "Vil du vise dit ID?",
        request_hide = "Gem ID.",
        asked = "Spørger om ID..."
      },
      check = {
        title = "Visiter spiller",
        description = "Visiter for penge, inventar og våben på nærmeste spiller.",
        request_hide = "Gem rapport.",
        info = "<em>Penge: </em>{1} DKK<br /><br /><em>Inventar: </em>{2}<br /><br /><em>Våben: </em>{3}",
        checked = "Du blev visiteret."
      },
      seize = {
        seized = "Beslaglade {2} | {1}",
        weapons = {
          title = "Beslaglæg våben",
          description = "Beslaglæg våben fra nærmeste spiller.",
          seized = "Dine våben blev beslaglagt."
        },
        items = {
          title = "Beslaglægt alt illegalt",
          description = "Beslaglægger illegale ting.",
          seized = "Dine illegale ting blev beslaglagt."
        }
      },
      jail = {
        title = "Fængsel",
        description = "Fængsel/frifind nærmeste spiller.",
        not_found = "Du står ikke på stationen.",
        jailed = "Fængslet.",
        unjailed = "Frifundet.",
        notify_jailed = "Du blev fængslet.",
        notify_unjailed = "Du blev frifundet."
      },
      fine = {
        title = "Bøder",
        description = "Udsted bøde til nærmeste spiller.",
        fined = "Bøde på {2} DKK for {1}.",
        notify_fined = "Du fik en bøde på  {2} DKK for {1}.",
        record = "[Bøde] {2} DKK for {1}"
      },
      store_weapons = {
        title = "Gem våben",
        description = "Gem dine våben i dit inventar."
      },
	  spikes = {
        title = "Placer sømmåtte",
        description = "Placer sømmåtte på din lokation."
      },
	  dragplayer = {
        title = "Træk/flyt person",
        description = "Træk/flyt den nærmeste spiller."
      }
    },
    identity = {
      info = "<em>Fornavn: </em>{2}<br /><em>Efternavn: </em>{1}<br /><em>Alder: </em>{3}<br /><em>CPR: </em>{4}<br /><em>Mobilnummer: </em>{5}<br /><em>Virksomhed: </em>{6}<br /><em>Virksomhedskapital: </em>{7} DKK<br /><em>Adresse: </em>{9} {8}"
    }
  },
  emergency = {
    menu = {
      revive = {
        title = "Genopliv",
        description = "Genopliv nærmeste spiller.",
        not_in_coma = "Spilleren er ikke i koma."
      },
      firstaid = {
        title = "Udøv førstehjælp",
        description = "Red en spiller fra døden ved at udøve førstehjælp",
        not_in_coma = "Spilleren er ikke i faldet om."
      }
    }
  },
  phone = {
    title = "Telefon",
    directory = {
      title = "Kontakter",
      description = "Åben kontakter.",
      add = {
        title = "> Tilføj",
        prompt_number = "Indtast telefonnummer:",
        prompt_name = "Navn på kontakt:",
        added = "Tilføjet."
      },
      sendsms = {
        title = "Send SMS",
        prompt = "Skriv besked (max {1} tegn):",
        sent = "Sendt til: #{1}.",
        not_sent = "#{1} er utilgængeligt."
      },
      sendpos = {
        title = "Send position",
      },
      remove = {
        title = "Fjern"
      }
    },
    sms = {
      title = "Indbakke",
      description = "Modtaget.",
      info = "<em>{1}</em><br /><br />{2}",
      notify = "SMS {1}:<br /> {2}"
    },
    smspos = {
      notify = "SMS-Position  {1}"
    },
    service = {
      title = "Service",
      description = "Ring efter service eller alarmcentralen.",
      prompt = "Hvis nødvendigt, indtast besked:",
      ask_call = "Modtog {1} opkald, tager du det? <em>{2}</em>",
      taken = "Opkaldet er taget.."
    },
    announce = {
      title = "Reklame",
      description = "Skriv en reklame, som kan ses af alle i et par sekunder.",
      item_desc = "{1} DKK<br /><br/>{2}",
      prompt = "Reklame indhold (10-1000 karakterer): "
    }
  },
  emotes = {
    title = "Handlinger",
    clear = {
      title = "> Stop",
      description = "Stop alle handlinger."
    }
  },
  home = {
    buy = {
      title = "Køb",
      description = "Køb hus her, prisen er {1} DKK.",
      bought = "Købt.",
      full = "Stedet er fyldt.",
      have_home = "Du har allerede et hus."
    },
    sell = {
      title = "Sælg",
      description = "Sælg dit hjem for {1} DKK",
      sold = "Solgt.",
      no_home = "Du ejer ikke dette hjem."
    },
    intercom = {
      title = "Dørklokke",
      description = "Brug dørklokken for at ringe på.",
      prompt = "Nummer:",
      not_available = "Ikke muligt.",
      refused = "Afvist.",
      prompt_who = "Hvem er det:",
      asked = "Spørger...",
      request = "Nogle prøver at åbne din dør: <em>{1}</em>"
    },
    slot = {
      leave = {
        title = "Forlad"
      },
      ejectall = {
        title = "Smid alle ud",
        description = "Smid alle ud, inkl. dig selv, og lås huset."
      }
    },
    wardrobe = {
      title = "Garderobe",
      save = {
        title = "> Gem",
        prompt = "Outfitnavn:"
      }
    },
    gametable = {
      title = "Bord",
      bet = {
        title = "Gamble",
        description = "Start en roulette med folk ved bordet, vinderen vælges tilfældigt.",
        prompt = "Sats:",
        request = "[SATS] Vil du satse {1} DKK?",
        started = "Roulette startede."
      }
    }
  },
  garage = {
    title = "{1}",
    owned = {
      title = "Ejet",
      description = "Ejet køretøjer."
    },
    buy = {
      title = "Køb",
      description = "Køb køretøjer.",
      info = "{1} DKK<br /><br />{2}"
    },
    sell = {
      title = "Sælg",
      description = "Sælg køretøjer."
    },
    rent = {
      title = "Leasing",
      description = "Lease et køretøj, indtil du forlader byen."
    },
    store = {
      title = "Parker",
      description = "Parker dit køretøj i garagen."
    }
  },
  vehicle = {
    title = "Køretøj",
    no_owned_near = "Intet køretøj i nærheden.",
    trunk = {
      title = "Bagklap",
      description = "Åben bagklappen."
    },
    detach_trailer = {
      title = "Fjern trailer",
      description = "Fjern trailer."
    },
    detach_towtruck = {
      title = "Fjern trækkrog",
      description = "Fjern trækkrog."
    },
    detach_cargobob = {
      title = "Fjern cargobob krog",
      description = "Fjern cargobob krog"
    },
	opendoor0 = {
      title = "Venstre fordør",
      description = "Åbn/luk venstre fordør."
    },
	opendoor1 = {
      title = "Højre fordør",
      description = "Åbn/luk højre fordør."
    },
	opendoor2 = {
      title = "Venstre bagdør",
      description = "Åbn/luk venstre bagdør."
    },
	opendoor3 = {
      title = "Højre bagdør",
      description = "Åbn/luk højre bagdør."
    },
	opendoor4 = {
      title = "Motorhjelm",
      description = "Åbn/luk motorhjelm."
    },
	opendoor5 = {
      title = "Bagagerum",
      description = "Åbn/luk bagagerum."
    },
	closealldoors = {
	  title = "Luk alle døre",
	  description = "Luk alle døre."
	},
    lock = {
      title = "Lås/Lås op",
      description = "Lås eller lås bil op."
    },
    engine = {
      title = "Motor",
      description = "Start eller sluk motoren."
    },
    asktrunk = {
      title = "Anmod om åbning af bagklap",
      asked = "~g~Spørger...",
      request = "Vil du åbne bagklappen?"
    },
    replace = {
      title = "Udskift køretøj",
      description = "Udskift køretøj."
    },
    repair = {
      title = "Reparer køretøj",
      description = "Reparer køretøj."
    }
  },
  gunshop = {
    title = "Våbenhandler ({1})",
    prompt_ammo = "Antal patroner du køber til {1}:",
    info = "<em>Våben: </em> {1} DKK<br /><em>Ammo: </em> {2} DKK/u<br /><br />{3}"
  },
  market = {
    title = "{1}",
    prompt = "Antal {1} til køb:",
    info = "{1} DKK<br /><br />{2}"
  },
  skinshop = {
    title = "Skinshop"
  },
  cloakroom = {
    title = "{1}",
    undress = {
      title = "> Fjern Uniform"
    }
  },
  itemtr = {
    informer = {
      title = "Illegal Informer",
      description = "Lokation af weed planter.{1} DKK",
      bought = "Position sendt til GPS."
    }
  },
  mission = {
    blip = "Mission ({1}) {2}/{3}",
    display = "<span class=\"name\">{1}</span> <span class=\"step\">{2}/{3}</span><br /><br />{4}",
    cancel = {
      title = "Afslut mission"
    }
  },
  aptitude = {
    title = "Informationer",
    description = "Vis informationer.",
    lose_exp = "Færdighed: {1}/{2} -{3} XP.",
    earn_exp = "Færdighed: {1}/{2} +{3} XP.",
    level_down = "Færdighed: {1}/{2} tabte niveau ({3}).",
    level_up = "Færdighed: {1}/{2} niveau op ({3}).",
    display = {
      group = "{1}: ",
      aptitude = "{1} (Level {3})"
    }
  }
}

return lang
