local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 17,5 )
door.nearby = function()
  if global_platform.player.numKeys == 4 or debugmode then
    -- game over!
  end
end
table.insert(obj,door)

local drumstick = objectsdata.makeDefaultObject( "drumstick", "Drumstick", 0 )
drumstick:addToMap( "poop", 30, 15 )
table.insert(obj, drumstick)

local cake = objectsdata.makeDefaultObject( "cake", "cake", 1 )
cake:addToMap( "poop", 4, 15 )
table.insert(obj, cake )

local gumball = objectsdata.makeDefaultObject( "gumball", "Gumball", 2 )
gumball:addToMap( "poop", 16, 21 )
table.insert(obj, gumball)

local burger = objectsdata.makeDefaultObject( "burger", "Burger", 3 )
burger:addToMap( "poop", 22, 5 )
table.insert(obj, burger)

return obj
