require "scenes/creation"
require "scenes/game"

function sceneLoad(s)
  scene = s
  if s == "creation" then
    creation_load()
  elseif s == "game" then
    game_load()
  end
end

function sceneUpdate(s,dt)
  if s == "game" then
    game_update(dt)
  end
end

function sceneDraw(s)
  if s == "creation" then
    creation_draw()
  elseif s == "game" then
    game_draw()
  end
end
