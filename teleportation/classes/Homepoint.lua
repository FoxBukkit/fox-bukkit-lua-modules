local Player = require('Player')

local Homepoint = {
	getPlayerHome = function(_, ply, name)
		if not ply.homepoints then return end
		return ply.homepoints[name and name:lower() or 'default']
	end,
	getPlayerHomes = function(_, ply)
		return ply.homepoints or {}
	end,
	clearPlayerHomes = function(_, ply)
		ply.homepoints = nil
	end,
	setPlayerHome = function(_, ply, name, location)
		ply.homepoints = ply.homepoints or {}
		ply.homepoints[name and name:lower() or 'default'] = location
		ply:__save()
	end,
}

Player:addExtensions{
	getHome = function(self, name)
		return Homepoint:getPlayerHome(self, name)
	end,
	getHomes = function(self)
		return Homepoint:getPlayerHomes(self)
	end,
	clearHomes = function(self)
		return Homepoint:clearPlayerHomes(self)
	end,
	setHome = function(self, name, location)
		return Homepoint:setPlayerHome(self, name, location)
	end,
}

return Homepoint
