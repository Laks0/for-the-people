local number = {}

function number:create(x,y,center,action,min,max,sum,rest,layer,font,color)
  local n = {}
  n.x = x or 10
  n.y = y or 10
  n.w = 260
  if center then
    n.x = n.x - n.w/2
  end
  n.min = min or 0
  n.max = max or 100
  n.sum = sum or 1
  n.rest = rest or n.sum
  n.font = font or defaultFont
  n.action = action or function (val)
    print(val)
  end
  n.layer = layer or 3
  n.color = color or {1,1,1}
  n.v = min or 0
  table.insert(self, n)

  ui.button:create(n.x+n.w-70,n.y,70,nil,false,"+"..n.sum,function (id,val)
    if ui.number[val[1]].v < ui.number[val[1]].max then
      ui.number[val[1]].v = ui.number[val[1]].v + val[2]
      ui.number[val[1]].action(ui.number[val[1]].v)
    end
  end,{#self,n.sum})

  ui.button:create(n.x,n.y,70,nil,false,"-"..n.rest,function (id,val)
    if ui.number[val[1]].v > ui.number[val[1]].min then
      ui.number[val[1]].v = ui.number[val[1]].v - val[2]
      ui.number[val[1]].action(ui.number[val[1]].v)
    end
  end,{#self,n.rest})
end

function number:show()
  for i, n in ipairs(self) do
    render:rectangle("fill",n.x+75,n.y,110,30,n.layer,n.color)
    render:rectangle("line",n.x+74,n.y-1,112,32,n.layer,{.3,.3,1})
    render:textf(n.v, n.x+75, n.y+15-n.font:getHeight(n.v)/2,"center",110,n.layer,{0,0,0},n.font)
  end
end

return number
