local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local afkStatusEvent = ReplicatedStorage:WaitForChild("AFKStatus")

local isAFK = false

-- Check if the player tabs out
UserInputService.WindowFocusReleased:Connect(function()
	if not isAFK then
		isAFK = true
		afkStatusEvent:FireServer(true) -- Notify the server the player is AFK
	end
end)

-- Check if the player tabs back in
UserInputService.WindowFocused:Connect(function()
	if isAFK then
		isAFK = false
		afkStatusEvent:FireServer(false) -- Notify the server the player is no longer AFK
	end
end)
