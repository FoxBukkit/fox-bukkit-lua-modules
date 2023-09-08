local Command = require('Command')
local Permission = require('Permission')
local Locationstack = require('Locationstack')

Command:register{
	name = 'tpo',
	action = {
		format = '%s teleported %s to %s',
		isProperty = false,
	},
	permissionOther = false,
	arguments = { {
		name = 'from_target',
		type = 'players',
		required = true,
		immunityRequirement = Permission.Immunity.GREATER,
	}, {
		name = 'to_target',
		type = 'player',
		required = true,
		immunityRequirement = Permission.Immunity.GREATER_OR_EQUAL,
	} },
	run = function(self, ply, args)
		for _, otherPly in next, args.from_target do
			Locationstack:add(otherPly)
			otherPly:teleport(args.to_target)
		end
		self:sendActionReply(ply, args.from_target, {}, args.to_target)
	end,
}
