local table_insert = table.insert
local table_remove = table.remove
local Player = require('Player')
local Event = require('Event')

local M = {
	add = function(_, ply, location)
		if not ply._locationstack then
			ply._locationstack = {}
		end
		table_insert(ply._locationstack, location or ply:getLocation())
	end,
	clear = function(_, ply)
		ply._locationstack = nil
	end,
	pop = function(_, ply)
		if not ply._locationstack then return end
		return table_remove(ply._locationstack)
	end,
}

Event:register{
	class = 'org.bukkit.event.entity.PlayerDeathEvent',
	priority = Event.Priority.HIGH,
	run = function(_, event)
		local ply = Player:extend(event:getEntity())
		M:add(ply)
	end,
}

return M
