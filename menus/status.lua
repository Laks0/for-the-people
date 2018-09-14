local status = {}

function status:load()
  ui.button:create(10,10,75,50,false,"Back",function ()
    change_menu(require "menus/hub")
  end)
end

function status:update(dt)

end

function status:draw()

end

return status
