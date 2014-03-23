local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 4,20 )
door.nearby = function()
  if global_platform.player.numKeys == 4 or debugmode then
    global_platform = platforms.hub3
    global_platform.player.numKeys = 0
    music:nextTrack()
    global_narrative = narrationlib.new({
      "ap·a·thy","lack of interest in or concern for things","that others find moving or exciting."})
  end
end
table.insert(obj,door)

local drumstick = objectsdata.makeDefaultObject( "drumstick", "Drumstick", 0 )
drumstick:addToMap( "poop", 17, 28 )
table.insert(obj, drumstick)

local cake = objectsdata.makeDefaultObject( "cake", "cake", 1 )
cake:addToMap( "poop", 28, 22 )
table.insert(obj, cake )

local gumball = objectsdata.makeDefaultObject( "gumball", "Gumball", 2 )
gumball:addToMap( "poop", 11, 20 )
table.insert(obj, gumball)

local burger = objectsdata.makeDefaultObject( "burger", "Burger", 3 )
burger:addToMap( "poop", 5, 12 )
table.insert(obj, burger)

return obj
