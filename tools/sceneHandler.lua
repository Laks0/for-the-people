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
  
end

function sceneDraw(s)

end
