local dialog_frame = require("dialog_frame")

local adrian_frame = function( text, audio, audio_duration, right_speaker_img, right_speaker_name )
  local aud_duration = audio_duration
  if aud_duration == nil then aud_duration = 4
  end

  local frame = dialog_frame.new( text, "adrian.png", right_speaker_img, "Adrian", right_speaker_name, audio, aud_duration, true )
  return frame

end

dialog_frame.make_dialog_1 = function()
  local conv = {}

  table.insert( conv, adrian_frame("God, this hurts...", "laugh_satan_1.wav", 4) )
  table.insert( conv, adrian_frame("So empty...") )
  table.insert( conv, dialog_frame.new( "Hey! Get your filthy hands off me!", "adrian.png", "crusty.png", "Adrian", "Crusty", "laugh_satan_1.wav", 4, false ) )	

  return conv
end

return dialog_frame
