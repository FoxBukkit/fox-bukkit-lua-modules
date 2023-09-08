local Command = require('Command')
local Permission = require('Permission')

local next = next

local FOOD_MAX = 20

Command:register{
	name = 'feed',
	action = {
		format = '%s fed %s',
		isProperty = false,
	},
	arguments = { {
		name = 'target',
		type = 'players',
		defaultSelf = true,
		required = false,
		immunityRequirement = Permission.Immunity.GREATER,
	} },
	run = function(self, ply, args)
		for _, target in next, args.target do
			target:setFoodLevel(FOOD_MAX)
		end
		self:sendActionReply(ply, args.target, {})
	end,
}

Command:register{
	name = 'heal',
	action = {
		format = '%s healed %s',
		isProperty = false,
	},
	arguments = { {
		name = 'target',
		type = 'players',
		defaultSelf = true,
		required = false,
		immunityRequirement = Permission.Immunity.GREATER,
	} },
	run = function(self, ply, args)
		for _, target in next, args.target do
			target:setHealth(target:getMaxHealth())
		end
		self:sendActionReply(ply, args.target, {})
	end,
}
