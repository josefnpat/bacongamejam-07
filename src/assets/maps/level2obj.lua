local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 4,20 )
door.nearby = function()
  if global_platform.player.numKeys == 4 or debugmode then
    global_platform = platforms.hub3
    global_platform.player.numKeys = 0
    music:nextTrack()
  end
  global_narrative = narrationlib.new({
    "ap·a·thy","lack of interest in or concern for things","that others find moving or exciting."})

end
table.insert(obj,door)

return obj
