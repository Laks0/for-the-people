local party_names = require "data/party_names"
local ideologies = require "data/ideologies"

function creation_load()
  ui:clear()

  party = {
    name = "",
    color = {math.random(),math.random(),math.random()},
    ideology = 0
  }

  ui.textBox:create(width/2,20,350,true, function (t)
    party.name = t
  end,"Party Name")

  ui.button:create(width/2+185,25,70,30,false,"Random",function (id,val)
    local n = val[math.random(1, #val)]
    ui.textBox[1].text = n
    party.name = n
  end,party_names)


  ui.list:create(width-300,100,false,"Ideology",math.random(1,#ideologies),ideologies,
  function (o,id)
    party.ideology = o
  end)


  ui.button:create(width/2,height-75,500,50,true,"Start Game",function (id,val)
    if party.name ~= "" and party.name ~= nil then
      sceneLoad("game")
    end
  end)

  ui.slider:create(width/8,150,width/4-20,true,0,1,party.color[1],function (val)
    party.color[1] = val
  end,nil,{1,0,0})

  ui.slider:create(width/8,200,width/4-20,true,0,1,party.color[1],function (val)
    party.color[2] = val
  end,nil,{0,1,0})

  ui.slider:create(width/8,250,width/4-20,true,0,1,party.color[1],function (val)
    party.color[3] = val
  end,nil,{0,0,1})
end

function creation_draw()
  render:textf("PARTY COLOR",0,100,"center",width/4,2,party.color)
end
