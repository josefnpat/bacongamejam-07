local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 27, 25 )
door.nearby = function()
  global_platform = platforms.hub2
  music:nextTrack()
end
table.insert(obj,door)

return obj
