local over = {}
asdasd = love.graphics.newImage("assets/gameover.png")

function over:draw()
  love.graphics.draw(asdasd,0,0)
  love.graphics.printf("YOU ARE DEAD\nTIME:"..math.floor(start),0,500,800,"center")
end

return over
