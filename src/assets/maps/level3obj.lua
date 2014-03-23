local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 24,16 )
door.nearby = function()

  if global_platform.player.numKeys == 4 or debugmode then
    global_platform = platforms.hub4
    global_platform.player.numKeys = 0
    music:nextTrack()
  end
end
table.insert(obj,door)

return obj
