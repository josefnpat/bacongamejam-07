local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 22, 10 )
door.nearby = function()
  global_dialogue = dialoguelib.new({
      dialog_frame.new(
        "My face feels like ... bark. What? Am I still asleep?", -- text
        "adrian.png", -- left image
        nil, -- right image
        "Adrian", -- left name
        nil, -- right name
        nil, -- audio file
        4, -- length
        true -- false for right speaker
      ),
      dialog_frame.new(
        "Hey, you should take a nap buddy. Ha, just kidding.\nHow about a drink?", -- text
        "adrian.png", -- left image
        "crusty.png", -- right image
        "Adrian", -- left name
        "Fridge", -- right name
        nil, -- audio file
        4, -- length
        false -- false for right speaker
      )
  })
  global_dialogue_callback = function()
    global_platform = platforms.level3
  end
end
table.insert(obj,door)

return obj
