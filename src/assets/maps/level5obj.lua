local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 17,5 )
door.nearby = function()
  if global_platform.player.numKeys == 4 or debugmode then

  end
end
table.insert(obj,door)

return obj
