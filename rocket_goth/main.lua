
function love.load()
    hamster = {
        image = love.graphics.newImage("hamster.png"),
        x = 50,
        y = 50,
        speed = 300,
    }
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        hamster.x = hamster.x + (hamster.speed * dt)
    end
    if love.keyboard.isDown("left") then
        hamster.x = hamster.x - (hamster.speed * dt)
    end

    if love.keyboard.isDown("down") then
        hamster.y = hamster.y + (hamster.speed * dt)
    end
    if love.keyboard.isDown("up") then
        hamster.y = hamster.y - (hamster.speed * dt)
    end
end

function love.draw()
    love.graphics.draw(hamster.image, hamster.x, hamster.y)
end
