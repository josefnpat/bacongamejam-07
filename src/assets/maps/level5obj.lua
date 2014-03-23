local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 17,5 )
door.nearby = function()
  -- game over!
end
table.insert(obj,door)

return obj
