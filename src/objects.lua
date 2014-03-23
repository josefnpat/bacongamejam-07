local objects = {}
objects.data = require "objectsdata"
objects.image = love.graphics.newImage("assets/maps/items.png")
objects.image:setFilter("nearest","nearest")

objects.objectSet = {}

function objects.new(map)
  local objs = {}
  objs.objectSet = objects.data.makeHubItems(map)

  objs.image = objects.image
  objs.draw = objects.draw
  objs.update = objects.update

  -- to be inefficiently updated every frame with the subset of all items that exist in player inventory
  objs.invItems = {}

  return objs
end

objects.draw = function(self, invX, invY, invW, invH)
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

  local boxSize = 20

  for i=0,5,1 do
    local invSlotX = i*(boxSize+4) +invX 
    love.graphics.setColor( 32, 32, 32, 255 )
    love.graphics.rectangle("fill", invSlotX, invY, boxSize, boxSize)
    love.graphics.setColor( 64, 64, 64, 255 )
    love.graphics.rectangle("fill", invSlotX+2, invY+2, boxSize-4, boxSize-4)
    
    love.graphics.setColor( 255, 255, 255, 255 )

    -- some jitter to the inventory labels to make the numbers look stressful and atmospheric
    -- totally not intended to cover up a horrible design decision
    local jitterX = 0
    local jitterY = 0

    local itemIndex = i+1
    if itemIndex <= #(self.invItems) then
      local item = self.invItems[itemIndex]
      love.graphics.draw( objects.image, item.image, invSlotX+2, invY+2 )
    else
      jitterX = love.math.random()*1.5
      jitterY = love.math.random()*1.5
    end

    love.graphics.setColor(255,255,255,255)

    love.graphics.print(i+1, invSlotX + jitterX, invY + jitterY, 0, .5, .5)
  end

  love.graphics.setColor( 255, 255, 255, 255 )

end

objects.update = function(self, dt)
  x, y = global_platform.player:center()

  local nearThreshhold = 20

  self.invItems = {}

  local dist
  for i,v in pairs(self.objectSet) do

      if v.inInventory == false then
        local vx, vy = v:mapPosition()
        dist = ((vx-x)^2+(vy-y)^2)^0.5

        if dist <= nearThreshhold then
          v:nearby()
        end
      else
        table.insert(self.invItems, v)
      end
  end

end

return objects
