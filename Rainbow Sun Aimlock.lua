--[[
i fixed this fucking aimlock not even worth my time i could make a better one than this easily but oh well fuck it

people need to learn to organize their script :sob:

i dont even understand the script because it make 0 sense to me 😭🙏

(i love yapping dont mind me)

shitty ah script😪

niggas be copying and pasting and saying they made it

idk who is the original thats why i say i created it

whoever skids script to leak them is a pooron thb😪

join my discord fr fr discord.gg/iosexploiters

extra: cleaned the script IM NOT MAKING IT SUPPORT OTHER GAMES HELL NO 
bro i was abiut to make it support da fights and games that uses this remote function:
local args = {
[1] = "UpdateMousePos",
[2] = {
        ["MousePos"] = Vector3.new(-498.8055419921875, 4.6344757080078125, -852.712158203125),
        ["Camera"] = Vector3.new(-498.8055419921875, 4.6344757080078125, -852.712158203125)
      }
}
but i give up bro aint even my lock i only understand my scripts
-TheRealX_ORA
]]--

Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vKhonshu/intro2/main/ui2"))()
local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vKhonshu/intro/main/ui"))()
NotifyLib.prompt('Rainbow Sunshine', 'Modified & Created By: TheRealX_ORA on YT', 5)
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:service("VirtualInputManager")

local isTouchEnabled = UserInputService.TouchEnabled
local isMouseEnabled = UserInputService.MouseEnabled
local isKeyboardEnabled = UserInputService.KeyboardEnabled
local isGamepadEnabled = UserInputService.GamepadEnabled

if isTouchEnabled then
    NotifyLib.prompt('Mobile Device Detected', 'Loading V Tool..', 5)
    getgenv().keytoclick = "V"
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Smite"
    tool.Activated:connect(function()
        VirtualInputManager:SendKeyEvent(true, keytoclick, false, game)
    end)
    tool.Parent = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
    local player = game:GetService("Players").LocalPlayer
    player.CharacterRemoving:Connect(function()
        tool.Parent = player.Backpack
    end)
    NotifyLib.prompt('Mobile V Tool', 'V Tool Has Successfully Loaded!', 5)    
elseif isMouseEnabled and isMouseEnabled then
    NotifyLib.prompt('Pc Device Detected', 'Smite them with V!', 5)
elseif isGamepadEnabled and isTouchEnabled then
    NotifyLib.prompt('Controller And Mobile Device Detected', 'Loading V Tool..', 5)
    getgenv().keytoclick = "V"
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Smite"
   tool.Activated:connect(function()
        VirtualInputManager:SendKeyEvent(true, keytoclick, false, game)
    end)
    tool.Parent = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
    local player = game:GetService("Players").LocalPlayer
    player.CharacterRemoving:Connect(function()
        tool.Parent = player.Backpack
    end)
    NotifyLib.prompt('Controller And Mobile V Tool', 'V Tool Has Successfully Loaded!', 5)
elseif isMouseEnabled and isMouseEnabled and isTouchEnabled then
    NotifyLib.prompt('Hybird Mobile Device Detected', 'Loading V Tool..', 5)
    getgenv().keytoclick = "V"
    local tool = Instance.new("Tool")
    tool.RequiresHandle = false
    tool.Name = "Smite"
    tool.Activated:connect(function()
        VirtualInputManager:SendKeyEvent(true, keytoclick, false, game)
    end)
    tool.Parent = game:GetService("Players").LocalPlayer:WaitForChild("Backpack")
    local player = game:GetService("Players").LocalPlayer 
    player.CharacterRemoving:Connect(function()
        tool.Parent = player.Backpack
    end)
    NotifyLib.prompt('Hybird Mobile V Tool', 'V Tool Has Successfully Loaded!', 5)
end

Settings = {   
    rewrittenmain = {
		Enabled = true,
		Key = "v", -- change the key aint that hard -TheRealX_ORA	
		DOT = true,
		AIRSHOT = true,
        NOTIF = true,			
        AUTOPRED = true,			
        FOV = math.huge, --- if u dont know what is math.huge let me tell you it is infinite ok? -TheRealX_ORA	
    }
}

local SelectedPart = "HumanoidRootPart"
local Prediction = true
local PredictionValue = 0.1357363

local CC = game:GetService("Workspace").CurrentCamera
local Plr;
local enabled = false
local accomidationfactor = 0.136
local mouse = game.Players.LocalPlayer:GetMouse()
local data = game.Players:GetPlayers()

local placemarker = Instance.new("Part", game.Workspace)
placemarker.Material = Enum.Material.ForceField
placemarker.Reflectance = 0
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
        placemarker.Size = Vector3.new(8, 8, 8)
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

local lastNotificationTime = 0
local pingvalue = nil;
local split = nil;
local ping = nil;

local function generatePredictionValue(ping)
    local baseValues = {
        {maxPing = 10, base = 0.1},
        {maxPing = 30, base = 0.11},
        {maxPing = 50, base = 0.12},
        {maxPing = 70, base = 0.13},
        {maxPing = 90, base = 0.14},
        {maxPing = 110, base = 0.15},
        {maxPing = 130, base = 0.16},
        {maxPing = 150, base = 0.17},
        {maxPing = 170, base = 0.18},
        {maxPing = 190, base = 0.19},
        {maxPing = 210, base = 0.20},
        {maxPing = 230, base = 0.21},
        {maxPing = 250, base = 0.22},
        -- Add more if needed
    }

    local predictionGenerator = 0.235
    for _, range in ipairs(baseValues) do
        if ping <= range.maxPing then
            predictionGenerator = range.base
            break
        end
    end

    local numberOfDigits = math.random(12, 15)
    predictionGenerator = tostring(predictionGenerator)
    for _ = 1, numberOfDigits do
        local randomDigit = tostring(math.random(0, 9))
        predictionGenerator = predictionGenerator .. randomDigit
    end

    return predictionGenerator
end

local lastNotificationTime = 0
game:GetService("RunService").Stepped:connect(function()
    if enabled and Plr.Character ~= nil and Plr.Character:FindFirstChild("HumanoidRootPart") then
        placemarker.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position + (Plr.Character.HumanoidRootPart.Velocity * accomidationfactor))
    else
        placemarker.CFrame = CFrame.new(0, 9999, 0)
    end
    if Settings.rewrittenmain.AUTOPRED == true then
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingvalue, '(')
        local ping = tonumber(split[1])

        local predictionValue = generatePredictionValue(ping)
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

NotifyLib.prompt('TheRealX_ORA', 'Loaded Rainbow Sunshine!', 5)
