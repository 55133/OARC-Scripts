--Variables--
lvo = game.ServerStorage.Cards["L0"]
lv1 = game.ServerStorage.Cards["L1"]
lv2 = game.ServerStorage.Cards["L2"]
lv3 = game.ServerStorage.Cards["L3"]
lv4 = game.ServerStorage.Cards["L4"]
lv5 = game.ServerStorage.Cards["L5"]
Omni = game.ServerStorage.Cards["Omni"]

--Configurations--

--Main Script--
game.Players.PlayerAdded:Connect(function(plr)
    wait(1)
	if plr:IsInGroup(14791511) and plr:GetRankInGroup(14791511) == 95 then
        lv1:Clone().Parent = plr.Backpack
        lv1:Clone().Parent = plr.StarterGear
	elseif plr:IsInGroup(14791511) and plr:GetRankInGroup(14791511) == 96 then
        lv2:Clone().Parent = plr.Backpack
        lv2:Clone().Parent = plr.StarterGear
	elseif plr:IsInGroup(14791511) and plr:GetRankInGroup(14791511) == 97 then
        lv3:Clone().Parent = plr.Backpack
        lv3:Clone().Parent = plr.StarterGear
	elseif plr:IsInGroup(14791511) and plr:GetRankInGroup(14791511) == 98 then
        lv4:Clone().Parent = plr.Backpack
        lv4:Clone().Parent = plr.StarterGear
	elseif plr:IsInGroup(14791511) and plr:GetRankInGroup(14791511) == 99 then
        lv5:Clone().Parent = plr.Backpack
        lv5:Clone().Parent = plr.StarterGear
	elseif plr:IsInGroup(14791511) and plr:GetRankInGroup(14791511) >= 100 then
        Omni:Clone().Parent = plr.Backpack
        Omni:Clone().Parent = plr.StarterGear
	elseif plr:IsInGroup(14791511) and plr:GetRankInGroup(14791511) == 94 then
        lvo:Clone().Parent = plr.Backpack
        lvo:Clone().Parent = plr.StarterGear

    end
end)