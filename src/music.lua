local music = {}

function music.new(tracks)
  local m = {}

  m._tracks = tracks
  m._current = 1

  m.nextTrack = music.nextTrack
  m.play = music.play
  m.update = music.update

  m:play()

  return m
end

function music:nextTrack()
  self._current = self._current + 1
  if self._current > #self._tracks then
    self._current = 1
  end
end

function music:restart()
  self._current = 1
end

function music:update(dt)
  if not self._source:isPlaying() then
    self:play()
  end
end

function music:play(index)
  local i = index or self._current
  if self._source then
    self._source:stop()
  end
  self._source = love.audio.newSource(self._tracks[i],"stream")
  self._source:play()
end

return music
