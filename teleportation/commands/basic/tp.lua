local Command = require('Command')
local Permission = require('Permission')
local Locationstack = require('Locationstack')

Command:register{
	name = 'tp',
	action = {
		format = '%s teleported to %s%s',
		isProperty = false,
	},
	permissionOther = false,
	arguments = { {
		name = 'target',
		type = 'player',
		required = true,
		immunityRequirement = Permission.Immunity.GREATER_OR_EQUAL,
	} },
	run = function(self, ply, args)
		Locationstack:add(ply)
		ply:teleport(args.target)

		local silent = not args.target:canSee(ply)
		self:sendActionReply(ply, args.target, { silentToTarget = silent }, silent and ' (silent)' or '')
	end,
}
