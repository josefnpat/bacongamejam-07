local objects = {}
objects.data = require "objectsdata"
-- objects.image = love.graphics.newImage("assets/maps/items.png")

objects.objectSet = {}

function objects.new( )
  local objs = {}
  objs.objectSet = objects.data.makeHubItems()

  objs.image = objects.image
  objs.draw = objects.draw
  objs.update = objects.update

  return objs
end

objects.draw = function(self)
  for i,v in pairs(self.objectSet) do

    local xPos = 2
    local yPos = 2
    if v.inInventory then
    else
      xPos = ( v.location.x - 1 ) * 16
      yPos = ( v.location.y - 1 ) * 16 
    end

    love.graphics.draw( objects.image, v.image, xPos, yPos )
  end
end

objects.update = function(self, dt)
  x, y = global_platform.player:center()

  local nearThreshhold = 20

  local dist
  for i,v in pairs(self.objectSet) do

      if v.inInventory == false then
        local vx, vy = v:mapPosition()
        dist = ((vx-x)^2+(vy-y)^2)^0.5

        if dist <= nearThreshhold then
          v:nearby()
        end
      end
  end
end

return objects
