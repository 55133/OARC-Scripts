local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ExamUpdate = ReplicatedStorage:WaitForChild("MedicalExamEyeExamCam")
local TweenService = game:GetService("TweenService")

ExamUpdate.OnClientEvent:Connect(function()
	
		local camera = workspace.CurrentCamera
		local eyeExamCam = workspace:FindFirstChild("EyeExamCam")

		if eyeExamCam then
			local cameraTween = TweenService:Create(
				camera,
				TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{CFrame = eyeExamCam.CFrame}
			)
			camera.CameraType = Enum.CameraType.Scriptable
			cameraTween:Play()
		end
		
		if not camera:FindFirstChild("Blur") then
		local blur = Instance.new("BlurEffect")
		blur.Size = math.random(0,8)
		blur.Parent = camera
		end	
		
		local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
		if playerGui then
			local eyeExamGui = playerGui:FindFirstChild("EyeExam")
			if eyeExamGui then
				eyeExamGui.Enabled = true
			end
		
	end
end)
