narlib = require "narration"

n = narlib.new(
  { "Demand to see life's manager!",
    "Make life rue the day it thought it could give Cave Johnson lemons!",
    "Do you know who I am?\nI'm the man whose gonna burn your house down - with the lemons!"},
  1,4)

debugmode = true

function love.update(dt)
  n:update(dt)
end

function love.draw()
  love.graphics.circle("line",400,300,64)
  n:draw()
end
