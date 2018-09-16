function provinces:show(x,y,mode,sel)
  for i, p in ipairs(self) do
    local clr = {1,1,1}
    if mode == nil and sel == i then
      clr = {.8,.8,.8}
    end

    render:img(p.img,x,y,4,clr)
  end
end
