local dialog_frame = require("dialog_frame")

local dialog = {}

function dialog.new( conversation, index  )
  local dlog = {}

  if conversation ~= nil then
  end

  -- if no index is passed, then it's the first frame
  local idx = index
  if idx == nil then
    idx = 1
  end

  -- if no conversation is passed, then SOME IDIOT SCRIPTER FORGOT TO PASS ONE!!1! :D
  -- OR wes is just debugging. in that case, load a bogus conversation with some awesome dogs to test stuff
  local conv = conversation
  if conversation == nil then
    conv = {}
    conv[0] = dialog_frame.new()
    conv[1] = dialog_frame.new()
    conv[2] = dialog_frame.new()
  end

  local conversation_frame = conv[idx]

  if conversation_frame == nil then 
    conversation_frame = dialog_frame.new()
  end

  dlog.full_conversation = conv
  dlog.conversation_idx = idx
  dlog.current_frame = conversation_frame


  dlog.draw = dialog.draw
  dlog.update = dialog.update

  return dlog
end

function dialog:draw(x, y, w, h)
  self.current_frame:draw(x, y, w, h)
end

function dialog:update(dt)

  -- if current frame is out of time, move to next frame
  if self.current_frame.frame_time <= 0 then


    self.conversation_idx = self.conversation_idx + 1

    if self.conversation_idx > table.getn(self.full_conversation) then
      self.conversation_idx = 1
    end

    self.current_frame.frame_time = love.math.random(9) + 1
    self.current_frame = self.full_conversation[self.conversation_idx]
  else
    self.current_frame:update(dt)
  end
end

return dialog
