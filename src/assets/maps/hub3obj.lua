local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 22, 10 )
door.nearby = function()
  global_platform = platforms.level3
end
table.insert(obj,door)

return obj
