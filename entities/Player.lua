local Player = {
    isPlayer = true,
    collides = true,
    sprite = {},
    x = 0,
    y = 0,
    xvel = 0,
    yvel = 0,
    move = 0.3,
    jump = 10,
    gravity = 0.3,
}

function Player:new(obj, sprite)
    local new = obj or {}
    setmetatable(new, self)
    self.__index = self

    new.sprite.image = love.graphics.newImage(sprite)
    new.sprite.oy = new.sprite.image:getHeight() / 2
    new.sprite.ox = new.sprite.image:getWidth() / 2

    return new
end

return Player
