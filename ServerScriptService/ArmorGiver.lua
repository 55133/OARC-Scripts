local avatarType = "R6"

local teamArmor = {
	--["Foundation Personnel"] = "[FP] Keycard Necklace",
	--["Chaos Insurgency"] = "[CI] High Rank",
	--["Ethics Committee"] = "[EC] Keycard Necklace",
	--["Intelligence Agency"] = "[IA] All Ranks"
	["Health Department"] = "MD",
}

local groupRanksArmor = {
	
	-- Security Department Group ID O5 252 L-5 9 lvl 4 8 major 7 captain 6 LT 5 Seargent 4  SR.guard 3  guard 2 recruit 1
	{14807790, 1, "Security Department", "SD Guard"},
	{14807790, 2, "Security Department", "SD Guard"},
	{14807790, 3, "Security Department", "SD Senior Guard"},
	{14807790, 4, "Security Department", "SD Sergeant"},
	{14807790, 5, "Security Department", "SD Lieutenant"},
	{14807790, 6, "Security Department", "SD Captain"},
	{14807790, 7, "Security Department", "SD Major"},
	{14807790, 8, "Security Department", "SD Commander"},
	{14807790, 9, "Security Department", "SD General"},
	{14807790, 252, "Security Department", "SD Overseer"},
	
	--{5052647, 1, "Health Department", "MD"},
	--{5052647, 2, "Health Department", "MD"},
	--{5052647, 3, "Health Department", "MD"},
	--{5052647, 4, "Health Department", "MD"},
	--{5052647, 5, "Health Department", "MD"},
	--{5052647, 9, "Health Department", "MD"},
	--{5052647, 10, "Health Department", "MD"},
	--{5052647, 42, "Health Department", "MD"},
	--{5052647, 254, "Health Department", "MD"},
	--{5052647, 255, "Health Department", "MD"},

	-- Mobile Task Force Group ID
	{5052572, 25, "Mobile Task Forces", "[MTF-E11] Standard Issue"},
	{5052572, 26, "Mobile Task Forces", "[MTF-N7] Standard Issue"},
	{5052572, 28, "Mobile Task Forces", "[MTF-E5] Standard Issue"},
	{5052572, 30, "Mobile Task Forces", "[MTF-A1] Standard Issue"},
	{5052572, 32, "Mobile Task Forces", "[MTF-O?] Standard Issue"},
	{5052572, 33, "Mobile Task Forces", "[MTF] Assistant Director; Director"},
	{5052572, 35, "Mobile Task Forces", "[MTF] Assistant Director; Director"},
	{5052572, 36, "Mobile Task Forces", "[MTF] Overseer"},
	{5052572, 254, "Mobile Task Forces", "[MTF] Overseer"},
	{5052572, 255, "Mobile Task Forces", "[MTF] Overseer"},

	-- Internal Security Department Group ID
	--{11367913, 9, "Internal Security Department", "[ISD] Probationary Agent - Supervisor"},
	--{11367913, 11, "Internal Security Department", "[ISD] Probationary Agent - Supervisor"},
	--{11367913, 12, "Internal Security Department", "[ISD] Probationary Agent - Supervisor"},
	--{11367913, 13, "Internal Security Department", "[ISD] Probationary Agent - Supervisor"},
	--{11367913, 14, "Internal Security Department", "[ISD] Probationary Agent - Supervisor"},
	--{11367913, 15, "Internal Security Department", "[ISD] Executive Director+"},
	--{11367913, 16, "Internal Security Department", "[ISD] Executive Director+"},
	--{11367913, 200, "Internal Security Department", "[ISD] Executive Director+"},
	--{11367913, 254, "Internal Security Department", "[ISD] Executive Director+"},

	-- GRU Division - P Group ID
	--{14196300, 3, "GRU Division - P", "[GRU] Standard LR+"},
	--{14196300, 4, "GRU Division - P", "[GRU] Standard LR+"},
	--{14196300, 5, "GRU Division - P", "[GRU] Standard LR+"},
	--{14196300, 6, "GRU Division - P", "[GRU] Standard LR+"},
	--{14196300, 7, "GRU Division - P", "[GRU] Standard LR+"},
	--{14196300, 8, "GRU Division - P", "[GRU] Standard LR+"},
	--{14196300, 9, "GRU Division - P", "[GRU] Medium Rank"},
	--{14196300, 10, "GRU Division - P", "[GRU] Medium Rank"},
	--{14196300, 11, "GRU Division - P", "[GRU] Medium Rank"},
	--{14196300, 12, "GRU Division - P", "[GRU] Medium Rank"},
	--{14196300, 13, "GRU Division - P", "[GRU] Medium Rank"},
	--{14196300, 14, "GRU Division - P", "[GRU] Medium Rank"},
	--{14196300, 15, "GRU Division - P", "[GRU] High Rank"},
	--{14196300, 16, "GRU Division - P", "[GRU] High Rank"},
	--{14196300, 17, "GRU Division - P", "[GRU] High Rank"},
	--{14196300, 18, "GRU Division - P", "[GRU] High Rank"},
	--{14196300, 19, "GRU Division - P", "[GRU] High Rank"},
	--{14196300, 255, "GRU Division - P", "[GRU] High Rank"},

	-- Intelligence Agency Group ID
	{4937003, 1, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 2, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 3, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 4, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 5, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 6, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 7, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 8, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 10, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 254, "Intelligence Agency", "[IA] All Ranks"},
	{4937003, 255, "Intelligence Agency", "[IA] All Ranks"},
	-- Add more ranks if necessary

	-- Valravn Group ID
	--{15546639, 5, "Valravn Corporation", "[V] Allied Combatant"},
	--{15546639, 25, "Valravn Corporation", "[V] Mercenary"},
	--{15546639, 50, "Valravn Corporation", "[V] Auxillary - Rifleman"},
	--{15546639, 100, "Valravn Corporation", "[V] Auxillary - Rifleman"},
	--{15546639, 140, "Valravn Corporation", "[V] Rekkr - Bregnar"},
	--{15546639, 150, "Valravn Corporation", "[V] Rekkr - Bregnar"},
	--{15546639, 155, "Valravn Corporation", "[V] Kersantti - Asir"},
	--{15546639, 160, "Valravn Corporation", "[V] Kersantti - Asir"},
	--{15546639, 165, "Valravn Corporation", "[V] Allied Combatant"},
	--{15546639, 170, "Valravn Corporation", "[V] Hersir+"},
	--{15546639, 180, "Valravn Corporation", "[V] Hersir+"},
	--{15546639, 200, "Valravn Corporation", "[V] Hersir+"},
	--{15546639, 254, "Valravn Corporation", "[V] Hersir+"},
	--{15546639, 255, "Valravn Corporation", "[V] Hersir+"},
 --   -- Huscarls
	--{11456761, 20, "Valravn Corporation", "[V] Huscarls - Main"},
	--{11456761, 30, "Valravn Corporation", "[V] Huscarls - Main"},
	--{11456761, 50, "Valravn Corporation", "[V] Huscarls - Main"},
	--{11456761, 70, "Valravn Corporation", "[V] Huscarls - Main"},
	--{11456761, 90, "Valravn Corporation", "[V] Huscarls - Main"},
	--{11456761, 150, "Valravn Corporation", "[V] Huscarls - Main"},
	--{11456761, 200, "Valravn Corporation", "[V] Huscarls - Main"},
	--{11456761, 250, "Valravn Corporation", "[V] Huscarls - Main"},
	---- La Lloronas
	--{15844600, 10, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 20, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 30, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 31, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 32, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 33, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 34, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 35, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 36, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 37, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 38, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 39, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 40, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 50, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 75, "Valravn Corporation", "[V]  La Lloronas"},
	--{15844600, 100, "Valravn Corporation", "[V]  La Lloronas"},

}

local gamepass = {
	-- Example: {Gamepass ID, "TeamName", "ArmorName"}
	-- {123456789, "Team Name", "Armor Name"},
}








--Don't forget commas at the end of each lines.

--DO NOT EDIT



local function weldParts(mainPart, parts)
	for _, part in pairs(parts) do
		if part:IsA("Part") or part:IsA("CornerWedgePart") or part:IsA("WedgePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then
			local weld = Instance.new("Weld")
			weld.Part0 = mainPart
			weld.Part1 = part
			local cFrame = CFrame.new(mainPart.Position)
			weld.C0 = mainPart.CFrame:inverse() * cFrame
			weld.C1 = part.CFrame:inverse() * cFrame
			weld.Parent = mainPart
			part.Anchored = false
			part.CanCollide = false
		end
	end
end

local function equipArmor(part, armorPiece, attachTo)
	if not part.Parent:FindFirstChild(armorPiece.Name) then
		local clone = armorPiece:Clone()
		clone.Parent = part.Parent
		weldParts(clone.Middle, clone:GetChildren())

		local attachWeld = Instance.new("Weld")
		attachWeld.Part0 = part.Parent[attachTo]
		attachWeld.Part1 = clone.Middle
		attachWeld.C0 = CFrame.new(0, 0, 0)
		attachWeld.Parent = attachWeld.Part0
	end
end

local function giveArmorR6(part, armor)
	wait(2)
	
	local human = part.Parent:FindFirstChild("Humanoid")
	if human then 
		-- Make body parts visible
		for _, limb in pairs({"Head", "Left Arm", "Left Leg", "Right Arm", "Right Leg", "Torso"}) do
			local bodyPart = part.Parent:FindFirstChild(limb)
			if bodyPart then
				bodyPart.Transparency = 0
			end
		end

		-- Remove existing hats
		for _, item in pairs(human.Parent:GetChildren()) do 
			if item:IsA("Accessory") then 
				item:Destroy()
			end 
		end

		-- Equip armor pieces
		if armor:FindFirstChild("Helmet") then
			equipArmor(part, armor.Helmet, "Head")
		end
		if armor:FindFirstChild("Chest") then
			equipArmor(part, armor.Chest, "Torso")
		end
		if armor:FindFirstChild("Arm1") then
			equipArmor(part, armor.Arm1, "Left Arm")
		end
		if armor:FindFirstChild("Arm2") then
			equipArmor(part, armor.Arm2, "Right Arm")
		end
		if armor:FindFirstChild("Leg1") then
			equipArmor(part, armor.Leg1, "Left Leg")
		end
		if armor:FindFirstChild("Leg2") then
			equipArmor(part, armor.Leg2, "Right Leg")
		end
	end 
end

local function onEvent(part, armor)
	print("onEvent triggered with part:", part.Name, "and armor:", armor)
	if game.ServerStorage.ArmorStorage:FindFirstChild(armor) then
		print("Armor found in ServerStorage:", armor)
		if avatarType == "R6" then
			print("Avatar type is R6. Giving R6 armor.")
			giveArmorR6(part, game.ServerStorage.ArmorStorage:FindFirstChild(armor))
		else
			warn("Unknown avatar type:", avatarType)
		end
	else
		warn("Armor not found in ServerStorage:", armor)
	end
end

game.ReplicatedStorage.ArmorGiverServer.Event:Connect(onEvent)
game.ReplicatedStorage.ArmorGiverClient.OnServerEvent:Connect(function(plr, part, armor)
	print("ArmorGiverClient event received from player:", plr.Name)
	onEvent(part, armor)
end)

local market = game:GetService("MarketplaceService")

game.Players.PlayerAdded:Connect(function(plr)
	print("Player added:", plr.Name)
	plr.CharacterAdded:Connect(function(char)
		print("Character added for player:", plr.Name)
		local found
		for i, child in pairs(teamArmor) do
			print("Checking teamArmor for team:", plr.Team.Name)
			if i == plr.Team.Name then
				found = child
				print("Team armor found for team:", plr.Team.Name, "-> Armor:", child)
			else
				warn("teamArmor not found for team:", plr.Team.Name)
			end
		end

		for i, child in pairs(groupRanksArmor) do
			print("Checking groupRanksArmor for group:", child[1], "Rank:", child[2], "Team:", child[3])
			if plr:IsInGroup(child[1]) and plr:GetRankInGroup(child[1]) == child[2] and plr.Team.Name == child[3] then
				found = child[4]
				print("Group rank armor found -> Armor:", child[4])
			end
		end

		for i, child in pairs(gamepass) do
			print("Checking gamepass:", child[1], "for team:", child[2])
			if market:UserOwnsGamePassAsync(plr.UserId, child[1]) and plr.Team.Name == child[2] then
				found = child[3]
				print("Gamepass armor found -> Armor:", child[3])
			end
		end

		if found then
			print("Armor to be given:", found)
			onEvent(char.Head, found)
		else
			warn("No armor found for player:", plr.Name)
		end
	end)
end)