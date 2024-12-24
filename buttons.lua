screenWidth = love.graphics.getWidth()
screenHeight = love.graphics.getHeight()
local CreatePowerUpButtons = {}

function CreatePowerUpButtons.new(x, y, width, height, text, font)
    local button = {
        x = x,
        y = y,
        width = width,
        height = height,
        type = text,
    }
    return button
end

return CreatePowerUpButtons



