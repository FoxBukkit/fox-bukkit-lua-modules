local Command = require('Command')
local Permission = require('Permission')
local Locationstack = require('Locationstack')

Command:register{
	name = 'banish',
	action = {
		format = '%s teleported %s to the spawnpoint%s',
		isProperty = false,
		broadcast = true,
	},
	arguments = { {
		name = 'target',
		type = 'players',
		immunityRequirement = Permission.Immunity.GREATER,
	} },
	run = function(self, ply, args)
		for _, target in next, args.target do
			Locationstack:clear(ply)
			target:clearHomes()
			target:setBedSpawnLocation(nil, true)
			target:teleportToSpawn()
		end
		self:sendActionReply(ply, args.target, {}, ' (and reset all homes)')
	end,
}
