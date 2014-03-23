local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 11,5 )
door.nearby = function()
  if global_platform.player.numKeys == 4 or debugmode then
    global_platform = platforms.hub5
    global_platform.player.numKeys = 0
    music:nextTrack()
    global_narrative = narrationlib.new({
      "su·i·cide","the intentional taking of one's own life."})
  end
end
table.insert(obj,door)

local drumstick = objectsdata.makeDefaultObject( "drumstick", "Drumstick", 0 )
drumstick:addToMap( "poop", 23, 31 )
table.insert(obj, drumstick)

local cake = objectsdata.makeDefaultObject( "cake", "cake", 1 )
cake:addToMap( "poop", 24, 24 )
table.insert(obj, cake )

local gumball = objectsdata.makeDefaultObject( "gumball", "Gumball", 2 )
gumball:addToMap( "poop", 8, 16 )
table.insert(obj, gumball)

local burger = objectsdata.makeDefaultObject( "burger", "Burger", 3 )
burger:addToMap( "poop", 4, 12 )
table.insert(obj, burger)

return obj
