-- define items, see the Inventory API on github

local cfg = {}
-- see the manual to understand how to create parametric items
-- idname = {name or genfunc, description or genfunc, genfunc choices or nil, weight or genfunc}
-- a good practice is to create your own item pack file instead of adding items here
cfg.items = {
  ["weed"] = {"Hampblade", "Hampblade, bruges til fremstilling af hash.", nil, 0.01}, -- no choices
  ["cocaineplant"] = {"Kokaplante", "Kokaplante, bruges til fremstilling af Kokain.", nil, 0.01}, -- no choices
  ["acid"] = {"Syre", "Syre, bruges til fremstilling af LSD.", nil, 0.01}, -- no choices
  ["kul"] = {"Kul", "Kul, bruges til fremstilling af Diamant.", nil, 1.00}, -- no choices
  ["diamant"] = {"Diamant", "Diamant, kan sælges i en butik for hvide penge.", nil, 0.01}, -- no choices
  ["jernmalm"] = {"Jernmalm", "Jernmalm, bruges til fremstilling af jern.", nil, 1.00}, -- no choices
  ["jern"] = {"Jern", "Jern, kan sælges videre for hvide penge.", nil, 5.00}, -- no choices
  ["guldmalm"] = {"Guldmalm", "Guldmalm, bruges til fremstilling af guld.", nil, 2.00}, -- no choices
  ["guld"] = {"Guld", "Guld, kan sælges videre for hvide penge.", nil, 10.00}, -- no choices
  ["credit"] = {"Kreditkort", "Kreditkort", nil, 0.01}, -- no choices
  ["bank_money"] = {"Bankpenge", "DKK", nil, 0}, -- no choices
  ["Aphone"] = {"iPhone X", "En telefon, som kan bruges til at sms osv.", nil, 0.3}, -- Til Elgiganten
}

-- load more items function
local function load_item_pack(name)
  local items = module("cfg/item/"..name)
  if items then
    for k,v in pairs(items) do
      cfg.items[k] = v
    end
  else
    print("[vRP] item pack ["..name.."] not found")
  end
end

-- PACKS
load_item_pack("required")
load_item_pack("food")
load_item_pack("drugs")

return cfg