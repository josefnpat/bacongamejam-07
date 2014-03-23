local conversation_factory = require( "conversation_maker" )

local dialog = require("dialog")
local dialog_1 = conversation_factory.make_dialog_1()

the_dialog = dialog.new( dialog_1 )
print("The dialog: ")
print(the_dialog)

function love.draw()
  if the_dialog ~= nil then
    the_dialog:draw(100, 400, 600, 160)
  end
end


function love.update(dt)
  if the_dialog ~= nil then

    if the_dialog:done() == false then
      the_dialog.update(the_dialog, dt)
    else
      the_dialog = nil
    end
  end 
end
