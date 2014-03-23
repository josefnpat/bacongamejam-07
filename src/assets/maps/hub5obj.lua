local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "hub1", 28, 10 )
door.nearby = function()
  global_dialogue = dialoguelib.new({
    dialog_frame.new(
      "Holy shit. Does this ever end? This is so fucked up. This so messed up.\nThis is so ...", -- text
      "adrian.png", -- left image
      nil,
      "Adrian", -- left name
      nil,
      nil, -- audio file
      4, -- length
      true -- false for right speaker
    ),
    dialog_frame.new(
      "Hey! Cheer up, emo! Idle hands are the devil's\nworkshop. Go get a job!", -- text
      "adrian.png", -- left image
      "crusty.png", -- right image
      "Adrian", -- left name
      "Crusty", -- right name
      nil, -- audio file
      4, -- length
      false -- false for right speaker
    ),
    dialog_frame.new(
      "Sure. Cheer up. Keep thinking. If I stop thinking I\nmight ...", -- text
      "adrian.png", -- left image
      "crusty.png", -- right image
      "Adrian", -- left name
      "Crusty", -- right name
      nil, -- audio file
      4, -- length
      false -- false for right speaker
    )
  })
  global_dialogue_callback = function()
    global_platform = platforms.level5
  end
end
table.insert(obj,door)

return obj
