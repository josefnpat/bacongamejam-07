local platform = {}
objects = require "objects"
objectsdata = require "objectsdata"

platstart = {
  level1 = {x=9,y=29},
  level2 = {x=3,y=27},
  level3 = {x=16,y=27},
  level4 = {x=2,y=27},
  level5 = {x=16,y=27},
  hub1 = {x=6,y=9},
  hub2 = {x=6,y=9},
  hub3 = {x=6,y=9},
  hub4 = {x=6,y=9},
  hub5 = {x=6,y=9}
}

function platform.new(map)
  local p = {}

  p.map = sti.new(map)

  p.map:setDrawRange(0,0,
    love.graphics.getWidth(),
    love.graphics.getHeight())

  p.map_col = p.map:getCollisionMap("collision")
  p.hc_col = HC(100,
    platform.on_collision,
    platform.off_collision)

  local ps
  for i,v in pairs(platstart) do
    if "assets/maps/"..i == map then
      ps = v
    end
  end
 
  p.player = playerlib.new(p.hc_col,(ps.x-1)*16,(ps.y-1)*16)

  p.tiles = {}
  for y,yv in pairs(p.map_col.data) do
    for x,xv in pairs(yv) do
      if xv == 1 then
        local ctile = p.hc_col:addRectangle((x-1)*16,(y-1)*16,16,16)
        ctile.type = "tile"
        p.hc_col:addToGroup("tiles", ctile)
        p.hc_col:setPassive(ctile)
        table.insert(p.tiles,ctile)
      end
    end
  end

  p.update = platform.update
  p.draw = platform.draw
  p.objects = objects.new(map)

  return p

end

function platform:update(dt)
  self.map:update(dt)
  self.player:update(dt)
  self.hc_col:update(dt)
  self.objects:update(dt)
end

function platform:draw()
  love.graphics.setColor(255,255,255)
  self.map:draw()
  self.player:draw()

  local x, y = global_platform.player:center()
  self.objects:draw(x-42, y+48, 100, 100)

  if debugmode then
    for y,yv in pairs(self.map_col.data) do
      for x,xv in pairs(yv) do
        if xv == 1 then
          love.graphics.rectangle("line",(x-1)*16,(y-1)*16,16,16)
        end
      end
    end
  end

end

function platform.on_collision(dt,shape_a,shape_b,mtv_x,mtv_y)
  mtv_x = math.abs(mtv_x) < 0.000001 and 0 or mtv_x
  mtv_y = math.abs(mtv_y) < 0.000001 and 0 or mtv_y
  --print(string.format("Colliding. mtv = (%s,%s)",mtv_x, mtv_y))
  -- sort out which one our hero shape is
  local hero_shape
  local hero = global_platform.player.hc_obj
  if shape_a == hero and shape_b.type == "tile" then
    hero_shape = shape_a
  elseif shape_b == hero and shape_a.type == "tile" then
    hero_shape = shape_b
  else
    return
  end
  hero_shape:move(mtv_x, 0)
  hero_shape:move(0, mtv_y)
  if mtv_y < 0 and mtv_x == 0 then
    if global_platform.player.jump then
      global_platform.player.jump = nil
      if not sfx.data.land:isPlaying() then
        sfx.play(sfx.data.land)
      end
    end
  end
  if mtv_y > 0 and 
    global_platform.player.jump and
    global_platform.player.jump > 0 then
    global_platform.player.jump = 0
    sfx.play(sfx.data.ceiling)
  end
end

function platform.off_collision(dt, shape_a, shape_b)
  --print("Stopped colliding")
  if global_platform.player.jump == nil then
    global_platform.player.jump = 0
    global_platform.player.falljump = 0.1
  end
end

return platform
