local SpriteDraw = tiny.processingSystem()

SpriteDraw.isDraw = true
SpriteDraw.filter = tiny.requireAll('sprite', 'x', 'y')

function SpriteDraw:process(e, dt)
    love.graphics.draw(e.sprite.image, e.x, e.y, 0, 1, 1, e.sprite.ox, e.sprite.oy, 0, 0)
end

return SpriteDraw
