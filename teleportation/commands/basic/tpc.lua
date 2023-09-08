local Command = require('Command')
local Teleporter = require('Teleporter')

Command:register{
	name = 'tpc',
	action = {
		format = '%s teleported %s to %d %d %d',
		isProperty = false,
	},
	permissionOther = false,
	arguments = { {
		name = 'x',
		type = 'number',
		required = true,
	}, {
		name = 'yz',
		type = 'number',
		required = true,
	}, {
		name = 'z',
		type = 'number',
		required = false,
		default = false,
	} },
	run = function(self, ply, args)
		local x, y, z = Teleporter:teleport_to_coords(ply, ply, args)
		self:sendActionReply(ply, ply, {}, x, y, z)
	end,
}
