local Locationstack = require('Locationstack')

local Location = bindClass('org.bukkit.Location')

local M = {}

function M:teleport_to_coords(actor, ply, args)
    local world = actor:getWorld()

    local x = args.x
    local z = args.z or args.yz

    local y = args.z and args.yz or world:getHighestBlockYAt(x, z)

    if x > 500000 or z > 500000 or y > 512 then
        ply:sendError('Teleport location is out of bounds. (X: ' .. x .. ', Y: ' .. y .. ', Z: ' .. z .. ')')
        return
    end

    if x < -500000 or z < -500000 or y < -512 then
        ply:sendError('Teleport location is out of bounds. (X: ' .. x .. ', Y: ' .. y .. ', Z: ' .. z .. ')')
        return
    end

    local location = luajava.new(Location, world, x, y, z)
    Locationstack:add(ply)
    ply:teleport(location)
end

return M
