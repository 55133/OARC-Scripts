
riot = false
game.Workspace.CDSHOP.UpperTorso.ClickDetector.MouseClick:Connect(function(player)
	if game.Players:FindFirstChild(player.Name).TeamColor == BrickColor.new("Neon orange") then
		local search = game.Players:FindFirstChild(player.Name).PlayerGui:FindFirstChild("CDShop")
		if search ~= nil then
			
else
	
game.Workspace.CDSHOP.UpperTorso.ClickDetector.CDShop:Clone().Parent = player.PlayerGui
        local money = player.leaderstats.Money
        local backpack = player:FindFirstChildOfClass("Backpack")
	    local folder = game.ServerStorage.Shopcontent
		local gui = player.PlayerGui.CDShop
		
gui.MainFrame.ScrollingFrame.MP5.purchase.MouseButton1Click:Connect(function(click)  -- P90
	if money.Value >= 1000 then
		money.Value = money.Value - 1000
					local mp5 = folder["MCX"]:Clone()
					mp5.Parent = backpack
		end
end)

gui.MainFrame.ScrollingFrame.L2.purchase.MouseButton1Click:Connect(function(click) -- Level-2 
	if money.Value >= 750 then
		money.Value = money.Value - 750
				local Level2 = folder["L2"]:Clone()
		Level2.Parent = backpack
	end
end)


gui.MainFrame.ScrollingFrame.Medibag.purchase.MouseButton1Click:Connect(function(click) -- medkit
	 if money.Value >= 1000 then
		money.Value = money.Value - 1000
				local medkit = folder.Medibag:Clone()
		medkit.Parent = backpack
	end
end)

			gui.MainFrame.ScrollingFrame.USP.purchase.MouseButton1Click:Connect(function(click) -- glock
	if money.Value >= 750 then
		money.Value = money.Value - 750
					local usp = folder.G17:Clone()
		usp.Parent = backpack
	end
			end)
			
gui.MainFrame.ScrollingFrame.Unterminate.purchase.MouseButton1Click:Connect(function(click) -- unterminate
				local workspacep = game.Workspace:FindFirstChild(player.Name)
if workspacep.Head.Rank.Frame.Terminate.Visible == true and money.Value >= 350 then

					money.Value = money.Value - 350
						workspacep.Head.Rank.Frame.Terminate.Visible = false

					end
			end)

gui.MainFrame.ScrollingFrame.RCard.purchase.MouseButton1Click:Connect(function(click) -- glock
	if money.Value >= 1500 then
		money.Value = money.Value - 1500
				local riot = folder["Riot"]:Clone()
				riot.Parent = backpack
			end
		end)
		
		gui.MainFrame.ScrollingFrame.Riot.purchase.MouseButton1Click:Connect(function(click) -- riot
			
					
				if money.Value >= 7500 then
					if riot == false then
		riot = true
					money.Value = money.Value - 7500
					game.Workspace.SiteEvent.Value = "PreRiot"
					local riott = folder.Riot
				for _,v in pairs (game.Players:GetPlayers()) do
					
					if v.TeamColor == BrickColor.new("Neon orange") then
						local Backpack = v.Backpack
								local tar = riott["MCX"]:Clone()
							local card = riott["Riot"]:Clone()
						tar.Parent = Backpack
						card.Parent = Backpack
					end
					end
						riott["MCX"].Parent = game.Teams["Class - D"]
					riott["Riot"].Parent = game.Teams["Class - D"]
					wait(900)
						game.Teams["Class - D"]["MCX"].Parent = riott
					game.Teams["Class - D"]["Riot"].Parent = riott
					riot = false
				end
				end
		end)
			gui.MainFrame.Close.MouseButton1Click:Connect(function(click)
				gui:Destroy()
				end)
		end
		end
	end)
	


