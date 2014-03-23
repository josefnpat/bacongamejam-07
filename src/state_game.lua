game = {}

platforms = {}

function game:init()

  for i = 1,5 do
    platforms["hub"..i] = platformlib.new("assets/maps/hub"..i)
    platforms["level"..i] = platformlib.new("assets/maps/level"..i)
  end
  global_platform = platforms.hub1
  global_narrative = narrationlib.new({
    "re·morse","deep and painful regret for wrongdoing; compunction."})
end

function game:update(dt)
  music:update(dt)
  if global_narrative then
    global_narrative:update(dt)
    if global_narrative:done() then
      global_narrative = nil
    end
  elseif global_dialogue then
    global_dialogue:update(dt)
    if global_dialogue:done() then
      global_dialogue = nil
    end
  else
    global_platform:update(dt)
  end
end

function game:draw()
  love.graphics.push()
  love.graphics.scale(4,4)
  local x,y = global_platform.player.hc_obj:center()
  local w = love.graphics.getWidth()/2/4
  local h = love.graphics.getHeight()/2/4
  love.graphics.translate(w-x,h-y)
  global_platform:draw()
  love.graphics.pop()
  if debugmode then
    local level = "UNKNOWN"
    for i,v in pairs(platforms) do
      if v==global_platform then
        level = i
      end
    end
    love.graphics.print(level,16,16)
  end
  if global_narrative then
    global_narrative:draw()
  elseif global_dialogue then
    local img_height = 256
    global_dialogue:draw(32,
      love.graphics.getHeight()-128-32,
      love.graphics.getWidth()-64,
      128)
  end
end

function game:keypressed(key)

  if global_dialogue then
    global_dialogue:skip()
  end

  if key == "`" then
    debugmode = not debugmode
  elseif debugmode and (
    key == "1" or
    key == "2" or
    key == "3" or
    key == "4" or
    key == "5" ) then
    if love.keyboard.isDown("lshift") then
      global_platform = platforms["hub"..key]
    else
      global_platform = platforms["level"..key]
    end
  end
end

function game:mousepressed()
  if global_dialogue then
    global_dialogue:skip()
  end
end

return game
