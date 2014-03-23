local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 28, 10 )
door.nearby = function()
  global_platform = platforms.level5
end
table.insert(obj,door)

return obj
