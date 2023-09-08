local Command = require('Command')

Command:register{
	name = 'tpa-forget',
	action = {
		format = '%s forgot %s teleport request',
		isProperty = true,
	},
	permissionOther = false,
	arguments = { {
		name = 'target',
		type = 'player',
		required = true,
	} },
	run = function(self, ply, args)
		ply:forgetConfirmation('tpa_' .. args.target:getUniqueId():toString())
		self:sendActionReply(ply, args.target, {})
	end,
}
