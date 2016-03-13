local sti = require 'libs/sti'

function love.load()
    -- Load map file

    love.graphics.setDefaultFilter('nearest', 'nearest')

    map = sti.new('assets/maps/map_1.lua')
    local sprites = map:addCustomLayer('Sprites', 2)

    local player
    for k, object in pairs(map.objects) do
        if object.name == 'Player' then
            player = object
            break
        end
    end

    local sprite = love.graphics.newImage('assets/img/char.png')
    sprites.player = {
        sprite = sprite,
        x = player.x,
        y = player.y,
        ox = sprite:getWidth() / 2,
        oy = sprite:getHeight() / 1.35
    }

    sprites.update = function(self, dt)
        -- 96 pixels per second
        local speed = 96

        -- Move player up
        if love.keyboard.isDown('w') or love.keyboard.isDown('up') then
            self.player.y = self.player.y - speed * dt
        end

        -- Move player down
        if love.keyboard.isDown('s') or love.keyboard.isDown('down') then
            self.player.y = self.player.y + speed * dt
        end

        -- Move player left
        if love.keyboard.isDown('a') or love.keyboard.isDown('left') then
            self.player.x = self.player.x - speed * dt
        end

        -- Move player right
        if love.keyboard.isDown('d') or love.keyboard.isDown('right') then
            self.player.x = self.player.x + speed * dt
        end
    end

    sprites.draw = function (self)
        love.graphics.draw(
            self.player.sprite,
            math.floor(self.player.x),
            math.floor(self.player.y),
            0,
            1,
            1,
            self.player.ox,
            self.player.oy
        )
    end

end

function love.update(dt)
    -- Update world
    map:update(dt)
end

function love.draw()
    -- Draw world
    love.graphics.scale(2)
    map:draw()
end
