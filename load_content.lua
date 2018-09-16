defaultFont = love.graphics.newFont("assets/Times New Roman.ttf", 20)
times35     = love.graphics.newFont("assets/Times New Roman.ttf", 35)
times12     = love.graphics.newFont("assets/Times New Roman.ttf", 12)

provinces = {}

local addProv = function (img,name)
  local t = {img = img, name = name}
  table.insert(provinces,t)
end

-- North
addProv(love.graphics.newImage("Assets/Provinces/Capitis.png"),    "Capitis")
addProv(love.graphics.newImage("Assets/Provinces/Rives.png"),      "Rives")
addProv(love.graphics.newImage("Assets/Provinces/Fluma.png"),      "Fluma")
addProv(love.graphics.newImage("Assets/Provinces/Cort.png"),       "Cort")
addProv(love.graphics.newImage("Assets/Provinces/Divisiore.png"),  "Divisiore")
addProv(love.graphics.newImage("Assets/Provinces/Bentrum.png"),    "Bentrum")
addProv(love.graphics.newImage("Assets/Provinces/Agri.png"),       "Agri")
addProv(love.graphics.newImage("Assets/Provinces/Montibus.png"),   "Montibus")
addProv(love.graphics.newImage("Assets/Provinces/N Eccido.png"),   "N. Eccido")
addProv(love.graphics.newImage("Assets/Provinces/S Eccido.png"),   "S. Eccido")
addProv(love.graphics.newImage("Assets/Provinces/Vilpistur.png"),  "Vilpistur")
addProv(love.graphics.newImage("Assets/Provinces/Fincivaton.png"), "Fincivaton")
addProv(love.graphics.newImage("Assets/Provinces/Finatis.png"),    "Finatis")
-- South
addProv(love.graphics.newImage("Assets/Provinces/Auria.png"),      "Auria")
addProv(love.graphics.newImage("Assets/Provinces/Nihel.png"),      "Nihel")
addProv(love.graphics.newImage("Assets/Provinces/Piuluip.png"),    "Piuluip")
addProv(love.graphics.newImage("Assets/Provinces/Flumigrum.png"),  "Flumigrum")
addProv(love.graphics.newImage("Assets/Provinces/Axtensio.png"),   "Axtensio")
addProv(love.graphics.newImage("Assets/Provinces/Dinal.png"),      "Dinal")

hub = require "menus/hub"
status = require "menus/status"
