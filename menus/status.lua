local status = {}

local seld = 1

function status:load()
  ui.button:create(10,10,75,50,false,"Back",function ()
    change_menu(hub)
  end)

  local opt = {}
  for i, p in ipairs(provinces) do
    table.insert(opt,p.name)
  end
  ui.list:create(100,20,false,"Province",seld,opt,function (o)
    seld = o
  end)
end

function status:update(dt)

end

function status:draw()
  provinces:show(width/2-150,100,nil,seld)
end

return status
