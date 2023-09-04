local Command = require('Command')
local Server = require('Server')

local table_concat = table.concat

local function sendMultiCommand(ply, reply)
	for cmd in reply:gmatch('[^;]+') do
		ply:chat(cmd)
	end
end

Command:register{
	name = 'at',
	run = function(_, ply, args)
		local time = args[1]
		local argsConcat = table_concat(args, ' ', 2)
		Server:runOnMainThread(function()
			sendMultiCommand(ply, argsConcat)
		end, time * 20)
		ply:sendReply('Command scheduled')
	end,
}
