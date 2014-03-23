local player = {}

function player.new(hc,x,y)
  local p = {}

  p.img = love.graphics.newImage("assets/player.png")
  p.img:setFilter("nearest","nearest")
  p.walkquads = {}
  for i = 0,9 do
    table.insert(p.walkquads,love.graphics.newQuad(16*i,0,16,32,256,256))
  end
  p.stand = love.graphics.newQuad(0,0,16,32,256,256)
  p.jdo = love.graphics.newQuad(0,32,16,32,256,256)
  p.jup = love.graphics.newQuad(16,32,16,32,256,256)

  p.hc = hc
  p.hc_obj = hc:addRectangle(x,y,16,32)
  p.gravity = 100

  p.draw = player.draw
  p.update = player.update
  p.center = player.center
  p.jump = 0
  p.numKeys = 0
  p.dir = 1
  p.walkdt = 0

  return p
end

function player:draw()
  local x,y = self:center()
  local frame = math.floor(self.walkdt)%10+1
  local q = self.walking and self.walkquads[frame] or self.stand
  if self.jump then
    if self.jump > 0 then
      q = self.jdo
    elseif self.jump < 0 then
      q = self.jup
    end
  end
  love.graphics.draw(self.img,q,x,y,0,self.dir,1,8,16)
end

function player:center()
  return self.hc_obj:center()
end

function player:update(dt)

  self.walkdt = self.walkdt + dt*10

  self.walking = false
  local xvect,yvect = 0,0
  if love.keyboard.isDown("left") then
    xvect = xvect - 1
    self.dir = -1
    self.walking = true
  end
  if love.keyboard.isDown("right") then
    xvect = xvect + 1
    self.dir = 1
    self.walking = true
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
