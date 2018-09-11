local ui = {
  button = require "UI/button",
  textBox = require "UI/textBox",
  number = require "UI/number"
}

function ui:onClick(b)
  self.button:onClick(b)
  self.textBox:onClick(b)
end

function ui:show()
  self.button:show()
  self.textBox:show()
  self.number:show()
end

function ui:textinput(text)
  self.textBox:textinput(text)
end

function ui:keypressed(k)
  self.textBox:keypressed(k)
end

return ui
