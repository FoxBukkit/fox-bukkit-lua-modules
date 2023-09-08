local Locationstack = require('Locationstack')

local Location = bindClass('org.bukkit.Location')

local M = {}

function M.teleport_to_coords(_, actor, ply, args)
	local world = actor:getWorld()

	local x = args.x
	local z = args.z or args.yz

	local y = args.z and args.yz or world:getHighestBlockYAt(x, z)

	if x > 500000 or z > 500000 or y > 512 then
		ply:sendError('Teleport location is out of bounds. (X: ' .. x .. ', Y: ' .. y .. ', Z: ' .. z .. ')')
		return x, y, z
	end

	if x < -500000 or z < -500000 or y < -512 then
		ply:sendError('Teleport location is out of bounds. (X: ' .. x .. ', Y: ' .. y .. ', Z: ' .. z .. ')')
		return x, y, z
	end

	local location = luajava.new(Location, world, x, y, z)
	Locationstack:add(ply)
	ply:teleport(location)
	return x, y, z
end

return M
