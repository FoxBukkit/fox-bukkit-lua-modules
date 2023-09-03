local Command = require("Command")
local Server = require("Server")

local Set = bindClass("java.util.Set")
local Iterator = bindClass("java.util.Iterator")
local Entry = bindClass("java.util.Map").Entry

local function sendMultilineReply(ply, reply)
	for line in reply:gmatch('[^\n]+') do
		ply:sendReply(line)
	end
end

Command:register{
	name = "fbhelp",
	permission = "foxbukkit.help",
	arguments = {
		{
			name = "command",
			type = "string",
			required = false
		}
	},
	run = function(self, ply, args)
		if args.command then
			local info = Command:getInfo(args.command)
			if not info or not ply:hasPermission(info:get("permission")) then
				ply:sendReply("Command not found")
				return true
			end
			sendMultilineReply(ply, info:get("help") or "No help text available")
			sendMultilineReply(ply, info:get("usage") or "No usage text available")
			return
		end

		local displayedCmds = {}
		local es = Command:getCommands():entrySet()
		local it = Set.iterator(es)
		while Iterator.hasNext(it) do
			local entry = Iterator.next(it)
			local cmd = Entry.getKey(entry)
			local info = Entry.getValue(entry)
			if ply:hasPermission(info:get("permission")) then
				table.insert(displayedCmds, "/" .. cmd)
			end
		end
		ply:sendReply("Commands: " .. table.concat(displayedCmds, ", "))
		return true
	end
}
