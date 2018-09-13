local ui  = {
  button  = require "UI/button",
  textBox = require "UI/textBox",
  number  = require "UI/number",
  list    = require "UI/list"
}

function ui:onClick(b)
  self.button:onClick(b)
  self.textBox:onClick(b)
  self.list:onClick(b)
end

function ui:show()
  self.button:show()
  self.textBox:show()
  self.number:show()
  self.list:show()
end

function ui:textinput(text)
  self.textBox:textinput(text)
end

function ui:keypressed(k)
  self.textBox:keypressed(k)
end

function ui:clear()
  self.button:clear()
  self.textBox:clear()
  self.number:clear()
  self.list:clear()
end

return ui
