local PlayerController = tiny.processingSystem()

PlayerController.isUpdate = true
PlayerController.filter = tiny.requireAll('isPlayer')

function PlayerController:process(e, dt)

    local yvel = e.yvel;
    local xvel = e.xvel;

    if yvel < 15 then
        -- yvel = yvel + e.gravity
    end

    if love.keyboard.isDown('left') then
        xvel = xvel - e.move;
    end

    e.yvel = yvel;
    e.xvel = xvel;
    e.y = e.y + yvel;
    e.x = e.x + xvel;

end

return PlayerController
