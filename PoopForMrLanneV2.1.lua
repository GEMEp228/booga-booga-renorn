_G.killauraon = false
_G.teleportaura = false
_G.Bypasswalkspeed = false
_G.Leavefromtrap = false
_G.waterwalk = false
function place_crops(crop)
	for i,v in pairs(workspace.Deployables:GetChildren()) do
		if v.Name == "Plant Box" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChildOfClass("Part").Position).Magnitude <= 5 and not v:FindFirstChild(crop) then
			game:GetService("ReplicatedStorage").Events.lnteractStructure:FireServer(v,crop)
		end
	end	
end
function collect_crops()
	namecrops = {"Barley Bushel", "Bloodfruit Bush", "Jelly Crop", "Apple Tree", "Bloodfruit Bush"}
	for i,v in pairs(workspace:GetChildren()) do
		if table.find(namecrops, v.Name) and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v:FindFirstChildOfClass("Part").Position).Magnitude <= 60 then
			game:GetService("ReplicatedStorage").Events.Pickup:FireServer(v)
		end
	end
end
function collect_fish()
	for i,v in pairs(workspace.Deployables:GetChildren()) do
		if v.Name == "Fish Trap" and v.Contents:FindFirstChild("Raw Fish") then
			game:GetService("ReplicatedStorage").Events.Pickup:FireServer(v.Contents:FindFirstChild("Raw Fish"))
		end
	end
end
function satisfaction_of_hunger(food)
	if game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.Slider.AbsoluteSize.X <= 185 then
		for eat_count = 1 , math.ceil((200 - game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.Slider.AbsoluteSize.X)/20) do
			game:GetService("ReplicatedStorage").Events.UseBagltem:FireServer(food)
			wait(0.3)
		end
	end
end
function pickup()
	for i,v in pairs(game:GetService("Workspace").Items:GetChildren()) do
		if v.ClassName ~= "Model" and (game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position - v.Position).Magnitude <= 30 then
			game:GetService("ReplicatedStorage").Events.Pickup:FireServer(v)
		end
	end
end
function health()
	if game.Players.LocalPlayer.Character.Humanoid.Health < 90 and game.Players.LocalPlayer.Character.Humanoid.Health > 0  then
		for healthcount = 1, math.ceil((100 - game.Players.LocalPlayer.Character.Humanoid.Health)/4) do
		    game:GetService("ReplicatedStorage").Events.UseBagltem:FireServer("Bloodfruit")
        	end
	end
end
function getmeat()
	if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0   then
		game.Players.LocalPlayer.Character:BreakJoints()
		repeat
			wait()
		until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0    
	else
		repeat
			wait()
		until game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health > 0
	end
	pickup()
end
function pickupchest()
    for i,v in pairs(workspace.Deployables:GetChildren()) do
        if string.find(v.Name, "Chest") then
            for i,v in pairs(v.Contents:GetChildren()) do
                game:GetService("ReplicatedStorage").Events.Pickup:FireServer(v)
				task.wait()
            end
        end
    end
end
function pickupchestforbind()
    for i,v in pairs(workspace.Deployables:GetChildren()) do
        if string.find(v.Name, "Chest") then
            for i,v in pairs(v.Contents:GetChildren()) do
                game:GetService("ReplicatedStorage").Events.Pickup:FireServer(v)
            end
        end
    end
end
function killaura()
    local result;
    if game.Players.LocalPlayer.Team == game:GetService("Teams").NoTribe and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
        for _,plr in pairs(game.Players:GetPlayers()) do
            if 
                plr ~= game.Players.LocalPlayer
                and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude <= 15
                and (
                    not result
                    or plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude < (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - result.Character.HumanoidRootPart.Position).Magnitude
                )
            then
                result = plr
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.X,game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.Y, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.X,game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.Y, 0, false, game, 0)
            end
        end
	elseif game.Players.LocalPlayer.Team ~= game:GetService("Teams").NoTribe then
		        for _,plr in pairs(game.Players:GetPlayers()) do
            if  plr.Team ~= game.Players.LocalPlayer.Team
                and	plr ~= game.Players.LocalPlayer
                and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude <= 15
                and (
                    not result
                    or plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude < (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - result.Character.HumanoidRootPart.Position).Magnitude
                )
            then
                result = plr
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.X,game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.Y, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.X,game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.Y, 0, false, game, 0)
            end
        end
    end
end
function collectcoin()
	for i,v in pairs(game:GetService("Workspace").ItemDrops:GetChildren()) do
		if v:IsA("Part") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 60 then
			game:GetService("ReplicatedStorage").Events.Pickup:FireServer(v)
		end
	end
end
function teleportaura()
    local result;
    if game.Players.LocalPlayer.Team == game:GetService("Teams").NoTribe and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
        for _,plr in pairs(game.Players:GetPlayers()) do
            if 
                plr ~= game.Players.LocalPlayer
				and plr.Character.Humanoid.Health > 0
                and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude <= 10
                and (
                    not result
                    or plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude < (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - result.Character.HumanoidRootPart.Position).Magnitude
                )
            then
                teleportauratarget = plr
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = teleportauratarget.Character.HumanoidRootPart.CFrame
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.X,game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.Y, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.X,game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.Y, 0, false, game, 0)
            end
        end
	elseif game.Players.LocalPlayer.Team ~= game:GetService("Teams").NoTribe then
		        for _,plr in pairs(game.Players:GetPlayers()) do
            if  
				plr.Team ~= game.Players.LocalPlayer.Team
				and plr.Character.Humanoid.Health > 0
                and	plr ~= game.Players.LocalPlayer
                and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude <= 10
                and (
                    not result
                    or plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude < (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - result.Character.HumanoidRootPart.Position).Magnitude
                )
            then
                teleportauratarget = plr
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = teleportauratarget.Character.HumanoidRootPart.CFrame
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.X,game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.Y, 0, true, game, 0)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.X,game.Players.LocalPlayer.PlayerGui.MainGui.Panels.Stats.Food.AbsolutePosition.Y, 0, false, game, 0)
            end
        end
    end
end
function place_plant_boxes()
	chrp = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
	game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Plant Box",(CFrame.new(chrp) - Vector3.new(0,3,0)) * CFrame.Angles(-0, 0, -0),0)
	wait(0.35)
	game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Plant Box",(CFrame.new(chrp) - Vector3.new(7,3,0)) * CFrame.Angles(-0, 0, -0),0)
	wait(0.35)
	game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Plant Box",(CFrame.new(chrp) - Vector3.new(-7,3,0)) * CFrame.Angles(-0, 0, -0),0)
	wait(0.35)
	game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Plant Box",(CFrame.new(chrp) - Vector3.new(0,3,7)) * CFrame.Angles(-0, 0, -0),0)
	wait(0.35)
	game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Plant Box",(CFrame.new(chrp) - Vector3.new(0,3,-7)) * CFrame.Angles(-0, 0, -0),0)
	wait(0.35)
	game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Plant Box",(CFrame.new(chrp) - Vector3.new(7,3,-7)) * CFrame.Angles(-0, 0, -0),0)
	wait(0.35)
	game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Plant Box",(CFrame.new(chrp) - Vector3.new(-7,3,7)) * CFrame.Angles(-0, 0, -0),0)
	wait(0.35)
	game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Plant Box",(CFrame.new(chrp) - Vector3.new(7,3,7)) * CFrame.Angles(-0, 0, -0),0)
	wait(0.35)
	game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Plant Box",(CFrame.new(chrp) - Vector3.new(-7,3,-7)) * CFrame.Angles(-0, 0, -0),0)
	wait(0.35)
end
function changespeed()
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed < 16 and _G.waterwalk == true then
        game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 16
	end
end
function Bypasswalkspeed()
	while wait(0.1) and _G.Bypasswalkspeed  and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Parent do
		if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection.Magnitude > 0 then
				game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection * tonumber(0.35))
			else
				game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection)
		end
	end
end
function Leavefromtrap()
	if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection.Magnitude > 0 then
		game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection * tonumber(6))
	else
		game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").MoveDirection)
	end
end
function pickupessence()
	for i,v in pairs(game:GetService("Workspace").Items:GetChildren()) do
		if v.Name == "Essence" and v.ClassName ~= "Model" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 30 then
			game:GetService("ReplicatedStorage").Events.Pickup:FireServer(v)
		end
	end
end
local function getClosestObject(folder,distance)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        for i,v in pairs(folder:GetChildren()) do
            if v and not v:FindFirstChild("Humanoid") and v:FindFirstChild("Health") then
                for i2,v2 in pairs(v:GetChildren()) do
                    if v2:IsA("BasePart") then
                        if math.abs((game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v2.Position).Magnitude) < distance then
                            distance = math.abs((game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position - v2.Position).Magnitude)
                            part = v2
                        end
                    end
                end
            end
        end
    end
    return part
end
function getClosestPlayers(distance)
    local result;
    if game.Players.LocalPlayer.Team == game:GetService("Teams").NoTribe and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart') then
        for _,plr in pairs(game.Players:GetPlayers()) do
            if 
                plr ~= game.Players.LocalPlayer
                and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude <= distance
                and (
                    not result
                    or plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude < (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - result.Character.HumanoidRootPart.Position).Magnitude
                )
				and plr
            then
                result = plr
            end
        end
	elseif game.Players.LocalPlayer.Team ~= game:GetService("Teams").NoTribe then
		        for _,plr in pairs(game.Players:GetPlayers()) do
            if 
				plr.Team ~= game.Players.LocalPlayer.Team
                and	plr ~= game.Players.LocalPlayer
                and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude and plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude <= distance
                and (
                    not result
                    or plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') and (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - plr.Character:FindFirstChild('HumanoidRootPart').Position).Magnitude < (game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - result.Character.HumanoidRootPart.Position).Magnitude
                )
				and plr
            then
                result = plr
            end
        end
    end
	return result
end
function goldpickup()
	for i,v in pairs(game:GetService("Workspace").Items:GetChildren()) do
		if v.Name == "Raw Gold" and v.ClassName ~= "Model" and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 30 then
			game:GetService("ReplicatedStorage").Events.Pickup:FireServer(v)
		end
	end
end
function breakaura()
	game:GetService("ReplicatedStorage").Events.SwingTool:FireServer(game.ReplicatedStorage.RelativeTime.Value,{getClosestObject(workspace,40)})
end
function animalhit()
	game:GetService("ReplicatedStorage").Events.SwingTool:FireServer(game.ReplicatedStorage.RelativeTime.Value,{getClosestObject(workspace.Critters,40)})
end
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "GEMEr228#9122", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroEnabled = true, IntroText = "ajkjokfjsj ink."})
local Tab = Window:MakeTab({
	Name = "pvp",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddBind({
	Name = "killaura",
	Default = Enum.KeyCode.R,
	Hold = false,
	Callback = function()
		if _G.killauraon == true then
			_G.killauraon = false
		elseif _G.killauraon == false then
			_G.killauraon = true
		end
		print(_G.killauraon)
		while wait() and _G.killauraon do
			killaura()
		end
	end    
})
Tab:AddBind({
	Name = "teleportaura",
	Default = Enum.KeyCode.H,
	Hold = false,
	Callback = function()
		if _G.teleportaura == true then
			_G.teleportaura = false
		elseif _G.teleportaura == false then
			_G.teleportaura = true
		end
		while task.wait() and _G.teleportaura do
			teleportaura()
		end
	end    
})
Tab:AddBind({
	Name = "leave from trap",
	Default = Enum.KeyCode.L,
	Hold = false,
	Callback = function()
        if _G.Leavefromtrap == true then
			_G.Leavefromtrap = false
		elseif _G.Leavefromtrap == false then
			_G.Leavefromtrap = true
		end
        while wait(2) and _G.Leavefromtrap and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Parent do
		Leavefromtrap()
        end
	end    
})

--Tab:AddBind({
--	Name = "betafunction",
--	Default = Enum.KeyCode.H,
--	Hold = false,
--	Callback = function()
--		game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("wood Wall",game.Players.LocalPlayer:GetMouse().Hit * CFrame.Angles(-0,0,0),0)
--	end    
--})
--Tab:AddButton({
--	Name = "Govnocode",
--	Callback = function()
--		getClosestPlr()
--		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = ClosestPlr.Character.HumanoidRootPart.CFrame - ClosestPlr.Character.HumanoidRootPart.CFrame.LookVector*4
--  	end    
--})
Tab:AddToggle({
	Name = "Bypasswalkspeed",
	Default = false,
	Callback = function(Value)
	_G.Bypasswalkspeed = Value
		Bypasswalkspeed()
    end
})
Tab:AddToggle({
	Name = "waterwalk",
	Default = false,
	Callback = function(Value)
	_G.waterwalk = Value
	if _G.waterwalk == true then
		game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(changespeed)
	elseif _G.waterwalk == false then
		game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(changespeed):Disconnect()
		end
    end
})
local Tab = Window:MakeTab({
	Name = "functions",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddDropdown({
	Name = "food",
	Default = "Cooked Meat",
	Options = {"Bread", "Cooked Meat", "Cooked Fish"},
	Callback = function(Value)
		food1 = Value
	end    
})
Tab:AddBind({
	Name = "pickup",
	Default = Enum.KeyCode.F,
	Hold = false,
	Callback = function()
		pickup()
	end    
})


Tab:AddToggle({
	Name = "autopickup",
	Default = false,
	Callback = function(Value)
	_G.autopickup = Value
		while wait(0.05) and _G.autopickup do
			pickup()
		end
    end
})
Tab:AddToggle({
	Name = "autopickupessence",
	Default = false,
	Callback = function(Value)
	_G.autopickupessence = Value
		while wait(0.1) and _G.autopickupessence do
			pickupessence()
		end
    end
})
Tab:AddToggle({
	Name = "autopickupgold",
	Default = false,
	Callback = function(Value)
	_G.autopickupgold = Value
		while wait(0.1) and _G.autopickupgold do
			goldpickup()
		end
    end
})
--Tab:AddToggle({
--	Name = "breakaura",
--	Default = false,
--	Callback = function(Value)
--	_G.breakaura = Value
--		while wait(0.5) and _G.breakaura do
--			breakaura()
--		end
--    end
--})
--Tab:AddToggle({
--	Name = "autoanimalhit",
--	Default = false,
--	Callback = function(Value)
--	_G.breakaura = Value
--		while wait(0.5) and _G.breakaura do
--			animalhit()
--		end
--    end
--})
Tab:AddToggle({
	Name = "autopickupchest",
	Default = false,
	Callback = function(Value)
	_G.autopickupchest = Value
		while wait(0.1) and _G.autopickupchest do
			pickupchest()
		end
    end
})
Tab:AddToggle({
	Name = "autopickupall",
	Default = false,
	Callback = function(Value)
	_G.autopickup = Value
		while wait(0.1) and _G.autopickup do
			pickup()
			pickupchest()
			collectcoin()
		end
    end
})
Tab:AddToggle({
	Name = "auto get meat",
	Default = false,
	Callback = function(Value)
	_G.autogetmeat = Value
		while wait(0.1) and _G.autogetmeat do
			getmeat()
		end
    end
})
Tab:AddToggle({
	Name = "autoheal",
	Default = false,
	Callback = function(Value)
	_G.autoheal = Value
		while wait(0.1) and _G.autoheal do
			health()
		end
	end    
})
Tab:AddToggle({
	Name = "autosatisfaction",
	Default = false,
	Callback = function(Value)
	_G.autosatisfaction = Value
	while wait(0.1) and _G.autosatisfaction do
        satisfaction_of_hunger(food1)
        end
    end
})
local Tab = Window:MakeTab({
	Name = "crops",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddDropdown({
	Name = "fruit",
	Default = "Bloodfruit",
	Options = {"Bluefruit", "Lemon","Barley","Bloodfruit","Jelly", "Apple","Sunfruit"},
	Callback = function(Value)
	fruit = Value
	end    
})
Tab:AddButton({
	Name = "Govnocode",
	Callback = function()
      	place_plant_boxes()
  	end    
})
Tab:AddToggle({
	Name = "autonplace",
	Default = false,
	Callback = function(Value)
	_G.autoplace = Value
	while wait(0.1) and _G.autoplace do
        	place_crops(fruit)
        end
    end
})
Tab:AddBind({
	Name = "collect crops",
	Default = Enum.KeyCode.N,
	Hold = false,
	Callback = function()
		collect_crops()
	end    
})
local Tab = Window:MakeTab({
	Name = "another autofarm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddBind({
	Name = "fish",
	Default = Enum.KeyCode.N,
	Hold = false,
	Callback = function()
		collect_fish()
	end
})
local Tab = Window:MakeTab({
	Name = "hide",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddButton({
	Name = "hide armor",
	Callback = function()
		for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if v:IsA("Accessory") then
				for i, d in pairs(v.Handle:GetDescendants()) do
					if d.Name == "AccessoryWeld" then
						d:Destroy()
					end
				end
			end
		end
  	end    
})
local Tab = Window:MakeTab({
	Name = "esp",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab = Window:MakeTab({
	Name = "служебное окно",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddBind({
	Name = "Turn gui",
	Default = Enum.KeyCode.RightControl,
	Hold = false,
	Callback = function()
		if game:GetService("CoreGui").Orion.Enabled == true then
			game:GetService("CoreGui").Orion.Enabled = false
		elseif game:GetService("CoreGui").Orion.Enabled == false then
			game:GetService("CoreGui").Orion.Enabled = true
		end
	end 
})
OrionLib:Init()