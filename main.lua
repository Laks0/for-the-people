utf8 = require "utf8"

require "tools/render"
ui = require "UI/ui"

require "tools/sceneHandler"

width = love.graphics.getWidth()
height = love.graphics.getHeight()

defaultFont = love.graphics.newFont("assets/Times New Roman.ttf", 20)
times35     = love.graphics.newFont("assets/Times New Roman.ttf", 35)
times12     = love.graphics.newFont("assets/Times New Roman.ttf", 12)

math.randomseed(os.time())

scene = ""

function love.load()
  print(os.time())
  render:create(4)

  sceneLoad("creation")

  love.graphics.setBackgroundColor(.9,.9,.9)
  love.keyboard.setKeyRepeat(true)
end

function love.update(dt)
  render:clear()

  sceneUpdate(scene,dt)

  mouse = {
    x = love.mouse.getX(),
    y = love.mouse.getY()
  }
end

function love.draw()
  ui:show()

  sceneDraw(scene)

  for i = 1, #render do
    render:show(i)
  end
end

function mouse_en(x,y,w,h)
  return mouse.x > x and mouse.x < x + w and mouse.y > y and mouse.y < y + h
end

function love.keypressed(k, scancode, isrepeat)
  ui:keypressed(k)
end

function love.mousereleased(x, y, b, isTouch)
  ui:onClick(b)
end

function love.textinput(text)
  ui:textinput(text)
end
