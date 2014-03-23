local obj = {}

local door = objectsdata.makeDefaultObject( "door", "Door" )
door:addToMap( "dicktitties", 12, 10 )
door.nearby = function()
  global_dialogue = dialoguelib.new({
      dialog_frame.new(
        "So tired. Gotta keep working. Maybe some food will help.", -- text
        "adrian.png", -- left image
        nil, -- right image
        "Adrian", -- left name
        nil, -- right name
        nil, -- audio file
        4, -- length
        true -- false for right speaker
      ),
      dialog_frame.new(
        "Hey, you think it's ok to just walk around and open\npeople up? Why don't you get me some food for a\nchange!", -- text
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
    global_platform = platforms.level1
  end
end
table.insert(obj,door)

return obj
