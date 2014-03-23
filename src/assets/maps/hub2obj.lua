local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 19, 10 )
door.nearby = function()
  global_platform = platforms.level2
end
table.insert(obj,door)

return obj
