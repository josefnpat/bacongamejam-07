local over = {}

function over:draw()
  love.graphics.printf("YOU ARE DEAD\nTIME:"..math.floor(start),0,300,800,"center")
end

return over
