local menu = {}

function menu:init()
  menu.lib = menulib.new("menudata")
end

function menu:update(dt)
  menu.lib:update(dt)
end

function menu:draw()
  menu.lib:draw()
end

function menu:keypressed(key)
  menu.lib:keypressed(key)
end

function menu:mousepressed(x,y,button)
  menu.lib:mousepressed(x,y,button)
end

return menu
