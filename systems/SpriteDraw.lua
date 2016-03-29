local SpriteDraw = tiny.processingSystem()

SpriteDraw.isDraw = true
SpriteDraw.filter = tiny.requireAll('sprite', 'x', 'y')

function SpriteDraw:process(e, dt)
    print(e)
    love.graphics.draw(e.sprite.image, e.x, e.y)
end

return SpriteDraw
