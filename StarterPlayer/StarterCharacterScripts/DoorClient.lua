--[[

written by Diduiem
yippiiee

fortunately whoever initially designed our
doors initially was kind enough to have
included an obsolute interaction area,
which i have very happily made no longer obsolete


]]



local player = game.Players.LocalPlayer
local chr = player.Character
local ui = player.PlayerGui:WaitForChild("DoorGui")
local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new(0.5)
local label = ui:WaitForChild("TextLabel")
local dead = false
local active = false
local hum = chr.Humanoid
local event = game.ReplicatedStorage.Door
local uis = game:GetService("UserInputService")
local button = label.ImageButton
local db = false

local co = nil

function hideui()
	button.Visible = false
	local tw = tween:Create(label, tweeninfo, {TextTransparency = 1})
	tw:Play()
end

local a = coroutine.create(function() -- spawns a thread that will wait until the player is no longer in range of the door
	while task.wait(0.1) do
		if active then
			local found = false
			local ps = workspace:GetPartsInPart(active)
			for i, v in pairs(ps) do
				if v.Name == "HumanoidRootPart" then
					if game.Players:GetPlayerFromCharacter(v.Parent) == player then
						found = true
					end
				end
			end
			if not found then
				active = false
				hideui()
				coroutine.yield(co)
			end
		else
			active = false
			hideui()
			coroutine.yield(co)
		end
	end
end)

function waiting()
	coroutine.resume(a)
	if not co then
		co = coroutine.running()
	end
end

function touch(hit)
	if hit.Name == "Interact" and hit.Parent.Name == "KeycardDoor" and not dead and active ~= hit then
		if not active then
			button.Visible = true
			active = hit
			local tw = tween:Create(label, tweeninfo, {TextTransparency = 0})
			tw:Play()
			waiting()
		else
			active = hit
		end
	end
end

local touchcon = chr.HumanoidRootPart.Touched:Connect(touch)

function die()
	if dead then return end -- to prevent jank
	dead = true
	if co then -- yes i know hideui() already closes the coroutine unfortunately i dont care
		coroutine.yield(co)
	end
	if active then
		active = false
		hideui()
	end
	touchcon:Disconnect()
end

function clicked()
	if db then return end
	event:FireServer(active.Parent)
	db = true
	task.wait(0.5)
	db = false
end

button.TouchTap:Connect(clicked)
button.MouseButton1Click:Connect(clicked)

uis.InputBegan:Connect(function(input, gpe)
	if gpe or not active or db then return end
	if input.KeyCode == Enum.KeyCode.E then
		event:FireServer(active.Parent)
		db = true
		task.wait(0.5)
		db = false
	end
end)

hum.Died:Connect(die) -- die >:)
hum.AncestryChanged:Connect(die)
hum.Destroying:Connect(die)