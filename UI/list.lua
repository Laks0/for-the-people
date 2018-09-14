local list = {}

function list:clear()
  for i = 1, #self do
    table.remove(self,1)
  end
end

function list:create(x,y,center,title,default,options,action,layer)
  local l = {}
  l.x = x or 10
  l.y = y or 10
  l.w = 250
  if center then
    l.x = l.x - l.w/2
  end
  l.title = title or "List "..#self+1
  l.options = options or {"option 1","option 2"}
  l.sel = default or 1
  l.sep = 5
  l.action = action or function (o)
    print(o.. " selected")
  end
  l.layer = layer or 3
  table.insert(self,l)
  l.action(l.sel,#self)
end

function list:onClick(b)
  for i, l in ipairs(self) do
    local th = l.y+defaultFont:getHeight(l.title)+l.sep
    for o = 1, #l.options do
      local textHeight = defaultFont:getHeight(l.options[o])
      local optionHeight = textHeight+10
      if mouse_en(l.x,th,l.w,optionHeight) and l.sel ~= o then
        l.sel = o
        l.action(o,#self)
      end
      th = th + optionHeight
    end
  end
end

function list:show()
  for i, l in ipairs(self) do
    render:textf(l.title,l.x,l.y,"center",l.w,l.layer,{0,0,0})
    local oy = l.y+defaultFont:getHeight(l.title)+l.sep
    local th = 0

    for o = 1, #l.options do
      if o ~= 1 then
        render:dottedLine(l.x,oy+th,l.w+l.x,oy+th,5,2,l.layer,{0,0,0})
      end

      local textHeight = defaultFont:getHeight(l.options[o])
      local optionHeight = textHeight+10
      render:textf(l.options[o],l.x, oy+th+optionHeight/2-textHeight/2,"center",l.w,l.layer,{0,0,0})

      local bg_color = {1,1,1}
      if l.sel == o then
        bg_color = {.7,.7,.7}
      elseif mouse_en(l.x,oy+th,l.w,optionHeight) then
        bg_color = {.8,.8,.8}
      end

      render:rectangle("fill",l.x,oy+th,l.w,optionHeight,l.layer-1,bg_color)
      th = th + optionHeight
    end
    render:rectangle("line",l.x,oy,l.w,th,l.layer,{.3,.3,1})
  end
end

return list
