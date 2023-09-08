local Command = require('Command')

Command:register{
	name = 'summona-forget',
	action = {
		format = '%s forgot %s summon request',
		isProperty = true,
	},
	permissionOther = false,
	arguments = { {
		name = 'target',
		type = 'player',
		required = true,
	} },
	run = function(self, ply, args)
		ply:forgetConfirmation('summona_' .. args.target:getUniqueId():toString())
		self:sendActionReply(ply, args.target, {})
	end,
}
