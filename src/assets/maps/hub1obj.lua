local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 12, 10 )
door.nearby = function()
  global_dialogue = dialoguelib.new(
    {
      dialog_frame.new(
        "Hello", -- text
        "adrian.png", -- left image
        nil, -- right image
        "Adrian", -- left name
        nil, -- right name
        nil, -- audio file
        4, -- length
        nil -- false for right speaker
      )
    }
  )
  global_platform = platforms.level1
end
table.insert(obj,door)

return obj
