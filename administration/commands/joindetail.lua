local Event = require('Event')
local Chat = require('Chat')

local table_insert = table.insert
local table_concat = table.concat

Event:registerReadOnlyPlayerJoin(function(ply)
	local admintools = {}
	local played = ''
	if not ply.hasLoggedInBefore then
		ply.hasLoggedInBefore = true
		table_insert(admintools, '<color name="dark_purple">[FBAT]</color> ' .. ply:getDisplayName() .. ' first join')
		Chat:sendLocalToPermission(table_concat(admintools, ' '), 'foxbukkit.opchat', nil)
	end
end)
