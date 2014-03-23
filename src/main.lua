lovesplash = require "splash/lovesplash"
msssplash = require "splash/msssplash"

sti = require "sti"
HC = require 'HardonCollider'
platformlib = require "platform"
playerlib = require "player"
narrationlib = require "narration"
dialoguelib = require "dialog"
menulib = require "menu/menu"

GS = require "gamestate"

states = {}
states.splash = require "state_splash"
states.menu = require "state_menu"
states.game = require "state_game"

function love.load()
  GS.registerEvents()
  GS.switch(states.splash)
end
