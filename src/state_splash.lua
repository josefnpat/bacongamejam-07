local splash = {}

function splash:draw()
  if not lovesplash.done() then
    lovesplash.draw()
  else
    if not msssplash.done() then
      msssplash.draw()
    end
  end
end

function splash:update(dt)
  if not lovesplash.done() then
    lovesplash.update(dt)
  else
    if not msssplash.done() then
      msssplash.update(dt)
    else
      love.graphics.setColor(255,255,255) -- SEPPI, YOUR LIBRARY SUCKS
      GS.switch(states.menu)
    end
  end
end

function splash:keypressed()
  if not lovesplash.done() then
    lovesplash.stop()
  else
    if not msssplash.done() then
      msssplash.stop(dt)
    end
  end
end

function splash:mousepressed()
  splash:keypressed()
end

function splash:joystickpressed()
  splash:keypressed()
end

return splash
