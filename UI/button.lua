local button = {}

function button:clear()
  for i = 1, #self do
    table.remove(self,1)
  end
end

function button:create(x,y,w,h,center,t,action,val,layer,font,color)
  local b = {}
  b.x = x or 10
  b.y = y or 10
  b.w = w or 100
  if center then
    b.x = b.x - b.w/2
  end
  b.h = h or 30
  b.t = t or "Button ".. #self+1
  b.action = action or function(id,val)
    print("Button ".. id .." pressed")
  end
  b.layer = layer or 3
  b.color = color or {1,1,1}
  b.val = val
  b.font = font or defaultFont
  table.insert(self,b)
end

function button:onClick(btn)
  for i, b in ipairs(self) do
    if mouse_en(b.x,b.y,b.w,b.h) and btn == 1 then
      b.action(i,b.val)
    end
  end
end

function button:show()
  for i, b in ipairs(self) do
    local bg_color = b.color
    if mouse_en(b.x,b.y,b.w,b.h) then
      if love.mouse.isDown(1) then
        bg_color = {bg_color[1]-.3,bg_color[2]-.3,bg_color[3]-.3}
      else
        bg_color = {bg_color[1]-.2,bg_color[2]-.2,bg_color[3]-.2}
      end
    end

    render:rectangle("fill",b.x,b.y,b.w,b.h,b.layer,bg_color)
    render:rectangle("line",b.x-1,b.y-1,b.w+2,b.h+2,b.layer,{.3,.3,1})

    local textColor = {0,0,0}
    if b.color[1] <= .5 and b.color[2] <= .5 and b.color[3] <= .5 then
      textColor = {1,1,1}
    end

    render:textf(b.t,b.x,b.y+b.h/2-b.font:getHeight(b.t)/2,"center",b.w,b.layer,textColor,b.font)
  end
end

return button
