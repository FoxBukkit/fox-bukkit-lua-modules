local Command = require('Command')
local Teleporter = require('Teleporter')

Command:register{
	name = 'tpoc',
	action = {
		format = '%s teleported %s to %d %d %d',
		isProperty = false,
	},
	permissionOther = false,
	arguments = { {
		name = 'target',
		type = 'players',
		required = true,
		immunityRequirement = Permission.Immunity.GREATER,
	}, {
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
		for _, otherPly in next, args.from_target do
			Teleporter:teleport_to_coords(ply, otherPly, args)
		end
		self:sendActionReply(ply, args.target, {}, x, y, z)
	end,
}
