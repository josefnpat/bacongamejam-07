lovesplash = require "splash/lovesplash"
msssplash = require "splash/msssplash"

sti = require "sti"
HC = require 'HardonCollider'
platformlib = require "platform"
playerlib = require "player"
narrationlib = require "narration"
dialoguelib = require "dialog"
menulib = require "menu/menu"
musiclib = require "music"
sfx = require "sfx"

music = musiclib.new({
  "assets/1.ogg",
  "assets/2.ogg",
  "assets/3.ogg",
  "assets/4.ogg",
  "assets/5.ogg"
})

GS = require "gamestate"

states = {}
states.splash = require "state_splash"
states.menu = require "state_menu"
states.game = require "state_game"

function love.load()
  GS.registerEvents()
  GS.switch(states.splash)
end
