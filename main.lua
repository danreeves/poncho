tiny = require('lib.tiny')
gamestate = require('lib.hump.gamestate')

local Intro = require('states.Intro')

function love.load()
    if arg[#arg] == "-debug" then require("mobdebug").start() end
    love.graphics.setDefaultFilter('nearest', 'nearest')
    gamestate.registerEvents()
    gamestate.switch(Intro:new('assets/maps/map_1.lua'))
end

local drawSystems = function(_, s) return not s.isUpdate end
local updateSystems = function(_, s) return not s.isDraw end

function love.update(dt)
    if world then
        world:update(dt, updateSystems)
    end
end

function love.draw()
    local dt = love.timer.getDelta()
    if world then
        world:update(dt, drawSystems)
    end
end
