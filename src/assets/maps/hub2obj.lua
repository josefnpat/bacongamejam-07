local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 19, 10 )
door.nearby = function()
  global_dialogue = dialoguelib.new({
      dialog_frame.new(
        "I fell alseep? I have so much to get done. I can't spend my time\nhaving dreams about getting a fridge food.", -- text
        "adrian.png", -- left image
        nil, -- right image
        "Adrian", -- left name
        nil, -- right name
        nil, -- audio file
        4, -- length
        true -- false for right speaker
      ),
      dialog_frame.new(
        "Hey! ... Hey you! Hey!", -- text
        "adrian.png", -- left image
        "crusty.png", -- right image
        "Adrian", -- left name
        "Fridge", -- right name
        nil, -- audio file
        4, -- length
        false -- false for right speaker
      ),
      dialog_frame.new(
        "Ignoring it .. Ignoring it .. Ignoring it ..", -- text
        "adrian.png", -- left image
        "crusty.png", -- right image
        "Adrian", -- left name
        "Fridge", -- right name
        nil, -- audio file
        4, -- length
        true -- false for right speaker
      )
  })
  global_dialogue_callback = function()
    global_platform = platforms.level2
  end
end
table.insert(obj,door)

return obj
