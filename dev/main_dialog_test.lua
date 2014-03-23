local conversation_factory = require( "conversation_maker" )

local dialog = require("dialog")
local dialog_1 = conversation_factory.make_dialog_1()

the_dialog = dialog.new( dialog_1 )

function love.draw()
  the_dialog:draw(100, 400, 600, 160)
end


function love.update(dt)
  the_dialog:update(dt)
end
