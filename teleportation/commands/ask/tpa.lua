local Command = require('Command')
local Locationstack = require('Locationstack')

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

Command:register{
	name = 'tpa',
	action = {
		format = '%s teleported to %s',
		isProperty = false,
	},
	permissionOther = false,
	arguments = { {
		name = 'target',
		type = 'player',
		required = true,
	} },
	run = function(self, ply, args)
		local cmd = self

		local question = args.target:askConfirmation(
			'tpa_' .. ply:getUniqueId():toString(),
			function()
				Locationstack:add(ply)
				ply:teleport(args.target)
				cmd:sendActionReply(ply, args.target, {})
			end,
			function()
				cmd:sendActionReply(args.target, ply, {
					format = '%s denied %s teleport request',
					isProperty = true,
				})
			end
		)

		if question then
			self:sendActionReply(ply, args.target, { format = '%s asked to teleport to %s' })
			args.target:sendReply(question.message)
		end
	end,
}
