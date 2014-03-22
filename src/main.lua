sti = require "sti"
HC = require 'HardonCollider'
platformlib = require "platform"
playerlib = require "player"

function love.load()
  global_platform = platformlib.new("assets/maps/level1")
end

function love.update(dt)
  global_platform:update(dt)
end

function love.draw()
  love.graphics.scale(4,4)
  local x,y = global_platform.player.hc_obj:center()
  local w = love.graphics.getWidth()/2/4
  local h = love.graphics.getHeight()/2/4
  
  love.graphics.translate(w-x,h-y)
  global_platform:draw()
end
