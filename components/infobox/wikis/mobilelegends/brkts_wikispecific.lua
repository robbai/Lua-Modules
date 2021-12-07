---
-- @Liquipedia
-- wiki=mobilelegends
-- page=Module:Brkts/WikiSpecific
--
-- Please see https://github.com/Liquipedia/Lua-Modules to contribute
--

local Date = require('Module:Date/Ext')
local Lua = require('Module:Lua')
local Table = require('Module:Table')

local WikiSpecific = Table.copy(Lua.import('Module:Brkts/WikiSpecific/Base', {requireDevIfEnabled = true}))

--
-- Override functons
--
function WikiSpecific.matchHasDetails(match)
	return match.dateIsExact
		or match.date ~= Date.epochZero
		or match.vod
		or not Table.isEmpty(match.links)
		or match.comment
		or 0 < #match.games
end

WikiSpecific.defaultIcon = 'Mobile Legends allmode.png'

return WikiSpecific
