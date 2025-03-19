local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local afkStatusEvent = ReplicatedStorage:WaitForChild("AFKStatus")

-- Function to create an AFK BillboardGui
local function createAFKGui()
	local afkGui = Instance.new("BillboardGui")
	afkGui.Name = "AFKGui"
	afkGui.Size = UDim2.new(4, 0, 1, 0)
	afkGui.StudsOffset = Vector3.new(0, 3, 0) -- Position above head
	afkGui.AlwaysOnTop = true
	afkGui.MaxDistance = 15 

	local textLabel = Instance.new("TextLabel", afkGui)
	textLabel.Size = UDim2.new(1, 0, 1, 0) -- Fill the BillboardGui
	textLabel.BackgroundTransparency = 1 -- Transparent background
	textLabel.Text = "AFK" -- Text displayed
	textLabel.TextScaled = false -- Auto scale text size
	textLabel.Font = Enum.Font.Nunito -- Font style
	textLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
	textLabel.TextStrokeTransparency = 0 -- Black border
	textLabel.TextStrokeColor3 = Color3.new(0, 0, 0) -- Border color
	textLabel.TextTransparency = 0.4 -- Set text transparency
	textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	textLabel.TextSize = 24

	return afkGui
end

-- Function to handle AFK status updates
local function onAFKStatusUpdate(player, isAFK)
	local character = player.Character or player.CharacterAdded:Wait()
	local head = character:FindFirstChild("Head")
	if not head then return end

	local afkGui = head:FindFirstChild("AFKGui")

	if isAFK then
		if not afkGui then
			afkGui = createAFKGui()
			afkGui.Adornee = head
			afkGui.Parent = head
		end
		afkGui.Enabled = true
	else
		if afkGui then
			afkGui.Enabled = false
		end
	end
end

-- Listen for AFK status updates from clients
afkStatusEvent.OnServerEvent:Connect(onAFKStatusUpdate)

-- Clean up GUI when players leave or respawn
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local head = character:WaitForChild("Head")
		local existingGui = head:FindFirstChild("AFKGui")
		if existingGui then
			existingGui:Destroy()
		end
	end)
end)
