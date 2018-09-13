local textBox = {}

function textBox:clear()
  for i = 1, #self do
    table.remove(self,1)
  end
end

function textBox:create(x,y,w,center,action,name,layer,font,color)
  local t = {}
  t.x = x or 10
  t.y = y or 10
  t.w = w or 350
  if center then
    t.x = t.x - t.w/2
  end
  t.name = name or "Text box ".. #self+1
  t.text = ""
  t.l = layer or 3
  t.font = font or defaultFont
  t.color = color or {1,1,1}
  t.action = action or function (t)

  end
  t.sel = false
  table.insert(self,t)
end

function textBox:onClick(b)
  for i, t in ipairs(self) do
    if mouse_en(t.x,t.y,t.w,t.font:getHeight(t.text)+20) then
      t.sel = true
    else
      t.sel = false
    end
  end
end

function textBox:textinput(text)
  for i, t in ipairs(self) do
    if t.sel then
      if t.font:getWidth(t.text..text)+3 < t.w then
        t.text = t.text..text
        t.action(t.text)
      end
    end
  end
end

function textBox:keypressed(k)
  for i, t in ipairs(self) do
    if t.sel then
      if k == "backspace" then
        local byteoffset = utf8.offset(t.text, -1)
        if byteoffset then
          t.text = string.sub(t.text,1,byteoffset-1)
        end
        t.action(t.text)
      end
      if k == "return" or k == "escape" then
        t.action(t.text)
        t.sel = false
      end
    end

  end
end

function textBox:show()
  for i, t in ipairs(self) do
    local line = t.font:getHeight(t.text)
    local h = line+20

    render:rectangle("fill", t.x, t.y, t.w, h, t.layer, t.color)

    local tColor
    local txt
    if t.text ~= "" then
      if t.color[1] <= .5 and t.color[2] <= .5 and t.color[3] <= .5 then
        tColor = {1,1,1}
      else
        tColor = {0,0,0}
      end
      txt = t.text
      if t.sel then txt = txt.."|" end
    else
      if t.color[1] <= .5 and t.color[2] <= .5 and t.color[3] <= .5 then
        tColor = {.8,.8,.8}
      else
        tColor = {.4,.4,.4}
      end
      txt = t.name
    end

    render:textf(txt, t.x, t.y + h/2 - line/2, "center", t.w ,t.l,tColor,t.font)

    render:rectangle("line", t.x-1, t.y-1, t.w+2, h+2, t.layer, {.3,.3,1})
  end
end

return textBox
