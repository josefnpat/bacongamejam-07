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

od.makeHubItems = function(map)
  return require(map.."obj")
end

return od
