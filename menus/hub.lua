local hub = {}

function hub:load()
  ui.button:create(width/2-300,100,150,75,false,"STATUS",function ()
    change_menu(require "menus/status")
  end,nil,nil,times35)
end

function hub:update(dt)

end

function hub:draw()
  render:textf(party.name,0,20,"center",width,2,party.color,times35)
end

return hub
