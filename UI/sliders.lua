local sliders = {}

function sliders:create(x,y,w,center,min,max,def,action,layer,color)
  local s = {}
  s.x = x or 10
  s.y = y or 10
  s.w = w or 200
  if center then
    s.x = s.x - s.w/2
  end
  s.min = min or 0
  s.max = max or 100
  s.val = def or 50
  s.sel = false
  s.action = action or function (v)
    print(v)
  end
  s.layer = layer or 3
  s.color = color or {.7,.7,.7}
  table.insert(self,s)
end

function sliders:update(dt)
  for i, s in ipairs(self) do
    if s.sel then
      local mx = love.mouse.getX()
      local relPos = mx - s.x
      local vp = relPos * (s.max-s.min) / s.w
      if vp > s.max then
        vp = s.max
      end
      if vp < s.min then
        vp = s.min
      end
      s.val = vp
      s.action(vp)
    end
  end
end

function sliders:onRel(b)
  for i, s in ipairs(self) do
    s.sel = false
  end
end

function sliders:onClick(b)
  for i, s in ipairs(self) do
    if b == 1 and mouse_en(s.x+s.val*(s.w/(s.max-s.min)),s.y-5,10,25) then
      s.sel = true
    end
  end
end

function sliders:show()
  for i, s in ipairs(self) do
    render:rectangle("fill",s.x,s.y,s.w,15,s.layer,s.color)

    local vp = s.x+s.val*(s.w/(s.max-s.min))

    render:rectangle("fill",vp,s.y-5,10,25,s.layer)
    render:rectangle("line",vp,s.y-5,10,25,s.layer,{.3,.3,1})
  end
end

return sliders
