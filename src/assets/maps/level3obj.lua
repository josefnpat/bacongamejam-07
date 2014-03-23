local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 24,16 )
door.nearby = function()
  global_platform = platforms.hub4
  music:nextTrack()
end
table.insert(obj,door)

return obj
