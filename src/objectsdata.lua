local od = {}

od.stick = {
  location = {
    map = "hub1",
    x = 5,
    y = 5
  },
  name = "Stick",
  nearby = function(self) 
    self:addInventory()
    self.location = nil
  end,
  observe = function(self)
    if od.magnet:inInventory() then
      print("Maybe I should use this with a manget")
    else
      --dialouge( {} )
      print("Have a dialouge")
    end
  end,
  combine = function(obj1,obj2)
    if obj1 == od.stick and obj2 == od.magnet then
      obj1:removeInventory()
      obj2:removeInventory()
      od.stickmagnet:addInventory()
    end
  end
}

od.magnet = {
  location = {
    map = "hub1",
    x = 10, y = 5,
  },
  name = "Magnet",
  nearby = function(self)
    self:addInventory()
  end,
  observe = function(self)
    print("have another dialouge")
  end
}

od.stickmagnet = {
  name = "Stick & Magnet",
  observer = function(self)
    print("another dialouge")
  end
}

return od
