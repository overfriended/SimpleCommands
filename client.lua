function send(message)
    TriggerEvent("chat:addMessage", {
        color = { 255, 0, 0},
        multiline = true,
        args = {"System", message}
      })
end

function notify(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(0,1)
end

RegisterNetEvent("cc:notify")
AddEventHandler("cc:notify", function(text, src)
	notify(text)
end)	

Citizen.CreateThread(function()
	for command, message in pairs(Config.Commands) do
		RegisterCommand(command, function(src, args)
			if type(message) == "table" then
				if message[2] == "chat" then
					send(message[1])
				else
					notify(message[1])
				end
			elseif type(message) == "function" then
				message(src, args)
			else
				notify("~r~Something went wrong.")
			end
		end, Config.Permissions[command] or false)
		
		Citizen.Wait(0)
	end
end)