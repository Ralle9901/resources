
local cfg = {}

-- size of the sms history
cfg.sms_history = 25

-- maximum size of an sms
cfg.sms_size = 750

-- duration of a sms position marker (in seconds)
cfg.smspos_duration = 300

-- define phone services
-- blipid, blipcolor (customize alert blip)
-- alert_time (alert blip display duration in seconds)
-- alert_permission (permission required to receive the alert)
-- alert_notify (notification received when an alert is sent)
-- notify (notification when sending an alert)
cfg.services = {
  ["Politi"] = {
    blipid = 304,
    blipcolor = 38,
    alert_time = 300, -- 5 minutes
    alert_permission = "police.service",
    alert_notify = "Alarmcentral: ",
    notify = "Du ringede til politet.",
    answer_notify = "Politiet på vej."
  },
  ["Ambulanceredder"] = {
    blipid = 153,
    blipcolor = 1,
    alert_time = 300, -- 5 minutes
    alert_permission = "emergency.service",
    alert_notify = "Alarmcentral: ",
    notify = "Du tilkaldte en ambulance.",
    answer_notify = "En ambulance er på vej."
  },
  ["Taxa"] = {
    blipid = 198,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "taxi.service",
    alert_notify = "Taxacentral: ",
    notify = "Du ringede til en Taxa.",
    answer_notify = "Taxaen er nu på vej"
  },
  ["Mekaniker"] = {
    blipid = 446,
    blipcolor = 5,
    alert_time = 300,
    alert_permission = "repair.service",
    alert_notify = "Værkføre: ",
    notify = "Du ringede til en Mekaniker.",
    answer_notify = "Mekanikeren er på vej"
  },
  ["Advokat"] = {
    blipid = 133,
    blipcolor = 16,
    alert_time = 600,
    alert_permission = "lawyer.service",
    alert_notify = "Advokatkontor: ",
    notify = "Du ringede til en Advokat.",
    answer_notify = "Advokaten er på vej"
  }
}

-- define phone announces
-- image: background image for the announce (800x150 px)
-- price: amount to pay to post the announce
-- description (optional)
-- permission (optional): permission required to post the announce
cfg.announces = {
  ["admin"] = {
    --image = "nui://vrp_mod/announce_admin.png",
    image = "https://i.imgur.com/oIAuHeT.png",
    price = 0,
    description = "Adminstrator",
    permission = "admin.announce"
  },
  ["Politi"] = {
    --image = "nui://vrp_mod/announce_police.png",
    image = "https://i.imgur.com/1qFbDQh.png",
    price = 0,
    description = "Politi - Eftersøgelser mm.",
    permission = "police.announce"
  },
  ["Taxa"] = {
    --image = "nui://vrp_mod/announce_police.png",
    image = "https://i.imgur.com/AUg22dp.png",
    price = 0,
    description = "Taxa - Meld dig on duty!",
    permission = "taxi.announce"
  },
  ["Mekaniker"] = {
    --image = "nui://vrp_mod/announce_police.png",
    image = "https://i.imgur.com/tk9iRQg.png",
    price = 0,
    description = "Mekaniker - Kan Vi fikse det? Ja Vi kan!",
    permission = "mech.announce"
  },
  ["Reklame"] = {
    --image = "nui://vrp_mod/announce_commercial.png",
    image = "https://i.imgur.com/PrrMoci.png",
    description = "Kommercielt - Arbejde, salg, køb",
    price = 5000
  },
  ["Advokat"] = {
    --image = "nui://vrp_mod/announce_commercial.png",
    image = "https://i.imgur.com/PuXdWtj.png",
    description = "Advokat - Problemer med loven? Intet problem!",
    price = 0,
    permission = "lawyer.announce"
  },
  ["Socialt"] = {
    --image = "nui://vrp_mod/announce_party.png",
    image = "https://i.imgur.com/dOdpie1.png",
    description = "Til sociale arrangementer",
    price = 5000
  }
}

return cfg
