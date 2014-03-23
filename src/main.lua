sti = require "sti"
HC = require 'HardonCollider'
platformlib = require "platform"
playerlib = require "player"
narrationlib = require "narration"

platforms = {}

function love.load()
  for i = 1,5 do
    platforms["hub"..i] = platformlib.new("assets/maps/hub"..i)
    platforms["level"..i] = platformlib.new("assets/maps/level"..i)
  end
  global_platform = platforms.hub1
  nar = narrationlib.new({
    "Cannon to right of them,",
    "Cannon to left of them,",
    "Cannon in front of them",
    "Volley'd and thunder'd;",
    "Storm'd at with shot and shell,",
    "Boldly they rode and well,",
    "Into the jaws of Death,",
    "Into the mouth of Hell",
    "Rode the six hundred."})
end

function love.update(dt)
  global_platform:update(dt)
  nar:update(dt)
end

function love.draw()
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
  nar:draw()
end

function love.keypressed(key)
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
