local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 24,16 )
door.nearby = function()
  if global_platform.player.numKeys == 4 or debugmode then
    global_platform = platforms.hub4
    global_platform.player.numKeys = 0
    music:nextTrack()
    global_narrative = narrationlib.new({
      "anx·i·e·ty","distress or uneasiness of mind caused by fear of danger or misfortune."})

  end
end
table.insert(obj,door)

local drumstick = objectsdata.makeDefaultObject( "drumstick", "Drumstick", 0 )
drumstick:addToMap( "poop", 8, 25 )
table.insert(obj, drumstick)

local cake = objectsdata.makeDefaultObject( "cake", "cake", 1 )
cake:addToMap( "poop", 24, 25 )
table.insert(obj, cake )

local gumball = objectsdata.makeDefaultObject( "gumball", "Gumball", 2 )
gumball:addToMap( "poop", 15, 21 )
table.insert(obj, gumball)

local burger = objectsdata.makeDefaultObject( "burger", "Burger", 3 )
burger:addToMap( "poop", 18, 21 )
table.insert(obj, burger)

return obj
