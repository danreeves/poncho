local Player = {
    collides = true,
    sprite = {},
    x = 0,
    y = 0,
    xvel = 0,
    yvel = 0,
    move = 4,
    jump = 10,
}

function Player:new(obj, sprite)
    local new = obj or {}
    setmetatable(new, self)
    self.__index = self

    new.sprite = love.graphics.newImage(sprite)

    return new
end

return Player
