menuobj = {}

menuobj.group = "main"

menuobj.title = "5TARVING ARTIST"

menuobj.actions = {}

temp = {}
temp.value = "New Game"
temp.group = {"main"}
function temp:func_select(menu,key)
  GS.switch(states.game)
end
temp.print_desc = 
  "Controls:\n\n"..
  "Arrow keys: move\n"..
  "Space: jump\n"..
  "Enter: use item\n\n"..
  "Use your mouse to interact with your inventory.\n\n"..
  "Bacon Game Jam 7"
table.insert(menuobj.actions,temp)

temp = {}
temp.value = "Credits"
temp.group = {"main"}
temp.print_desc = 
  "Project Lead & Developer:\nSeppi (@josefnpat) \nMissingSentinelSoftware.com\n\n"..
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
