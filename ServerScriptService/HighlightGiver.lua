-- For authorizing and KOS highlights

game.Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function()
		local highlight = game.ReplicatedStorage.AuthorizeHighlight:Clone()
		highlight.Enabled = false
		highlight.Adornee = plr.Character
		highlight.Parent = plr.Character
		local highlight2 = game.ReplicatedStorage.TerminateHighlight:Clone()
		highlight2.Enabled = false
		highlight2.Adornee = plr.Character
		highlight2.Parent = plr.Character
	end)
	
end)
