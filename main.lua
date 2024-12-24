local CreatePowerUpButtons = require "buttons"
local InitTables = require "initTables"
local InitGraphics = require "initGraphics"
local powerUp = require "powerUp"
local screen = "main"
function love.load()
    --Init Main Screen
    love.window.setMode(800, 600, {resizable=false, vsync=0, minwidth=400, minheight=300})
    font = love.graphics.newFont("beau.ttf", 22)
    love.graphics.setFont(font)
    countdownTime = 2
    animationTimer = 0
    animate = false
    images = InitTables.images()
    minion = InitTables.minion()
    player = InitTables.player() 
    goldUp = InitTables.goldUp()
    farmUp = InitTables.farmUp()
    buttons = {
        GoldUpButton = CreatePowerUpButtons.new(20, screenHeight - 50, 120, 30, "goldUp", font),
        AutoFarmButton = CreatePowerUpButtons.new(20, screenHeight - 100, 120, 30, "farmUp", font)
    }

end 


function love.mousepressed(mouseX, mouseY, button)
    if button == 1 and mouseX>minion.x and mouseX< minion.x + minion.width and mouseY>minion.y and mouseY<minion.y + minion.height then
    player.gold = player.gold + minion.gold
    animate = true
    end
    for _, button in pairs(buttons) do
        if mouseX > button.x and mouseX < button.x + button.width and mouseY > button.y and mouseY < button.y + button.height then
            if button.type == "goldUp" then
                powerUp.upgrade(goldUp,player,minion,button.type)
            elseif button.type == "farmUp" then
                powerUp.upgrade(farmUp,player,minion,button.type)
            end
        end
    end

end

function animateBall(dt)
    if(animate == true and animationTimer == 0) then 
        minion.xScale = minion.xScale + 0.1
        minion.yScale = minion.yScale + 0.1
        minion.x = minion.x - 20
        minion.y = minion.y - 20
        animationTimer = 20
        animate = true
end 

if(animate and animationTimer >0) then 
    animationTimer = animationTimer - 1
    end   
    if(animate == true and animationTimer == 0) then 
        minion.xScale = minion.xScale - 0.1
        minion.yScale = minion.yScale - 0.1
        minion.x = minion.x + 20
        minion.y = minion.y + 20

        animate = false
    end  

end


function love.update(dt)
    animateBall(dt)
    if(player.GPM>0) then
        player.GpmTimer = player.GpmTimer - dt 
    if(player.GpmTimer<=0) then
        player.gold = player.gold + player.GPM
        player.GpmTimer = player.GpmTimer + 5
    end
    end
end



function love.draw()
    InitGraphics.draw()
    for i, button in pairs(buttons) do
        if(button.type == "goldUp") then
        love.graphics.draw(images.goldUpImage,button.x, button.y)
        elseif (button.type == "farmUp") then
        love.graphics.draw(images.farmUpImage,button.x, button.y)
    end
    
end

end 
