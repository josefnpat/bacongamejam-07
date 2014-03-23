local sfx = {}

sfx.data = {}

for _,v in pairs({"jump","land","ceiling","action","select"}) do
  sfx.data[v] = love.audio.newSource("assets/sfx/"..v..".wav","static")
end

function sfx.play(asset)
  asset:stop()
  asset:play()
end

return sfx
