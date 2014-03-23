local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 11,5 )
door.nearby = function()
  global_platform = platforms.hub5
  music:nextTrack()
end
table.insert(obj,door)

return obj