while true do
	wait(300)
	for i,v in pairs(game.Players:GetPlayers()) do
		if v:FindFirstChild("leaderstats") then
			v.leaderstats.Money.Value = v.leaderstats.Money.Value + 200
		end
	end
end