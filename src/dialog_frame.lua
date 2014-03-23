local dialog_frame = { }

local image_dimension = 256

function dialog_frame.portrait_path( portrait_name )
  return "assets/portraits/"..portrait_name
end

function dialog_frame.vo_path( audio_name )
  return "assets/voice/"..audio_name
end

local some_texts = {
  "This was a triumph",
  "I'm making a note here:\"Huge success!\"",
  "It's hard to overstate my satisfaction",
  "We do what me must because we can",
  "For the good of all of us",
  "Except the ones who are dead"
}

local debug_frame = false

function dialog_frame.new( txt, l_img, r_img, l_name, r_name, aud, frame_duration, is_left_speaking )
  local f = {}

  if debug_frame then
    f.text = some_texts[love.math.random(5)]
    f.left_image = love.graphics.newImage( dialog_frame.portrait_path("corgi.png") )
    f.right_image = love.graphics.newImage(dialog_frame.portrait_path("barkleysircharles.png") )
    f.left_name = "Indignant Corgi"
    f.right_name = "Barkley"
    f.audio = love.audio.newSource( dialog_frame.vo_path( "laugh_satan_1.wav" ) )
    f.frame_time = 4
    f.is_left_active = true
  end

  if love.math.random(2) == 1 then
    f.is_left_active = false
  end

  if txt ~= nil then f.text = txt
  end

  if l_img ~= nil then f.left_image = love.graphics.newImage( dialog_frame.portrait_path(l_img) )
  end
  if r_img ~= nil then f.right_image = love.graphics.newImage( dialog_frame.portrait_path(r_img) )
  end
  if l_name ~= nil then f.left_name = l_name
  end
  if r_name ~= nil then f.right_name = r_name
  end
  if aud ~= nil then f.audio = love.audio.newSource(dialog_frame.vo_path(aud) )
  end
  if frame_duration ~= nil then f.frame_time = frame_duration
  end
  frame_duration = string.len(txt)*0.071428571428571 -- HACK HACK HACK HACK
  if is_left_speaking ~= nil then f.is_left_active = is_left_speaking
  end

  local frame_scale_x = 1
  local frame_scale_y = 1

  local target_dimension = image_dimension

  local active_speaker_scale = 0.01

  if f.left_image ~= nil then
    width, height = f.left_image:getDimensions()
    f.l_img_scale_x = target_dimension / width
    f.l_img_scale_y = target_dimension / height

    if f.is_left_active then
      f.l_img_scale_x = f.l_img_scale_x + active_speaker_scale
      f.l_img_scale_y = f.l_img_scale_y + active_speaker_scale
    end
  end

  if f.right_image ~= nil then
    width, height = f.right_image:getDimensions()
    f.r_img_scale_x = target_dimension / width
    f.r_img_scale_y = target_dimension / height

    if f.is_left_active == false then
      f.r_img_scale_x = f.r_img_scale_x + active_speaker_scale
      f.r_img_scale_y = f.r_img_scale_y + active_speaker_scale
    end

    -- reverse the right image
    f.r_img_scale_x = f.r_img_scale_x * -1
  end


  f.draw = dialog_frame.draw
  f.update = dialog_frame.update

  return f

end

function dialog_frame:draw(x, y, w, h)
  love.graphics.setColor(255,255,255)
  -- a flag that determines whether the text box squishes to one side of the screen or another
  -- set flag if there are two speakers
  local align_text_box = self.left_image ~= nil and self.right_image ~= nil

  local box_width = w
  if align_text_box then
    box_width = w * .8
  end

  local box_start = x
  if align_text_box and self.left_image ~= nil then
    box_start = box_start + w - box_width
  end


  love.graphics.setColor( 255, 255, 255, 255 )

  local image_y = y - 24

  if self.left_image ~= nil then

    if self.is_left_active == false then 
      love.graphics.setColor( 128, 128, 128, 255 )
    end
    love.graphics.draw( self.left_image, x, image_y, 0, self.l_img_scale_x, self.l_img_scale_y, 0, image_dimension / self.l_img_scale_y )
  end

  love.graphics.setColor( 255, 255, 255, 255 )

  if self.right_image then

    if self.is_left_active then
      love.graphics.setColor( 128, 128, 128, 255 )
    end

    love.graphics.draw( self.right_image, x + w, image_y, 0, self.r_img_scale_x, self.r_img_scale_y, 0, image_dimension / self.r_img_scale_y )
  end



  love.graphics.setColor( 255, 255, 255, 64 )
  love.graphics.rectangle( "fill", box_start, y, box_width, h )

  love.graphics.setColor( 255, 255, 255, 128 )
  love.graphics.rectangle( "fill", box_start + 4, y + 4, box_width - 8, h - 8 )

  love.graphics.setColor( 0, 0, 0, 255 )

  love.graphics.print( self.text, box_start + 12, y + 12 )

  love.graphics.setColor( 255, 255, 255, 255 )
  local name_y = y - 12

  if self.left_name ~= nil then
    love.graphics.print( self.left_name, x + 2, name_y )
  end

  if self.right_name ~= nil then
    love.graphics.print( self.right_name, x + w - image_dimension + 2, name_y )
  end

  love.graphics.setColor( 255, 255, 255, 255 )

end

function dialog_frame:update(dt)
  
  -- TODO:OH MY GOD WHAT AM I DOING
  -- if audio exists in frame, play audio and remove audio from frame so it doesn't play again
  if self.audio then
    if not self.audio:isPlaying() then
      self.audio:play()
    else
      self.audio = nil
    end
  end

  self.frame_time = self.frame_time - dt

end

return dialog_frame
