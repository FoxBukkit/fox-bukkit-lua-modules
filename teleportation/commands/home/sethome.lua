local Command = require('Command')

Command:register{
	name = 'delhome',
	action = {
		format = '%s deleted %s home point %s',
		isProperty = true,
	},
	arguments = { {
		name = 'name',
		type = 'string',
		required = false,
		default = 'default',
	} },
	run = function(self, ply, args)
		ply:setHome(args.name, nil)
		self:sendActionReply(ply, ply, {}, args.name)
	end,
}

Command:register{
	name = 'sethome',
	action = {
		format = '%s set %s home point %s',
		isProperty = true,
	},
	arguments = { {
		name = 'name',
		type = 'string',
		required = false,
		default = 'default',
	} },
	run = function(self, ply, args)
		ply:setHome(args.name, ply:getLocation())
		self:sendActionReply(ply, ply, {}, args.name)
	end,
}
