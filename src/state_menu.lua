local menu = {}

function menu:init()
  menu.lib = menulib.new("menudata")
end

function love.update(dt)
  menu.lib:update(dt)
end

function love.draw()
  menu.lib:draw()
end

function love.keypressed(key)
  menu.lib:keypressed(key)
end

function love.mousepressed(x,y,button)
  menu.lib:mousepressed(x,y,button)
end

return menu
