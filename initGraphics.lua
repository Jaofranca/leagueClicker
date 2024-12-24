local InitGraphics = {}
function InitGraphics.draw()
    love.graphics.setColor(255,255,255,255)
    love.graphics.draw(images.background)
    love.graphics.setFont(font)
    love.graphics.draw(minion.image, minion.x, minion.y,0,minion.xScale,minion.yScale)
    love.graphics.print(player.gold,50,5)
    love.graphics.draw(images.coin, 0, 0,0,0.2,0.2) 
    
end
return InitGraphics
