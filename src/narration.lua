local nar = {}

function nar.new(text,fade,wait)
  local n = {}
  n.text = text
  n.dt = 0
  n.fade = fade or 1
  n.wait = wait or 4
  n.draw = nar.draw
  n.update = nar.update
  n.newkeypress = false
  n.done = nar.done
  return n
end

function nar:draw()
  love.graphics.setColor(0,0,0,self.fade*255)
  love.graphics.rectangle("fill",0,0,
    love.graphics.getWidth(),love.graphics.getHeight())
  love.graphics.setColor(255,255,255,self.fade*255)
  local th = love.graphics.getFont()
  local offset = (love.graphics.getHeight() - #self.text*th:getHeight() ) /2
  for i,v in pairs(self.text) do
    love.graphics.printf(v,0,th:getHeight()*(i-1)+offset,
love.graphics.getWidth(),"center")
  end
  love.graphics.setColor(255,255,255)
end

function nar:done()
  if self.fade == 0 then
    return true
  end
end

function nar:update(dt)
  self.dt = self.dt + dt
  self.wait = self.wait - dt
  if self.wait < 0 then
    self.fade = self.fade - dt
    if self.fade < 0  then
      self.fade = 0
    end
  end
  local down = love.keyboard.isDown("down") or love.keyboard.isDown("return")
  if not down then --  HACK HACK HACK
    self.newkeypress = true
  end
  if down and self.newkeypress then
    self.wait = 0
  end
end

return nar
