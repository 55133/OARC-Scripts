local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local typingStatusEvent = ReplicatedStorage:WaitForChild("TypingStatus")

-- Function to create a "Typing..." BillboardGui
local function createTypingGui()
	local typingGui = Instance.new("BillboardGui")
	typingGui.Name = "TypingGui"
	typingGui.Size = UDim2.new(0, 100, 0, 50) -- Fixed size in pixels
	typingGui.StudsOffset = Vector3.new(0, 3, 0) -- Position above the player's head
	typingGui.AlwaysOnTop = true
	typingGui.MaxDistance = 15 -- Visibility range of 15 studs

	local textLabel = Instance.new("TextLabel", typingGui)
	textLabel.Size = UDim2.new(1, 0, 1, 0) -- Fill the BillboardGui
	textLabel.BackgroundTransparency = 1 -- Transparent background
	textLabel.Text = "Typing..." -- Text displayed
	textLabel.Font = Enum.Font.Nunito -- Font style
	textLabel.TextColor3 = Color3.new(1, 1, 1) -- White text
	textLabel.TextStrokeTransparency = 0.4 -- Outline transparency
	textLabel.TextStrokeColor3 = Color3.new(0, 0, 0) -- Outline color
	textLabel.TextTransparency = 0.4 -- Set text transparency
	textLabel.TextSize = 24 -- Fixed text size
	textLabel.TextScaled = false -- Disable auto-scaling
	textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)

	return typingGui
end

-- Function to handle typing status updates
local function onTypingStatusUpdate(player, isTyping)
	local character = player.Character or player.CharacterAdded:Wait()
	local head = character:FindFirstChild("Head")
	if not head then return end

	local typingGui = head:FindFirstChild("TypingGui")

	if isTyping then
		if not typingGui then
			typingGui = createTypingGui()
			typingGui.Adornee = head
			typingGui.Parent = head
		end
		typingGui.Enabled = true
	else
		if typingGui then
			typingGui.Enabled = false
		end
	end
end

-- Listen for typing status updates from clients
typingStatusEvent.OnServerEvent:Connect(onTypingStatusUpdate)

-- Clean up GUI when players leave or respawn
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local head = character:WaitForChild("Head")
		if head:FindFirstChild("TypingGui") then
			head.TypingGui:Destroy()
		end
	end)
end)
