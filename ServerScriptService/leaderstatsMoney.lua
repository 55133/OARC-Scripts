local DataStoreService = game:GetService("DataStoreService")
local moneyDataStore = DataStoreService:GetDataStore("MoneyDataStore")


game.Players.PlayerAdded:Connect(function(plr)
	wait(0.01)

	-- Create Money stat (directly in stats folder)
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = plr

	local money = Instance.new("IntValue")
	money.Name = "Money"
	money.Parent = leaderstats

	-- Load Money data
	local moneyKey = "Money_" .. plr.UserId
	local success, moneyData = pcall(function()
		return moneyDataStore:GetAsync(moneyKey)
	end)

	if success and moneyData then
		money.Value = moneyData
	else
		money.Value = 0
	end

	if not success then
		warn("Failed to load Money for player " .. plr.Name .. ": " .. tostring(moneyData))
	end
end)

game.Players.PlayerRemoving:Connect(function(plr)
	-- Save Money data
	wait(1)
	local leaderstats = plr:FindFirstChild("leaderstats")
	if leaderstats then
		local moneyKey = "Money_" .. plr.UserId
		local success, errorMessage = pcall(function()
			moneyDataStore:SetAsync(moneyKey, leaderstats.Money.Value)
		end)
		if not success then
			warn("Failed to save Money for player " .. plr.Name .. ": " .. tostring(errorMessage))
		end
	end
end)
