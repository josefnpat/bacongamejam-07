local dialog_frame = require("dialog_frame")

local dialog = {}

function dialog.new( conversation, index  )
  local dlog = {}

  -- if no index is passed, then it's the first frame
  local idx = index
  if idx == nil then
    idx = 0
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

  local conversationFrame = conv[idx]

  if conversationFrame == nil then conversationFrame = dialog_frame.new()
  end

  dlog.full_conversation = conv
  dlog.conversation_idx = idx
  dlog.current_frame = conversationFrame


  dlog.draw = dialog.draw
  dlog.update = dialog.update

  return dlog
end

function dialog:draw(x, y, w, h)
  self.current_frame:draw(x, y, w, h)
end

function dialog:update(dt)
  if self.current_frame.frame_time <= 0 then
    self.conversation_idx = self.conversation_idx + 1

    if self.conversation_idx >= table.getn(self.full_conversation) then
      self.conversation_idx = 0
    end

    self.current_frame.frame_time = love.math.random(9) + 1
    self.current_frame = self.full_conversation[self.conversation_idx]
  else
    self.current_frame:update(dt)
  end
end

return dialog
