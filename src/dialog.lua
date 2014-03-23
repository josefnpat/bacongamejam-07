dialog_frame = require("dialog_frame")

local dialog = {}

function dialog.new( conversation, index  )
  local dlog = {}
  dlog.isDone = false

  dlog.done = function( self ) 
    -- print(self)
    return self.isDone
  end

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
  dlog.skip = dialog.skip

  return dlog
end

function dialog:draw(x, y, w, h)
  if self.current_frame ~= nil and self:done() == false then
    self.current_frame:draw(x, y, w, h)
  end
end

function dialog:skip()
  self.conversation_idx = self.conversation_idx + 1
  
  if self.conversation_idx > table.getn(self.full_conversation) then
    self.isDone = true
  else
    self.current_frame = self.full_conversation[self.conversation_idx]
  end
end

function dialog:update(dt)
  if self:done() then
  else
    -- if current frame is out of time, move to next frame
    if self.current_frame.frame_time <= 0 then
      self:skip()
    else
      self.current_frame:update(dt)
    end
  end
end

return dialog
