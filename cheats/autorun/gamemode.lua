local Command = require("Command")
local Permission = require("Permission")

local GameMode = luajava.bindClass("org.bukkit.GameMode")

Command:register{
	name = "gamemode",
	aliases = {"gm"}, 
	actionFormat = "%s set %s gamemode to %s",
	actionIsProperty = true,
	arguments = {
		{
			name = "gamemode",
			type = "enum",
			enum = GameMode,
			aliases = {
				c = GameMode.CREATIVE,
				s = GameMode.SURVIVAL,
				a = GameMode.ADVENTURE
			},
			enumIdFunction = GameMode.getByValue
		},
		{
			name = "target",
			type = "player",
			defaultSelf = true,
			required = false,
			immunityRequirement = Permission.immunity.GREATER
		}
	},
	run = function(self, ply, args)
		args.target:setGameMode(args.gamemode)
		self:sendActionReply(ply, args.target, args.gamemode:name())
	end
}
