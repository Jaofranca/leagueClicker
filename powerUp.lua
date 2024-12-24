local powerUp = {}

function powerUp.upgrade(powerUp,player,minion,type)
    if powerUp.level <powerUp.limitLevel and player.gold >= powerUp.cost then
        player.gold = player.gold - powerUp.cost
        powerUp.level = powerUp.level + 1
        if type == "farmUp" then
            powerUp.cost = powerUp.cost * 3
            powerUp.upgrade = powerUp.upgrade * 3
            player.GPM = player.GPM + powerUp.upgrade
        end
        if type == "goldUp" then
            powerUp.cost = powerUp.cost + 50
            powerUp.upgrade = powerUp.upgrade + 2
            minion.gold = minion.gold + powerUp.upgrade
        end 
    end

end

return powerUp