local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AcceptExamEvent = ReplicatedStorage.MedicalExamPrompt
local ExamAccepted = ReplicatedStorage.MedicalExamAccept
local ExamUpdate = ReplicatedStorage.MedicalExamUpdate

local scale = game.Workspace["Weight Scale"].Frame.ScalePart
local eyeExam = game.Workspace.EyeExamPart
local maze = game.Workspace.MedicalExamMaze

AcceptExamEvent.OnServerEvent:Connect(function(examiner, classDPlayer)
	print(tostring(examiner) .. ", " .. tostring(classDPlayer))
	if not classDPlayer or not classDPlayer.Character then return end
	
	AcceptExamEvent:FireClient(classDPlayer, examiner.Name)
	local medicalExamTool = game.Players[examiner.Name].Backpack:FindFirstChild("Medical Exam")
	
	if not medicalExamTool then
		local character = game.Players[examiner.Name].Character
		if character then
			medicalExamTool = character:FindFirstChild("Medical Exam")
		end
	end
	
	if medicalExamTool then
		medicalExamTool:Destroy()
		print("Medical Exam tool destroyed from examiner's Backpack.")
	else
		warn("Medical Exam tool not found in examiner's Backpack.")
	end
end)

ExamAccepted.OnServerEvent:Connect(function(classDPlayer, accepted, examiner)
	--if not classDPlayer.Character or not examiner.Character then return end
	
	if not accepted then
		local medicalExamTool = game.ServerStorage:FindFirstChild("Medical Exam")
		if medicalExamTool then
			if not game.Players[examiner].Backpack:FindFirstChild("Medical Exam") or not game.Players[examiner].Character:FindFirstChild("Medical Exam") then
				local toolClone = medicalExamTool:Clone()
				toolClone.Parent = game.Players[examiner].Backpack
				print("Medical Exam Tool given to examiner")
			end
			
		else
			warn("MedicalExamTool not found in ServerStorage")
		end
		return
	end
	
	local medicalExamTool = game.ServerStorage:FindFirstChild("Medical Report")
	if medicalExamTool then
		if not game.Players[examiner].Backpack:FindFirstChild("Medical Report") or not game.Players[examiner].Character:FindFirstChild("Medical Report") then
			local toolClone = medicalExamTool:Clone()
			toolClone.Parent = game.Players[examiner].Backpack
			print("Medical Exam Tool given to examiner")
		end
		
	else
		warn("MedicalExamTool not found in ServerStorage")
	end
	--examiner.PlayerGui.MedicalExamInfo.Enabled = true
	ExamUpdate:FireClient(game.Players[examiner], classDPlayer, -1, -1, -1)

	local highlight = ReplicatedStorage.AuthorizeHighlight:Clone()
	highlight.Adornee = classDPlayer.Character
	highlight.Parent = workspace

	local radius = 30
	local countdown = 5
	local leaving = false
	local takenEyeExam = false
	local takenMaze = false
	game:GetService("RunService").Heartbeat:Connect(function()
		local classDPos = classDPlayer.Character.HumanoidRootPart.Position or classDPlayer.Character.PrimaryPart.Position
		local examinerPos = game.Workspace[examiner].HumanoidRootPart.Position -- FOR SOME REASON CANT USE examiner.Character.HumanoidRootPart.Position, returns null
		print((classDPos - examinerPos).Magnitude) --game.Workspace.StayPart.Position
		if (classDPos - examinerPos).Magnitude > radius then
			if not leaving then
				leaving = true
				task.delay(countdown, function()
					if leaving then
						highlight.OutlineColor = Color3.new(0.9, 0, 0)
						local medicalExamTool = game.ServerStorage:FindFirstChild("Medical Exam")
						if medicalExamTool then
							if game.Players[examiner].Backpack:FindFirstChild("Medical Exam") or game.Players[examiner].Character:FindFirstChild("Medical Exam") then
								return
							end
							local toolClone = medicalExamTool:Clone()
							toolClone.Parent = game.Players[examiner].Backpack
						end
						--examiner.PlayerGui.MedicalExamInfo.Enabled = false
						return
					end
				end)
			end
		else
			leaving = false
		end

		scale.Touched:Connect(function(hit)
			local character = hit.Parent
			if character == classDPlayer.Character then
				local humanoid = character:FindFirstChild("Humanoid")
				if humanoid then
					local weight = scale.Parent.Monitor.SurfaceGui.TextLabel.Weight.Value
					local player = game.Players:GetPlayerFromCharacter(character)
					if player then
						wait(.1)
						ExamUpdate:FireClient(game.Players[examiner], player, weight, -1, -1)
					end
				end
			end
		end)
		
		local TweenService = game:GetService("TweenService")
		
		eyeExam.Touched:Connect(function(hit)
			if not takenEyeExam then
			local character = hit.Parent
			if character == classDPlayer.Character then
				local humanoid = character:FindFirstChild("Humanoid")
				if humanoid then
					local player = game.Players:GetPlayerFromCharacter(character)
					if player then
						local camera = workspace.CurrentCamera
						local eyeExamCam = workspace:FindFirstChild("EyeExamCam")

						ReplicatedStorage.MedicalExamEyeExamCam:FireClient(player)

						local blur = Instance.new("BlurEffect")
						blur.Size = 8
						blur.Parent = camera

						local playerGui = player:FindFirstChild("PlayerGui")
						if playerGui then
							local eyeExamGui = playerGui:FindFirstChild("EyeExam")
							if eyeExamGui then
								eyeExamGui.Enabled = true
							else
								warn("EyeExamGui not found in PlayerGui!")
							end
						end

						ReplicatedStorage.MedicalExamEyeExamResult.OnServerEvent:Connect(function(cd, passed)
								takenEyeExam = true
								print(takenEyeExam)
							if cd.Name == player.Name then
								if passed == 1 then
									ExamUpdate:FireClient(game.Players[examiner], player, -1, 1, -1)
								else
									ExamUpdate:FireClient(game.Players[examiner], player, -1, 0, -1)
								end
								
							end
							
						end)
						
					end
				end
			end
			end
		end)
		
		maze.Start.Touched:Connect(function(hit)
			if takenMaze then return end
			if not hit.Parent then return end
			local character = hit.Parent
			local humanoid = character:FindFirstChild("Humanoid")
			if humanoid then
				local player = game.Players:GetPlayerFromCharacter(character)
				if player then
					for _, wall in pairs(maze.Walls:GetChildren()) do
						if not wall:IsA("BasePart") then continue end
						wall.Touched:Connect(function(hit2)
							if hit2.Parent == character and not takenMaze then
								ExamUpdate:FireClient(game.Players[examiner], player, -1, -1, 0)
								character.HumanoidRootPart.Position = maze.Start.Position + Vector3.new(0, 3, 0)
								takenMaze = true
							end
						end)
					end

					maze.Finish.Touched:Connect(function(hit2)
						if hit2.Parent == character and not takenMaze then
							character.HumanoidRootPart.Position = maze.Start.Position + Vector3.new(0, 3, 0)
							ExamUpdate:FireClient(game.Players[examiner], player, -1, -1, 1)
							takenMaze = true
						end
					end)
				end
			end
		end)

	end)
end)

game.ReplicatedStorage.MedicalExamResult.OnServerEvent:Connect(function(examiner, cd, weight, eye, maze)
	local clone = game.ServerStorage["Medical Exam Report"]:Clone()
	local userId = game.Players[cd.Name].UserId
	local thumbType = Enum.ThumbnailType.HeadShot -- Avatar's headshot
	local thumbSize = Enum.ThumbnailSize.Size420x420 -- High-resolution image

	local thumbnailUrl, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

	if isReady then
		clone.MedicalExamResult.PlayerImage.Image =  thumbnailUrl
	end
	clone.MedicalExamResult.Weight.Text = "Weight: " .. weight
	clone.MedicalExamResult.Sight.Text = "Sight: " .. eye
	clone.MedicalExamResult.Maze.Text = "Maze: " ..  maze
	
	local clone2 = clone:Clone()
	
	clone.Parent = examiner.Backpack
	clone2.Parent = cd.Backpack
	
	clone.MedicalReport_Client.Enabled = true
	clone2.MedicalReport_Client.Enabled = true
end)