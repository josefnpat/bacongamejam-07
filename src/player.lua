local player = {}

function player.new(hc)
  local p = {}

  p.hc = hc
  p.hc_obj = hc:addRectangle(100,100,16,32)
  p.gravity = 100

  p.draw = player.draw
  p.update = player.update
  p.center = player.center
  p.jump = 0
  return p
end

function player:draw()
  self.hc_obj:draw('fill')
end

function player:center()
  return self.hc_obj:center()
end

function player:update(dt)

  local xvect,yvect = 0,0
  if love.keyboard.isDown("left") then
    xvect = xvect - 1
  end
  if love.keyboard.isDown("right") then
    xvect = xvect + 1
  end
  if love.keyboard.isDown(" ") and
    (not self.jump or self.falljump) then
    self.jump = 0.5
    self.falljump = nil
    sfx.play(sfx.data.jump)
  end

  if self.falljump then
    self.falljump = self.falljump - dt
    if self.falljump < 0 then
      self.falljump = nil
    end
  end

  if self.jump then
    self.jump = self.jump - dt
    self.hc_obj:move(0,-1000*dt*self.jump)
    self.hc_obj:move(0,self.gravity*dt)
  end

  local newx = dt*xvect*100
  self.hc_obj:move(newx,0)

end

return player
