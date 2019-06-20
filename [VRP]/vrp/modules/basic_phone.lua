-- basic phone module
local lang = vRP.lang
local cfg = module("cfg/phone")
local htmlEntities = module("lib/htmlEntities")
local services = cfg.services
local announces = cfg.announces

local sanitizes = module("cfg/sanitizes")

--Discord
local DiscordWebhook = 'https://discordapp.com/api/webhooks/395900155582218241/fgaG525PH6l_HNBNbzv2aWklX_xkADaLiTW2_Gy56loH1m5jodpGEvQWt8S_KvQI5nf0'
-- PerformHttpRequest(DiscordWebhook, function(Error, Content, Head) end, 'POST', json.encode({username = "Distrikt "..GetConvar("servernumber"), content = '**Indlæser...** | Status: Ny dag'}), { ['Content-Type'] = 'application/json' })

function vRP.sendServiceAlert(sender, service_name,x,y,z,msg)
  local service = services[service_name]
  local user_id = vRP.getUserId(sender)
  local answered = false
  if service then
    local players = {}
    for k,v in pairs(vRP.rusers) do
      local player = vRP.getUserSource(tonumber(k))
	  
	  if vRP.hasPermission(k,service.alert_permission) and player ~= nil then
			table.insert(players,player)
		  if service_name == "Politi" then
			 PerformHttpRequest(DiscordWebhook, function(Error, Content, Head) end, 'POST', json.encode({username = "Distrikt "..GetConvar("servernumber"), content ="Modtaget af betjent? ✔️ | Opringer: **"..user_id.."** | "..msg}), { ['Content-Type'] = 'application/json' })
		   end	
		end
    end

    for k,v in pairs(players) do
		TriggerClientEvent("pNotify:SendNotification", v,{text = {service.alert_notify..msg}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
      vRPclient.addBlip(v,{x,y,z,service.blipid,service.blipcolor,"("..service_name..") "..msg}, function(bid)
        SetTimeout(service.alert_time*1000,function()
          vRPclient.removeBlip(v,{bid})	
        end)
    end)

      -- call request
      if sender ~= nil then
        vRP.request(v,lang.phone.service.ask_call({service_name, htmlEntities.encode(msg)}), 30, function(v,ok)
          if ok then -- take the call
            if not answered then
              -- answer the call
              -- vRPclient.notify(sender,{service.answer_notify})
			TriggerClientEvent("pNotify:SendNotification", sender,{text = {service.answer_notify}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
				vRPclient.setGPS(v,{x,y})
              answered = true
            else
              -- vRPclient.notify(v,{lang.phone.service.taken()})
			  TriggerClientEvent("pNotify:SendNotification", v,{text = {lang.phone.service.taken()}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})	
            end
          end
        end)
      end
    end
  end
end

-- send an sms from an user to a phone number
-- cbreturn true on success
function vRP.sendSMS(user_id, phone, msg, cbr)
  local task = Task(cbr)

  if string.len(msg) > cfg.sms_size then -- clamp sms
    sms = string.sub(msg,1,cfg.sms_size)
  end

  vRP.getUserIdentity(user_id, function(identity)
    vRP.getUserByPhone(phone, function(dest_id)
      if identity and dest_id then
        local dest_src = vRP.getUserSource(dest_id)
        if dest_src then
          local phone_sms = vRP.getPhoneSMS(dest_id)

          if #phone_sms >= cfg.sms_history then -- remove last sms of the table
            table.remove(phone_sms)
          end

          local from = vRP.getPhoneDirectoryName(dest_id, identity.phone).." ("..identity.phone..")"
          -- vRPclient.notify(dest_src,{lang.phone.sms.notify({from, msg})})
			 TriggerClientEvent("pNotify:SendNotification", dest_src,{text = {lang.phone.sms.notify({from, msg})}, type = "info", queue = "global",timeout = 20000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
          table.insert(phone_sms,1,{identity.phone,msg}) -- insert new sms at first position {phone,message}
          task({true})
        else
          task()
        end
      else
        task()
      end
    end)
  end)
end

-- send an smspos from an user to a phone number
-- cbreturn true on success
function vRP.sendSMSPos(user_id, phone, x,y,z, cbr)
  local task = Task(cbr)

  vRP.getUserIdentity(user_id, function(identity)
    vRP.getUserByPhone(phone, function(dest_id)
      if identity and dest_id then
        local dest_src = vRP.getUserSource(dest_id)
        if dest_src then
          local from = vRP.getPhoneDirectoryName(dest_id, identity.phone).." ("..identity.phone..")"
          vRPclient.notify(dest_src,{lang.phone.smspos.notify({from})}) -- notify
          -- add position for 5 minutes
          vRPclient.addBlip(dest_src,{x,y,z,162,37,from}, function(bid)
            SetTimeout(cfg.smspos_duration*1000,function()
              vRPclient.removeBlip(dest_src,{bid})
            end)
          end)

          task({true})
        else
          task()
        end
      else
        task()
      end
    end)
  end)
end

-- get phone directory data table
function vRP.getPhoneDirectory(user_id)
  local data = vRP.getUserDataTable(user_id)
  if data then
    if data.phone_directory == nil then
      data.phone_directory = {}
    end

    return data.phone_directory
  else
    return {}
  end
end

-- get directory name by number for a specific user
function vRP.getPhoneDirectoryName(user_id, phone)
  local directory = vRP.getPhoneDirectory(user_id)
  for k,v in pairs(directory) do
    if v == phone then
      return k
    end
  end

  return "unknown"
end
-- get phone sms tmp table
function vRP.getPhoneSMS(user_id)
  local data = vRP.getUserTmpTable(user_id)
  if data then
    if data.phone_sms == nil then
      data.phone_sms = {}
    end

    return data.phone_sms
  else
    return {}
  end
end

-- build phone menu
local phone_menu = {name=lang.phone.title(),css={top="75px",header_color="rgba(0,125,255,0.75)"}}

local function ch_directory(player,choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    local phone_directory = vRP.getPhoneDirectory(user_id)
    -- build directory menu
    local menu = {name=choice,css={top="75px",header_color="rgba(0,125,255,0.75)"}}

    local ch_add = function(player, choice) -- add to directory
      vRP.prompt(player,lang.phone.directory.add.prompt_number(),"",function(player,phone)
        vRP.prompt(player,lang.phone.directory.add.prompt_name(),"",function(player,name)
          name = sanitizeString(tostring(name),sanitizes.text[1],sanitizes.text[2])
          phone = sanitizeString(tostring(phone),sanitizes.text[1],sanitizes.text[2])
          if #name > 0 and #phone > 0 then
            phone_directory[name] = phone -- set entry
            -- vRPclient.notify(player, {lang.phone.directory.add.added()})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.phone.directory.add.added()}, type = "success", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
          else
            -- vRPclient.notify(player, {lang.common.invalid_value()})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.invalid_value()}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
          end
        end)
      end)
    end

    local ch_entry = function(player, choice) -- directory entry menu
      -- build entry menu
      local emenu = {name=choice,css={top="75px",header_color="rgba(0,125,255,0.75)"}}

      local name = choice
      local phone = phone_directory[name] or ""

      local ch_remove = function(player, choice) -- remove directory entry
        phone_directory[name] = nil
        vRP.closeMenu(player) -- close entry menu (removed)
      end

      local ch_sendsms = function(player, choice) -- send sms to directory entry
        vRP.prompt(player,lang.phone.directory.sendsms.prompt({cfg.sms_size}),"",function(player,msg)
          msg = sanitizeString(msg,sanitizes.text[1],sanitizes.text[2])
          vRP.sendSMS(user_id, phone, msg, function(ok)
            if ok then
              -- vRPclient.notify(player,{lang.phone.directory.sendsms.sent({phone})})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.phone.directory.sendsms.sent({phone})}, type = "success", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            else
              -- vRPclient.notify(player,{lang.phone.directory.sendsms.not_sent({phone})})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.phone.directory.sendsms.not_sent({phone})}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
          end)
        end)
      end

      local ch_sendpos = function(player, choice) -- send current position to directory entry
        vRPclient.getPosition(player,{},function(x,y,z)
          vRP.sendSMSPos(user_id, phone, x,y,z,function(ok)
            if ok then
              -- vRPclient.notify(player,{lang.phone.directory.sendsms.sent({phone})})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.phone.directory.sendsms.sent({phone})}, type = "success", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            else
              -- vRPclient.notify(player,{lang.phone.directory.sendsms.not_sent({phone})})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.phone.directory.sendsms.not_sent({phone})}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
          end)
        end)
      end

      emenu[lang.phone.directory.sendsms.title()] = {ch_sendsms}
      emenu[lang.phone.directory.sendpos.title()] = {ch_sendpos}
      emenu[lang.phone.directory.remove.title()] = {ch_remove}

      -- nest menu to directory
      emenu.onclose = function() ch_directory(player,lang.phone.directory.title()) end

      -- open mnu
      vRP.openMenu(player, emenu)
    end

    menu[lang.phone.directory.add.title()] = {ch_add}

    for k,v in pairs(phone_directory) do -- add directory entries (name -> number)
      menu[k] = {ch_entry,v}
    end

    -- nest directory menu to phone (can't for now)
    -- menu.onclose = function(player) vRP.openMenu(player, phone_menu) end

    -- open menu
    vRP.openMenu(player,menu)
  end
end

local function ch_sms(player, choice)
  local user_id = vRP.getUserId(player)
  if user_id ~= nil then
    local phone_sms = vRP.getPhoneSMS(user_id)

    -- build sms list
    local menu = {name=choice,css={top="75px",header_color="rgba(0,125,255,0.75)"}}

    -- add sms
    for k,v in pairs(phone_sms) do
      local from = vRP.getPhoneDirectoryName(user_id, v[1]).." ("..v[1]..")"
      local phone = v[1]
      menu["#"..k.." "..from] = {function(player,choice)
        -- answer to sms
        vRP.prompt(player,lang.phone.directory.sendsms.prompt({cfg.sms_size}),"",function(player,msg)
          msg = sanitizeString(msg,sanitizes.text[1],sanitizes.text[2])
          vRP.sendSMS(user_id, phone, msg, function(ok)
            if ok then
              -- vRPclient.notify(player,{lang.phone.directory.sendsms.sent({phone})})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.phone.directory.sendsms.sent({phone})}, type = "success", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            else
              -- vRPclient.notify(player,{lang.phone.directory.sendsms.not_sent({phone})})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.phone.directory.sendsms.not_sent({phone})}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
            end
          end)
        end)
      end, lang.phone.sms.info({from,htmlEntities.encode(v[2])})}
    end

    -- nest menu
    menu.onclose = function(player) vRP.openMenu(player, phone_menu) end

    -- open menu
    vRP.openMenu(player,menu)
  end
end

-- build service menu
local service_menu = {name=lang.phone.service.title(),css={top="75px",header_color="rgba(0,125,255,0.75)"}}

-- nest menu
service_menu.onclose = function(player) vRP.openMenu(player, phone_menu) end

local function ch_service_alert(player,choice) -- alert a service
  local service = services[choice]
  if service then
    vRPclient.getPosition(player,{},function(x,y,z)
      vRP.prompt(player,lang.phone.service.prompt(),"",function(player, msg)
        msg = sanitizeString(msg,sanitizes.text[1],sanitizes.text[2])
        -- vRPclient.notify(player,{service.notify}) -- notify player
		TriggerClientEvent("pNotify:SendNotification", player,{text = {service.notify}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        vRP.sendServiceAlert(player,choice,x,y,z,msg) -- send service alert (call request)
      end)
    end)
  end
end

for k,v in pairs(services) do
  service_menu[k] = {ch_service_alert}
end

local function ch_service(player, choice)
  vRP.openMenu(player,service_menu)
end

-- build announce menu
local announce_menu = {name=lang.phone.announce.title(),css={top="75px",header_color="rgba(0,125,255,0.75)"}}

-- nest menu
announce_menu.onclose = function(player) vRP.openMenu(player, phone_menu) end

local function ch_announce_alert(player,choice) -- alert a announce
  local announce = announces[choice]
  local user_id = vRP.getUserId(player)
  if announce and user_id ~= nil then
    if announce.permission == nil or vRP.hasPermission(user_id,announce.permission) then
      vRP.prompt(player,lang.phone.announce.prompt(),"",function(player, msg)
        msg = sanitizeString(msg,sanitizes.text[1],sanitizes.text[2])
        if string.len(msg) > 10 and string.len(msg) < 1000 then
          if announce.price <= 0 or vRP.tryPayment(user_id, announce.price) then -- try to pay the announce
            -- vRPclient.notify(player, {lang.money.paid({announce.price})})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.paid({announce.price})}, type = "success", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})

            msg = htmlEntities.encode(msg)
            msg = string.gsub(msg, "\n", "<br />") -- allow returns

            -- send announce to all
            local users = vRP.getUsers()
            for k,v in pairs(users) do
              vRPclient.announce(v,{announce.image,msg})
            end
          else
            -- vRPclient.notify(player, {lang.money.not_enough()})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.money.not_enough()}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
          end
        else
          -- vRPclient.notify(player, {lang.common.invalid_value()})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.invalid_value()}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
        end
      end)
    else
      -- vRPclient.notify(player, {lang.common.not_allowed()})
			TriggerClientEvent("pNotify:SendNotification", player,{text = {lang.common.not_allowed()}, type = "error", queue = "global",timeout = 4000, layout = "bottomRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
    end
  end
end

for k,v in pairs(announces) do
  announce_menu[k] = {ch_announce_alert,lang.phone.announce.item_desc({v.price,v.description or ""})}
end

local function ch_announce(player, choice)
  vRP.openMenu(player,announce_menu)
end

phone_menu[lang.phone.directory.title()] = {ch_directory,lang.phone.directory.description()}
phone_menu[lang.phone.sms.title()] = {ch_sms,lang.phone.sms.description()}
phone_menu[lang.phone.service.title()] = {ch_service,lang.phone.service.description()}
phone_menu[lang.phone.announce.title()] = {ch_announce,lang.phone.announce.description()}

-- phone menu static builder after 10 seconds
SetTimeout(10000, function()
  vRP.buildMenu("phone", {}, function(menu)
    for k,v in pairs(menu) do
      phone_menu[k] = v
    end
  end)
end)

-- add phone menu to main menu

vRP.registerMenuBuilder("main", function(add, data)
  local player = data.player
  local user_id = vRP.getUserId(player)
  if user_id == nil then
    return
  end

  local choices = {}
  if vRP.hasPermission(user_id, "player.phone") and vRP.hasInventoryItem(user_id, "phone") or vRP.hasInventoryItem(user_id, "phone1")  then
    choices[lang.phone.title()] = {function() 
      vRP.openMenu(player,phone_menu)
    end}
  end

  add(choices)
end)
