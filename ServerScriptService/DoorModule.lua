local module = {}

local tween = game:GetService("TweenService")
local white = Color3.fromRGB(248, 248, 248)
local yellow = Color3.fromRGB(255, 255, 0)
local green = Color3.fromRGB(0, 212, 0)
local red = Color3.fromRGB(213, 0, 0)

module.GetLights = function(b)
	local tab = {}
	for i, v in pairs(b:GetDescendants()) do
		if v.Name == "cardlight" then
			table.insert(tab, v)
		end
	end
	if #tab > 0 then return tab end
end

module.Doors = {
	["BlastDoor"] = {
		["Open"] = function(d)
			d.Settings.Count.Value += 1
			local c = d.Settings.Count.Value
			d.Settings.Open.Value = true
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(3)
			Door2.AccessGranted:play()
			Door2.DoorOpen:play()
			local openTween1 = TS:Create(Door2,TI,{CFrame=Door2.CFrame*CFrame.new(0,8,0)})
			openTween1:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
			task.wait(6)
			if d.Settings.Count.Value == c and d.Settings.Lockdown.Value and not d.Settings.Locked.Value and not d.Settings:FindFirstChild("Unlocked") then
				CloseDoor(d)
			end
		end,
		["Close"] = function(d)
			d.Settings.Count.Value += 1
			d.Settings.Open.Value = false
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			Door2.AccessGranted:play()
			Door2.DoorClose:play()
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(3)
			local closeTween1 = TS:Create(Door2,TI,{CFrame=Door2.CFrame*CFrame.new(0,-8,0)})
			closeTween1:Play()
			DoorClose:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
		end,
	},
	["SlideDoor2"] = {
		["Open"] = function(d)
			d.Settings.Count.Value += 1
			local c = d.Settings.Count.Value
			d.Settings.Open.Value = true
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door2
			local Door1 = d.Door1
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(1)
			Door2.AccessGranted:play()
			Door2.DoorOpen:play()
			local openTween1 = TS:Create(Door2,TI,{CFrame=Door2.CFrame*CFrame.new(-3,0,0)})
			openTween1:Play()
			local openTween2 = TS:Create(Door1,TI,{CFrame=Door1.CFrame*CFrame.new(3,0,0)})
			openTween2:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
			task.wait(6)
			if d.Settings.Count.Value == c and d.Settings.Lockdown.Value and not d.Settings.Locked.Value and not d.Settings:FindFirstChild("Unlocked") then
				CloseDoor(d)
			end
		end,
		["Close"] = function(d)
			d.Settings.Count.Value += 1
			d.Settings.Open.Value = false
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door2
			local Door1 = d.Door1
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(1)
			local closeTween1 = TS:Create(Door2,TI,{CFrame=Door2.CFrame*CFrame.new(3,0,0)})
			closeTween1:Play()
			DoorClose:Play()
			local closeTween2 = TS:Create(Door1,TI,{CFrame=Door1.CFrame*CFrame.new(-3,0,0)})
			closeTween2:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
		end,
	},
	["NormalDoor"] = {
		["Open"] = function(d)
			d.Settings.Count.Value += 1
			local c = d.Settings.Count.Value
			d.Settings.Open.Value = true
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1.PrimaryPart
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(0.5)
			Door2.DoorOpen:play()
			local openTween1 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.Angles(0, math.rad(90), 0)})
			openTween1:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
			task.wait(6)
			if d.Settings.Count.Value == c and d.Settings.Lockdown.Value and not d.Settings.Locked.Value and not d.Settings:FindFirstChild("Unlocked") then
				CloseDoor(d)
			end
		end,
		["Close"] = function(d)
			d.Settings.Count.Value += 1
			d.Settings.Open.Value = false
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1.PrimaryPart
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(0.5)
			Door2.DoorOpen:play()
			local closeTween1 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.Angles(0, math.rad(-90), 0)})
			closeTween1:Play()
			DoorClose:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
		end,
	},
	["DoubleDoor"] = {
		["Open"] = function(d)
			d.Settings.Count.Value += 1
			local c = d.Settings.Count.Value
			d.Settings.Open.Value = true
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1.PrimaryPart
			local Door1 = d.Door2.PrimaryPart
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(0.5)
			Door2.DoorOpen:play()
			local openTween1 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.Angles(0, math.rad(90), 0)})
			openTween1:Play()
			local openTween2 = TS:Create(Door1, TI, {CFrame = Door1.CFrame * CFrame.Angles(0, math.rad(-90), 0)})
			openTween2:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
			task.wait(6)
			if d.Settings.Count.Value == c and d.Settings.Lockdown.Value and not d.Settings.Locked.Value and not d.Settings:FindFirstChild("Unlocked") then
				CloseDoor(d)
			end
		end,
		["Close"] = function(d)
			d.Settings.Count.Value += 1
			d.Settings.Open.Value = false
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1.PrimaryPart
			local Door1 = d.Door2.PrimaryPart
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(0.5)
			Door2.DoorOpen:play()
			local closeTween1 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.Angles(0, math.rad(-90), 0)})
			closeTween1:Play()
			local closeTween2 = TS:Create(Door1, TI, {CFrame = Door1.CFrame * CFrame.Angles(0, math.rad(90), 0)})
			closeTween2:Play()
			DoorClose:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
		end,
	},
	["BigDoor"] = {
		["Open"] = function(d)
			d.Settings.Count.Value += 1
			local c = d.Settings.Count.Value
			d.Settings.Open.Value = true
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(2)
			Door2.AccessGranted:play()
			Door2.DoorOpen:play()
			local openTween1 = TS:Create(Door2,TI,{CFrame=Door2.CFrame*CFrame.new(8.5,0,0)})
			openTween1:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
			task.wait(6)
			if d.Settings.Count.Value == c and d.Settings.Lockdown.Value and not d.Settings.Locked.Value and not d.Settings:FindFirstChild("Unlocked") then
				CloseDoor(d)
			end
		end,
		["Close"] = function(d)
			d.Settings.Count.Value += 1
			d.Settings.Open.Value = false
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(2)
			Door2.AccessGranted:play()
			local closeTween1 = TS:Create(Door2,TI,{CFrame=Door2.CFrame*CFrame.new(-8.5,0,0)})
			closeTween1:Play()
			DoorClose:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
		end,
	},
	["BlastDoor2"] = {
		["Open"] = function(d)
			d.Settings.Count.Value += 1
			local c = d.Settings.Count.Value
			d.Settings.Open.Value = true
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1
			local Door1 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(3)
			Granted:Play()
			DoorOpen:Play()
			local openTween = TS:Create(Door1, TI, {CFrame = Door1.CFrame * CFrame.new(0, 0, 5.5)})
			local openTween2 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.new(0, 0, 5.5)})
			openTween:Play()
			openTween2:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
			task.wait(6)
			if d.Settings.Count.Value == c and d.Settings.Lockdown.Value and not d.Settings.Locked.Value and not d.Settings:FindFirstChild("Unlocked") then
				CloseDoor(d)
			end
		end,
		["Close"] = function(d)
			d.Settings.Count.Value += 1
			d.Settings.Open.Value = false
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1
			local Door1 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(3)
			DoorClose:Play()
			local closeTween = TS:Create(Door1, TI, {CFrame = Door1.CFrame * CFrame.new(0, 0, -5.5)})
			local closeTween2 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.new(0, 0, -5.5)})
			closeTween:Play()
			closeTween2:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
		end,
	},
	["SlideDoor"] = {
		["Open"] = function(d)
			d.Settings.Count.Value += 1
			local c = d.Settings.Count.Value
			d.Settings.Open.Value = true
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1
			local Door1 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(1.2)
			Granted:Play()
			DoorOpen:Play()
			local openTween = TS:Create(Door1, TI, {CFrame = Door1.CFrame * CFrame.new(0, 0, 2.225)})
			local openTween2 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.new(0, 0, 2.225)})
			openTween:Play()
			openTween2:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
			task.wait(6)
			if d.Settings.Count.Value == c and d.Settings.Lockdown.Value and not d.Settings.Locked.Value and not d.Settings:FindFirstChild("Unlocked") then
				CloseDoor(d)
			end
		end,
		["Close"] = function(d)
			d.Settings.Count.Value += 1
			d.Settings.Open.Value = false
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1
			local Door1 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(1.2)
			DoorClose:Play()
			local closeTween = TS:Create(Door1, TI, {CFrame = Door1.CFrame * CFrame.new(0, 0, -2.225)})
			local closeTween2 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.new(0, 0, -2.225)})
			closeTween:Play()
			closeTween2:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
		end,
	},
	["BigLock"] = {
		["Open"] = function(d)
			d.Settings.Count.Value += 1
			local c = d.Settings.Count.Value
			d.Settings.Open.Value = true
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1
			local Door1 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(10)
			Granted:Play()
			DoorOpen:Play()
			local openTween = TS:Create(Door1, TI, {CFrame = Door1.CFrame * CFrame.new(0, 0, 9.15)})
			local openTween2 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.new(0, 0, 9.15)})
			openTween:Play()
			openTween2:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
			task.wait(6)
			if d.Settings.Count.Value == c and d.Settings.Lockdown.Value and not d.Settings.Locked.Value and not d.Settings:FindFirstChild("Unlocked") then
				CloseDoor(d)
			end
		end,
		["Close"] = function(d)
			d.Settings.Count.Value += 1
			d.Settings.Open.Value = false
			d.Settings.Moving.Value = true
			d.Settings.Debounce.Value = true
			local readers = module.GetLights(d)
			if readers then
				for i, v in pairs(readers) do
					v.Color = green
				end
			end
			local Door2 = d.Door1
			local Door1 = d.Door2
			local DoorOpen = Door2.DoorOpen
			local DoorClose = Door2.DoorClose
			local Granted = Door2.AccessGranted
			local Denied = Door2.AccessDenied
			local TS = game:GetService("TweenService")
			local TI = TweenInfo.new(10)
			DoorClose:Play()
			local closeTween = TS:Create(Door1, TI, {CFrame = Door1.CFrame * CFrame.new(0, 0, -9.15)})
			local closeTween2 = TS:Create(Door2, TI, {CFrame = Door2.CFrame * CFrame.new(0, 0, -9.15)})
			closeTween:Play()
			closeTween2:Play()
			task.wait(TI.Time)
			d.Settings.Moving.Value = false
			d.Settings.Debounce.Value = false
			if readers then
				for i, v in pairs(readers) do
					if d.Settings.Lockdown.Value then
						v.Color = yellow
					else
						v.Color = white
					end
				end
			end
		end,
	}
}

local function CloseDoor(door)
	local kind = door.Parent.Name
	if module.Doors[kind] then
		module.Doors[kind]["Close"](door)
	end
end

return module