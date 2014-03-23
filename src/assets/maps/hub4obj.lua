local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 25, 10 )
door.nearby = function()
  global_dialogue = dialoguelib.new({
    dialog_frame.new(
      "Can't sleep. Can't work ... I guess I'll talk to the fridge.", -- text
      "adrian.png", -- left image
      nil, -- right image
      "Adrian", -- left name
      nil, -- right name
      nil, -- audio file
      4, -- length
      true -- false for right speaker
    ),
    dialog_frame.new(
      "Fridge?", -- text
      "adrian.png", -- left image
      nil, -- right image
      "Adrian", -- left name
      nil, -- right name
      nil, -- audio file
      4, -- length
      true -- false for right speaker
    ),
    dialog_frame.new(
      "Human? Jackass, call me crusty. Crusty the fridge!", -- text
      "adrian.png", -- left image
      "crusty.png", -- right image
      "Adrian", -- left name
      "Crusty", -- right name
      nil, -- audio file
      4, -- length
      false -- false for right speaker
    ),
    dialog_frame.new(
      "Tell me your secrets, Crusty the fridge!", -- text
      "adrian.png", -- left image
      "crusty.png", -- right image
      "Adrian", -- left name
      "Crusty", -- right name
      nil, -- audio file
      4, -- length
      true -- false for right speaker
    ),
    dialog_frame.new(
      "Already gave you those, sweety.", -- text
      "adrian.png", -- left image
      "crusty.png", -- right image
      "Adrian", -- left name
      "Crusty", -- right name
      nil, -- audio file
      4, -- length
      false -- false for right speaker
    ),
    dialog_frame.new(
      "Alright.", -- text
      "adrian.png", -- left image
      "crusty.png", -- right image
      "Adrian", -- left name
      "Crusty", -- right name
      nil, -- audio file
      4, -- length
      true -- false for right speaker
    )
  })
  global_dialogue_callback = function()
    global_platform = platforms.level4
  end
end
table.insert(obj,door)

return obj
