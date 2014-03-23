local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 25, 10 )
door.nearby = function()
  global_platform = platforms.level4
end
table.insert(obj,door)

return obj
