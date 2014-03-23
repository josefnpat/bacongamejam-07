local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )

door:addToMap( "hub1", 27, 25 )
door.nearby = function()
  if global_platform.player.numKeys == 4 or debugmode then
    global_platform = platforms.hub2
    global_platform.player.numKeys = 0
    music:nextTrack()
  end
  global_narrative = narrationlib.new({
    "in·som·ni·a","inability to obtain sufficient sleep, especially when chronic;","difficulty in falling or staying asleep; sleeplessness."})

end
table.insert(obj,door)

local drumstick = objectsdata.makeDefaultObject( "drumstick", "Drumstick", 0 )
drumstick:addToMap( "poop", 3, 21 )
table.insert(obj, drumstick)

local cake = objectsdata.makeDefaultObject( "cake", "cake", 1 )
cake:addToMap( "poop", 8, 20 )
table.insert(obj, cake )

local gumball = objectsdata.makeDefaultObject( "gumball", "Gumball", 2 )
gumball:addToMap( "poop", 20, 20 )
table.insert(obj, gumball)

local burger = objectsdata.makeDefaultObject( "burger", "Burger", 3 )
burger:addToMap( "poop", 28, 20 )
table.insert(obj, burger)



return obj
