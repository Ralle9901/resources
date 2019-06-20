
local cfg = {}

-- start wallet/bank values
cfg.open_wallet = 2500
cfg.open_bank = 50000

cfg.display_css = [[
.div_money{
  font-family: 'Oswald', sans-serif;
  padding: 0;
  margin: 0;
  position: absolute;
  top: 60px;
  right: 16px;
  font-size: 1.0vw;
  font-weight: bold;
  color: #FFFFFF;
  text-shadow: rgb(0, 0, 0) 1px 0px 0px, rgb(0, 0, 0) 0.533333px 0.833333px 0px, rgb(0, 0, 0) -0.416667px 0.916667px 0px, rgb(0, 0, 0) -0.983333px 0.133333px 0px, rgb(0, 0, 0) -0.65px -0.75px 0px, rgb(0, 0, 0) 0.283333px -0.966667px 0px, rgb(0, 0, 0) 0.966667px -0.283333px 0px;
}
]]

return cfg