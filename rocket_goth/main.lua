
function love.load()
    -- What could be cooler then a hamster? A hamster in a fucking ball!
    hamster = {
        image = love.graphics.newImage("hamster.png"),
        x = 50,
        y = 50,
        speed = 300,
    }
    -- Mice is the shit.
    mouse = {
        image = love.graphics.newImage("mouse.png"),
        x = 150,
        y = 150,
        speed = 300,
    }

    -- Set up the controls for each player
    player_one = {
        up = 'up',
        down = 'down',
        left = 'left',
        right = 'right',
    }
    player_two= {
        up = 'w',
        down = 's',
        left = 'a',
        right = 'd',
    }
end

function move_entity(entity, delta_x, delta_y)
    -- Let an entity move around.
    -- TODO: Collision checks
    entity.x = entity.x + delta_x
    entity.y = entity.y + delta_y
end

function draw_entity(entity)
    -- Do some screen blit voodoo.
    love.graphics.draw(entity.image, entity.x, entity.y)
end

function player_control(player, entity, dt)
    -- Put a player behind the wheel and let him drive some cool entity.
    -- Calculate the movement deltas and then do the actual moving.
    delta_x, delta_y = 0, 0

    if love.keyboard.isDown(player.right) then
        delta_x = entity.speed * dt
    elseif love.keyboard.isDown(player.left) then
        delta_x = -entity.speed * dt
    end

    if love.keyboard.isDown(player.down) then
        delta_y = entity.speed * dt
    elseif love.keyboard.isDown(player.up) then
        delta_y = - entity.speed * dt
    end

    move_entity(entity, delta_x, delta_y)
end

function love.update(dt)
    player_control(player_one, hamster, dt)
    player_control(player_two, mouse, dt)
end


function love.draw()
    draw_entity(hamster)
    draw_entity(mouse)
end
