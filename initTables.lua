local InitTables = {}

function InitTables.player()
    local player = {
        gold = 0,
        GPM = 0,
        GpmTimer = 5
    }
    return player

end

function InitTables.goldUp()
    local goldUp = {
        cost = 20,
        level = 0,
        upgrade = 1,
        limitLevel = 5
    }
    return goldUp

end

function InitTables.farmUp()
    local farmUp = {
        cost = 50,
        level = 0,
        upgrade = 1,
        limitLevel = 5
    } 
    return farmUp

end


function InitTables.minion()
    minionImage = love.graphics.newImage("images/minion.png")
    local minion = {
        gold = 1,
        width = minionImage:getWidth(),
        height = minionImage:getHeight(),
        x = (screenWidth - minionImage:getWidth()) / 2,
        y = (screenHeight - minionImage:getHeight()) / 2,
        image = minionImage,
        xScale = 1,
        yScale = 1

    }
    return minion 
end

function InitTables.images()
    local images = {
        farmUpImage = love.graphics.newImage("images/farm_up.png"),
        goldUpImage = love.graphics.newImage("images/gold_click.png"),
        background = love.graphics.newImage("images/background.png"),
        coin = love.graphics.newImage("images/coin.png")
    }
    return images 
end

return InitTables


    
   
   