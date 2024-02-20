--[[

this script wasn't protected because whoever made this lock script the script is barely readable 
and so much erorrs i had to fucking fix and all other fucking locks use this same shitty script 
u can barely read anything 

-TheRealX_ORA
]]--

Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vKhonshu/intro2/main/ui2"))()
local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vKhonshu/intro/main/ui"))()
NotifyLib.prompt('Rainbow Sun', 'Modified & Created By: TheRealX_ORA on YT', 5)

-- Service
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:service("VirtualInputManager")

-- User Input Variables
local isTouchEnabled = UserInputService.TouchEnabled
local isMouseEnabled = UserInputService.MouseEnabled
local isKeyboardEnabled = UserInputService.KeyboardEnabled
local isGamepadEnabled = UserInputService.GamepadEnabled

if isTouchEnabled then
    
    NotifyLib.prompt('Mobile Device Detected', 'Loading Q Tool..', 5)
    
    -- Key To Click
    getgenv().keytoclick = "Q"

    -- Tool
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Smite"
    
    -- Key To Click Simulates
    tool.Activated:connect(function()
        VirtualInputManager:SendKeyEvent(true, keytoclick, false, game)
    end)

    -- Places Tool In Player Backpack
    tool.Parent = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
    
    local player = game:GetService("Players").LocalPlayer
    
    -- Ensure the tool is moved back to the backpack upon character removal
    player.CharacterRemoving:Connect(function()
        tool.Parent = player.Backpack
    end)
    
    NotifyLib.prompt('Mobile Q Tool', 'Q Tool Has Successfully Loaded!', 5)
    
elseif isMouseEnabled and isMouseEnabled then
    NotifyLib.prompt('Pc Device Detected', 'Smite them with Q!', 5)
    
elseif isGamepadEnabled and isTouchEnabled then
    
    NotifyLib.prompt('Controller And Mobile Device Detected', 'Loading Q Tool..', 5)
    
    -- Key To Click
    getgenv().keytoclick = "Q"

    -- Tool
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Smite"
    
    -- Key To Click Simulates
    tool.Activated:connect(function()
        VirtualInputManager:SendKeyEvent(true, keytoclick, false, game)
    end)

    -- Places Tool In Player Backpack
    tool.Parent = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
    
    local player = game:GetService("Players").LocalPlayer
    
    -- Ensure the tool is moved back to the backpack upon character removal
    player.CharacterRemoving:Connect(function()
        tool.Parent = player.Backpack
    end)
    
    NotifyLib.prompt('Controller And Mobile Q Tool', 'Q Tool Has Successfully Loaded!', 5)

elseif isMouseEnabled and isMouseEnabled and isTouchEnabled then
    
    NotifyLib.prompt('Hybird Mobile Device Detected', 'Loading Q Tool..', 5)
    
    -- Key To Click
    getgenv().keytoclick = "Q"

    -- Tool
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Smite"
    
    -- Key To Click Simulates
    tool.Activated:connect(function()
        VirtualInputManager:SendKeyEvent(true, keytoclick, false, game)
    end)

    -- Places Tool In Player Backpack
    tool.Parent = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
    
    local player = game:GetService("Players").LocalPlayer
    
    -- Ensure the tool is moved back to the backpack upon character removal
    player.CharacterRemoving:Connect(function()
        tool.Parent = player.Backpack
    end)
    
    NotifyLib.prompt('Hybird Mobile Q Tool', 'Q Tool Has Successfully Loaded!', 5)
end

Settings = {   
    rewrittenmain = {
		Enabled = true,
		Key = "q",
		DOT = true,
		AIRSHOT = true,
        NOTIF = true,			
        AUTOPRED = true,			
        FOV = math.huge,		
        RESOVLER = false
    }
}

local SelectedPart = "HumanoidRootPart"
local Prediction = true
local PredictionValue = 0.1357363


local AnchorCount = 0
local MaxAnchor = 50

local CC = game:GetService("Workspace").CurrentCamera
local Plr;
local enabled = false
local accomidationfactor = 0.136
local mouse = game.Players.LocalPlayer:GetMouse()
local data = game.Players:GetPlayers()

local placemarker = Instance.new("Part", game.Workspace)
placemarker.Material = Enum.Material.ForceField
placemarker.Reflectance = 0.1
placemarker.Shape = Enum.PartType.Ball
placemarker.TopSurface = Enum.SurfaceType.Smooth
placemarker.BottomSurface = Enum.SurfaceType.Smooth
placemarker.FrontSurface = Enum.SurfaceType.Smooth
placemarker.BackSurface = Enum.SurfaceType.Smooth
placemarker.LeftSurface = Enum.SurfaceType.Smooth
placemarker.RightSurface = Enum.SurfaceType.Smooth
        
local hue = 0

-- Update function to change the part's color over time
RunService.Heartbeat:Connect(function(deltaTime)
    hue = (hue + deltaTime * 0.1) % 1
    local color = Color3.fromHSV(hue, 1, 1)
    placemarker.Color = color
end)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"			
    e.Adornee = Adornee			
    e.Size = UDim2.new(Size, Size2, Size, Size2)			
    e.AlwaysOnTop = Settings.rewrittenmain.DOT
    
    local a = Instance.new("Frame", e)			
    if Settings.rewrittenmain.DOT == true then				
        a.Size = UDim2.new(2, 0, 2, 0)
    else
		a.Size = UDim2.new(0, 0, 0, 0)
	end
    
	if Settings.rewrittenmain.DOT == true then
        a.Transparency = 0				
        a.BackgroundTransparency = 0
	else
		a.Transparency = 1
		a.BackgroundTransparency = 1
	end
    
    a.BackgroundColor3 = Color
    local hue = 0
    
    -- Update function to change the part's color over time
    RunService.Heartbeat:Connect(function(deltaTime)
        hue = (hue + deltaTime * 0.1) % 1
        local color = Color3.fromHSV(hue, 1, 1)
        a.BackgroundColor3 = color
    end)
    
			
    local g = Instance.new("UICorner", a) 
		if Settings.rewrittenmain.DOT == false then
			g.CornerRadius = UDim.new(0, 0)
		else
			g.CornerRadius = UDim.new(1, 1) 
		end	
    
    return(e)
    
end

function noob(player)
    local character
    repeat wait() until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild(SelectedPart), Color3.fromRGB(0, 0, 0), 0.3, 3)
    handler.Name = player.Name			
    player.CharacterAdded:connect(function(Char) handler.Adornee = Char:WaitForChild(SelectedPart) end)
			
    spawn(function()			            
        while wait() do      
            if player.Character then
            end
		end
	end)
end

for i = 1, #data do
	if data[i] ~= game.Players.LocalPlayer then
		noob(data[i])
	end
end

game.Players.PlayerAdded:connect(function(Player)
	noob(Player)
end)

spawn(function()
	placemarker.Anchored = true
	placemarker.CanCollide = false
	
    if Settings.rewrittenmain.DOT == true then
        placemarker.Size = Vector3.new(10, 10, 10)
    else
		placemarker.Size = Vector3.new(0, 0, 0)
	end
        
	placemarker.Transparency = 0.50
			
    if Settings.rewrittenmain.DOT then
        makemarker(placemarker, placemarker, Color3.fromRGB(255, 0, 0), 0.40, 0)
	end
end)

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(k)
    if k == Settings.rewrittenmain.Key and Settings.rewrittenmain.Enabled then
        if enabled == true then
            enabled = false

            if Settings.rewrittenmain.NOTIF == true then
                Plr = getClosestPlayerToCursor()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Unlocked",
                    Text = "Spared: "..tostring(Plr.Character.Humanoid.DisplayName),
                    Duration = 1.5
                })
            end
        else
            Plr = getClosestPlayerToCursor()
            enabled = true
            if Settings.rewrittenmain.NOTIF == true then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Locked",
                    Text = "Victim: "..tostring(Plr.Character.Humanoid.DisplayName),
                    Duration = 2.5
                })
            end
        end
    end
end)



function getClosestPlayerToCursor()
	local closestPlayer
    local shortestDistance = Settings.rewrittenmain.FOV
	
    for i, v in pairs(game.Players:GetPlayers()) do			
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)					
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude	
            
            if magnitude < shortestDistance then						
                closestPlayer = v						
                shortestDistance = magnitude					
            end				
        end			
    end			
    return closestPlayer		
end

local lastNotificationTime = 0 -- Track the last time a notification was sent

game:GetService("RunService").Stepped:connect(function(deltaTime)
    if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
        placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position + (Plr.Character.HumanoidRootPart.Velocity * accomidationfactor))
    else
        placemarker.CFrame = CFrame.new(0, 9999, 0)
    end
    if Settings.rewrittenmain.AUTOPRED == true then
        pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        split = string.split(pingvalue, '(')
        ping = tonumber(split[1])

        -- Simplified prediction adjustment based on ping
        local baseValue = 0.085 -- Minimum prediction value for the lowest ping
        local scale = 0.0007 -- Scale factor to adjust prediction based on ping
        local maxPing = 10000 -- Maximum ping to consider for scaling

        -- Calculate prediction value with linear scaling based on ping difference
        local predictionValue = baseValue + math.clamp(ping, 0, maxPing) * scale

        predictionValue = math.min(predictionValue, 0.16)

        -- Check if 5 seconds have passed since the last notification
        if tick() - lastNotificationTime >= 5 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Auto Prediction",
                Text = "Prediction: "..tostring(predictionValue),
                Duration = 2.5
            })
            lastNotificationTime = tick() -- Update the last notification time
        end
    end
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
		
setreadonly(mt, false)		
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if enabled and getnamecallmethod() == "FireServer" and Settings.rewrittenmain.Enabled and Plr.Character ~= nil then            
        if args[2] == "UpdateMousePos" then        
            
            if Prediction == true then            
                if type(args[3]) == "table" then
                    args[3] = {
                        Plr.Character[SelectedPart].Position + (Plr.Character[SelectedPart].Velocity * PredictionValue)
                        }
                elseif type(args[3]) ~= "table" then
                    args[3] = Plr.Character[SelectedPart].Position + (Plr.Character[SelectedPart].Velocity * PredictionValue)
                end
                    
			else
                if type(args[3]) == "table" then
                    args[3] = {
                        Plr.Character[SelectedPart].Position
                        }
                elseif type(args[3]) ~= "table" then
                    args[3] = Plr.Character[SelectedPart].Position
                end
			end  
                
        elseif args[2] == "MOUSE" then
                
            if Prediction == true then
                if type(args[3]) == "table" then
                    args[3] = {
                        Plr.Character[SelectedPart].Position + (Plr.Character[SelectedPart].Velocity * PredictionValue)
                        }
                elseif type(args[3]) ~= "table" then
                    args[3] = Plr.Character[SelectedPart].Position + (Plr.Character[SelectedPart].Velocity * PredictionValue)
                end
                    
			else
				if type(args[3]) == "table" then
                    args[3] = {
                        Plr.Character[SelectedPart].Position
                        }
                elseif type(args[3]) ~= "table" then
                    args[3] = Plr.Character[SelectedPart].Position
                end            
            end
                
        elseif args[2] == "MousePos" then
            if Prediction == true then
                if type(args[3]) == "table" then
                    args[3] = {
                        Plr.Character[SelectedPart].Position + (Plr.Character[SelectedPart].Velocity * PredictionValue)
                        }
                elseif type(args[3]) ~= "table" then
                    args[3] = Plr.Character[SelectedPart].Position + (Plr.Character[SelectedPart].Velocity * PredictionValue)
                end
                    
			else
				if type(args[3]) == "table" then
                    args[3] = {
                        Plr.Character[SelectedPart].Position
                        }
                elseif type(args[3]) ~= "table" then
                    args[3] = Plr.Character[SelectedPart].Position
                end            
            end 
        end	            
        return old(unpack(args))			
    end			     
    return old(...)
end)

RunService.RenderStepped:Connect(function()		
    if Settings.rewrittenmain.RESOVLER == true and Plr.Character ~= nil and enabled and Settings.rewrittenmain.Enabled then	
           if Settings.rewrittenmain.AIRSHOT == true and enabled and Plr.Character ~= nil then					
                if game.Workspace.Players[Plr.Name].Humanoid:GetState() == Enum.HumanoidStateType.Freefall then -- Plr.Character:WaitForChild("Humanoid"):GetState() == Enum.HumanoidStateType.Freefall

						
                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
						AnchorCount = AnchorCount + 1
						if AnchorCount >= MaxAnchor then							                               
                            Prediction = false
							wait(2)
							AnchorCount = 0;							
                        end						
                    else
						Prediction = true
						AnchorCount = 0;
					end	                                               
                    SelectedPart = "LeftFoot"					                
                else						                
                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then
						AnchorCount = AnchorCount + 1
                        if AnchorCount >= MaxAnchor then
							Prediction = false
							wait(2)
							AnchorCount = 0;
						end          
                    else
						Prediction = true
						AnchorCount = 0;
					end
						SelectedPart = "HumanoidRootPart"
					end				                               
                else
                    if Plr.Character ~= nil and Plr.Character.HumanoidRootPart.Anchored == true then						
                        AnchorCount = AnchorCount + 1
						if AnchorCount >= MaxAnchor then
							Prediction = false
							wait(2)
							AnchorCount = 0;
						end
					else
						Prediction = true
						AnchorCount = 0;
					end
			SelectedPart = "HumanoidRootPart"
		end
	else
		SelectedPart = "HumanoidRootPart"
	end
end)

NotifyLib.prompt('TheRealX_ORA', 'Loaded Rainbow Sun!', 5)