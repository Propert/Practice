
function love.load()
    -- What could be cooler then a hamster? A hamster in a fucking ball!
    hamster = {
        image = love.graphics.newImage("hamster.png"),
        x = 50,
        y = 50,
        speed = 300,
    }
end

function move_entity(entity, delta_x, delta_y)
    -- Let an entity move around.
    -- TODO: Collision checks
    entity.x = entity.x + delta_x
    entity.y = entity.y + delta_y
end

function player_control(entity, dt)
    -- Put a player behind the wheel and let him drive some cool entity.
    -- Calculate the movement deltas and then do the actual moving.
    delta_x, delta_y = 0, 0

    if love.keyboard.isDown("right") then
        delta_x = entity.speed * dt
    elseif love.keyboard.isDown("left") then
        delta_x = -entity.speed * dt
    end

    if love.keyboard.isDown("down") then
        delta_y = entity.speed * dt
    elseif love.keyboard.isDown("up") then
        delta_y = - entity.speed * dt
    end

    move_entity(entity, delta_x, delta_y)
end

function love.update(dt)
    player_control(hamster, dt)
end

function love.draw()
    love.graphics.draw(hamster.image, hamster.x, hamster.y)
end
