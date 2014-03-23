local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 4,20 )
door.nearby = function()
  global_platform = platforms.hub3
  music:nextTrack()
end
table.insert(obj,door)

return obj
