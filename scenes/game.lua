local hub = require "menus/hub"
local menu

function game_load()
  ui:clear()
  menu = hub

  menu:load()
end

function game_update(dt)
  menu:update(dt)
end

function game_draw()
  menu:draw()
end

function change_menu(m)
  menu = m
  ui:clear()
  menu:load()
end
