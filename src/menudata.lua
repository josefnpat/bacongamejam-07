menuobj = {}

menuobj.group = "main"

menuobj.title = "ADRIAN AND THE FRIDGE"

menuobj.actions = {}

temp = {}
temp.value = "New Game"
temp.group = {"main"}
function temp:func_select(menu,key)
  GS.switch(states.game)
end
temp.print_desc = 
  "\n\nHelp Adrian avoid her depression by feeding her fridge.\n\n"..
  "Controls:\n"..
  "Arrow keys: move\n"..
  "Space: jump\n"..
  "Bacon Game Jam 7"
table.insert(menuobj.actions,temp)

temp = {}
temp.value = "Credits"
temp.group = {"main"}
temp.print_desc = 
  "\n\nProject Lead & Developer:\nSeppi (@josefnpat) \nMissingSentinelSoftware.com\n\n"..
  "Developer:\nWes Paugh (@wespaugh)\n\n"..
  "Visual Artist and Writer:\nSara (@DangeLass)\n\n"..
  "Pixel Artist & Mapper:\nBlarget (@blarget2)\n\n"
table.insert(menuobj.actions,temp)

temp = {}
temp.value = "Quit"
temp.group = {"main"}
function temp:func_select(menu,key)
  love.event.quit()
end
table.insert(menuobj.actions,temp)

return menuobj
