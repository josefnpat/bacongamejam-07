local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 11,5 )
door.nearby = function()

  if global_platform.player.numKeys == 4 then
    global_platform = platforms.hub5
    global_platform.player.numKeys = 0
    music:nextTrack()
  end
end
table.insert(obj,door)

return obj
