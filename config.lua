Config = {}

--[[
	Permissions
	
	Will always be command.commandName.
	["commandName that you added"] = true
	or don't add it for something you don't need permissions for.
]]

Config.Permissions = {
	["testingwee"] = false
}

--[[
	["commandName"] = {"Text here", "chat"} for a simple chat message.
	OR
	["commandName"] = {"Text here", "notify"} for a simple notification message that goes above the radar.
	
	or for a function:
	["commandName"] = function(src, args)
		-- code
	end
	
	To send a notification, you can use the event cc:notify. Remember that this is ENTIRELY CLIENT SIDE. Use 
	TriggerServerEvent for server events.
]]

Config.Commands = {
    	["discord"] = {"The discord can be found here: ~o~discord.gg/MYINVITELINK~w~.", "notify"},
	["testingwee"] = function(src, args)
		TriggerEvent("cc:notify", "This was a ~g~test~w~!")
	end
}
