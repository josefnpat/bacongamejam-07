local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 27, 25 )
door.nearby = function()
  if global_platform.player.numKeys == 4 then
    global_platform = platforms.hub2
    global_platform.player.numKeys = 0
    music:nextTrack()
  end
end
table.insert(obj,door)

return obj
