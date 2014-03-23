local od = {}

od.makeItemQuad = function( index )
  local itemSize = 16
  local itemsPerRow = 16

  i = index % itemsPerRow
  j = math.floor( index / itemsPerRow )
  return love.graphics.newQuad(i*itemSize,j*itemSize,itemSize,itemSize,256,256)
end

od.makeDefaultObject = function( objName, dispName, imgIndex )

  local ob = {}

  ob.name = objName
  ob.displayName = dispName
  ob.nearbyString = "Maybe I could use this "..dispName
  ob.inInventory = false


  local imageIndex = 1

  if imgIndex ~= nil then imageIndex = imgIndex
  end

  ob.image = od.makeItemQuad( imageIndex )

  ob.addToMap = function( self, mapName, xCoord, yCoord )
    self.location = {
      map = mapName,
      x = xCoord,
      y = yCoord
    }
  end


  ob.removeFromMap = function( self )
    self.location = nil
  end

  ob.mapPosition = function( self )
    local tileSize = 16
    return self.location.x * tileSize, self.location.y * tileSize
  end

  ob.nearby = function(self)
    self:addInventory()
    self:removeFromMap()
  end

  ob.addInventory = function(self)
    self.inInventory = true
  end

  ob.removeInventory = function(self)
    self.inInventory = false
  end

  ob.observe = function(self)
    if self.inInventory() then
      print( self.nearbyString )
    else
      print("HAVE SOME DIALOG")
    end
  end

  ob.combine = function(obj1, obj2)
    print( "Why did I think I could combine this? STUPID STUPID STUPID" )
  end

  return ob
end

od.makeHubItems = function( )
  local objects = {
  }

  local stick = od.makeDefaultObject( "stick", "Stick" )
  stick.combine = function(obj1, obj2)
    if obj1 == od.stick and obj2 == od.magnet then
      obj1:removeInventory()
      obj2:removeInventory()
      od.stickmagnet:addInventory()
    end
  end
  stick:addToMap( "hub1", 16, 10 )
  table.insert(objects, stick)

  for i=1,4,1 do
    local door = od.makeDefaultObject( "door_"..i, "Door" )

    door.nearby = function(self)
    end

    door.use = function(self)
      print("Using the door")
    end
    door:addToMap( "hub1", 16 + (3*i), 10 )
    table.insert( objects, door )
  end

  return objects
end

--[[
od.stick = {
  location = {
    map = "hub1",
    x = 5,
    y = 5
  },
  name = "Stick",
  nearby = function(self) 
    self:addInventory()
    self.location = nil
  end,
  observe = function(self)
    if od.magnet:inInventory() then
      print("Maybe I should use this with a manget")
    else
      --dialouge( {} )
      print("Have a dialouge")
    end
  end,
  combine = function(obj1,obj2)
  end
}
]]--

od.magnet = {
  location = {
    map = "hub1",
    x = 10, y = 5,
  },
  name = "Magnet",
  nearby = function(self)
    self:addInventory()
  end,
  observe = function(self)
    print("have another dialouge")
  end
}

od.stickmagnet = {
  name = "Stick & Magnet",
  observer = function(self)
    print("another dialouge")
  end
}

return od
