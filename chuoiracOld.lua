
repeat wait()
until game:IsLoaded() and game.Players.LocalPlayer
local BananaMain = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local cornerMainFrame = Instance.new("UICorner")
local titleFrame = Instance.new("Frame")
local titleText = Instance.new("TextLabel")
local lineFrame = Instance.new("Frame")
local gradientLineFrame = Instance.new("UIGradient")
local actionFrame = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local HttpService = game:GetService("HttpService")


getgenv().OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/skidcongaimetuimay.lua')))()
local Window = OrionLib:MakeWindow({Name = "Banana Hub",IntroText = "Banana Library"})
local Tab7 = Window:MakeTab({
	Name = "Shop",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab11 = Window:MakeTab({
	Name = "Local Player",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab3 = Window:MakeTab({
	Name = "DF and Raid",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Tab8 = Window:MakeTab({
	Name = "Status and Server",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab9 = Window:MakeTab({
	Name = "Upgrade Race",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab2 = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab4 = Window:MakeTab({
	Name = "Webhook",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab5 = Window:MakeTab({
	Name = "Get Items",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab6 = Window:MakeTab({
	Name = "PVP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local Tab10 = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local plr = game.Players.LocalPlayer
local CommF = game.ReplicatedStorage.Remotes["CommF_"]
local Settings = {}
local HttpService = game:GetService("HttpService")
local FolderName = "Banana Hub"
local SaveFileNameGame = "-BloxFruit.json"
local SaveFileName = game.Players.LocalPlayer.Name..SaveFileNameGame
local SettingHopServer = {}
local DefaultSettingHopServer = {}
function SaveSettings(fff,fff2)
    if fff~=nil then
        Settings[fff] = fff2
    end
    HttpService = game:GetService("HttpService")
    if not isfolder(FolderName) then
        makefolder(FolderName)
    end
    writefile(FolderName.."/" .. SaveFileName, HttpService:JSONEncode(Settings))
end

function ReadSetting()
local s,e = pcall(function()
    HttpService = game:GetService("HttpService")
    if not isfolder(FolderName) then
        makefolder(FolderName)
    end
    return HttpService:JSONDecode(readfile(FolderName.."/" .. SaveFileName))
end)
if s then return e
else
    SaveSettings()
    return ReadSetting()
end
end
Settings = ReadSetting()
if not pcall(function() readfile(FolderName.."/" .. "Jobid.json") end) then
    writefile(FolderName.."/" .. "Jobid.json", game:GetService("HttpService"):JSONEncode(DefaultSettingHopServer))
end
function CheckJobIdServer()
    local mmb = {}
    for i,v in next,game:GetService("HttpService"):JSONDecode(readfile(FolderName.."/" .. "Jobid.json")) do
        table.insert(mmb,i) 
    end
    return mmb 
end
function HopServer()
    local function Hop()
        for i=1,100 do
            local huhu = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(i)
            for k,v in pairs(huhu) do
                if v.Count >= 10 and k ~= game.JobId and not table.find(CheckJobIdServer(),k) then
                    game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",k)
                    writefile(FolderName.."/" .. "Jobid.json", game:GetService("HttpService"):JSONEncode(SettingHopServer))
                end
            end
        end
    end
    local v14 = require(game:GetService("ReplicatedStorage").Notification)
    v14.new("<Color=Red>Banana Hub : Wait "..(tostring(Settings["Delay HopServer"]) or "15").."s[Hop Server]<Color=/>"):Display()
    while wait(Settings["Delay HopServer"] or 15) do
        local v14 = require(game:GetService("ReplicatedStorage").Notification)
        v14.new("<Color=Red>Banana Hub : Hop Server<Color=/>"):Display()
        Hop()
    end
end
SettingHopServer = HttpService:JSONDecode(readfile(FolderName.."/" .. "Jobid.json"))
SettingHopServer[game.JobId] = true
local Section = Tab:AddSection({
	Name = "Setting Farm"
})
Tab:AddDropdown({
	Name = "Select Weapon",
	Default =  Settings["Select Weapon"] or "Melee",
	Options = {'Blox Fruit', 'Sword', 'Melee'},
    Flag = "Select Weapon",
	Callback = function(Value)
		SaveSettings("Select Weapon",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto Buso",
	Default = Settings["Auto Buso"] or true,
    Flag = "Auto Buso",
    Callback = function(Value)
        SaveSettings("Auto Buso",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto Turn On Haki Observation",
	Default = Settings["Auto Turn On Haki Observation"] or false,
    Flag = "Auto Turn On Haki Observation",
    Callback = function(Value)
        SaveSettings("Auto Turn On Haki Observation",Value)
	end    
})
Tab:AddToggle({
	Name = "Double Quest",
	Default = Settings["Double Quest"] or true,
    Flag = "Double Quest",
	Callback = function(Value)
        SaveSettings("Double Quest",Value)
	end    
})

Tab:AddToggle({
	Name = "Reset Teleport[Not Use Get Item Or ...]",
	Default = Settings["Reset Teleport"] or false,
    Flag = "Reset Teleport",
	Callback = function(Value)
        SaveSettings("Reset Teleport",Value)
	end    
})


function FFCMatch(Ins, Name)
    for k, v in pairs(Ins:GetChildren()) do
        if string.match(v.Name, Name) then
            return v
        end
    end
    return nil
end
local wait = wait
if game:GetService("UserInputService").TouchEnabled then 
    wait = task.wait()
end
spawn(function()
    while  wait() do
        if OrionLib.Flags["Auto Buso"].Value then
            pcall(function() 
                if 
                    not FFCMatch(plr.Character, "_BusoLayer1") and 
                    not plr.Character:FindFirstChild("HasBuso") 
                then
                    CommF:InvokeServer("Buso")
                    wait(2)
                end
            end)
        end
    end
end)
spawn(function()
    while  wait() do
        if OrionLib.Flags["Auto Turn On Haki Observation"].Value then
            pcall(function() 
                if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
                    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
                    game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
                    wait(3)
                end
            end)
        end
    end
end)
Tab:AddToggle({
    Name = "Auto Turn On Race v4",
    Default = Settings["Auto Turn On Race v4"] or false,
    Flag = "Auto Turn On Race v4",
    Callback = function(Value)
        SaveSettings("Auto Turn On Race v4",Value)
    end    
})
spawn(function()
    while  wait() do
        if OrionLib.Flags["Auto Turn On Race v4"].Value then
            pcall(function() 
                if game.Players.LocalPlayer.Character:FindFirstChild("RaceEnergy") 
                and game.Players.LocalPlayer.Character.RaceEnergy.Value >= 1 
                and game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") and not game.Players.LocalPlayer.Character.RaceTransformed.Value   then
                    local args = {
                        [1] = true
                    }
                    game:GetService("Players").LocalPlayer.Backpack.Awakening.RemoteFunction:InvokeServer(unpack(args))
                end
            end)
        end
    end
end)
Tab:AddToggle({
    Name = "Fast Attack",
    Default = Settings["Fast Attack"] or true,
    Flag = "Fast Attack",
    Callback = function(Value)
        SaveSettings("Fast Attack",Value)
    end    
})
Tab:AddToggle({
    Name = "Auto Click",
    Default = Settings["Auto Click"] or false,
    Flag = "Auto Click",
    Callback = function(Value)
        SaveSettings("Auto Click",Value)
    end    
})
Tab:AddDropdown({
	Name = "Select Speed Attack",
	Default =  Settings["Select Speed Attack"] or 0.1,
	Options = { 0,0.1,0.15,0.2},
    Flag = "Select Speed Attack",
	Callback = function(Value)
		SaveSettings("Select Speed Attack",Value)
	end    
})

spawn(function()
    loadstring([[
        local env = getgenv()
        local oldSkill
        oldSkill = hookfunction(require(game.ReplicatedStorage.Util).BodyMover.Create,function(p3,p4, p5)
            if p5.ID and env.OrionLib.Flags["No Stun"].Value then
                p5.Duration = 0
            end
            return oldSkill(p3,p4, p5)
        end)
        require(game:GetService("ReplicatedStorage").Util.CameraShaker):Stop()
        local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
        CameraShakerR:Stop()
    ]])()
end)
loadstring([[
    local MT = getrawmetatable(game)
    local OldNameCall = MT.__namecall
    setreadonly(MT, false)
    MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    local Args = {...}
    if Method == 'FireServer' and self.Name == 'RemoteEvent' and getgenv().psskill and (getgenv().OrionLib.Flags["Auto Mastery"].Value or getgenv().OrionLib.Flags["Auto Seabeast"].Value or OrionLib.Flags["Auto Aimbot"].Value or SeabeastAim or autospamskillTrial ) then
        if  #Args == 1 and typeof(Args[1]) == "Vector3" then
            Args[1] = getgenv().psskill.Position
        end
        if #Args == 1 and typeof(Args[1]) == "CFrame" then
            Args[1] = getgenv().psskill
        end
    end
    return OldNameCall(self, unpack(Args))
end)
setreadonly(MT, true)]])()
loadstring([[
    local olddd
    olddd = hookmetamethod(game, "__index", function(self, key)
        if tostring(key):lower()== 'hit' and getgenv().psskill and ((getgenv().OrionLib.Flags["Select Method Mastery"].Value == "Gun" and getgenv().OrionLib.Flags["Auto Mastery"].Value) or OrionLib.Flags["Auto Aimbot"].Value) then
            return getgenv().psskill
        end
    return olddd(self, key)
end)]])()
getgenv().CountAttack = 0
loadstring([[
    local env = getgenv()
    local old
    old = hookfunction(require(game:GetService("ReplicatedStorage").CombatFramework.RigLib).getBladeHits,function(...) 
        local a,b = ...
        local Magnitude = 50
        if not env.Fastattack and not env.StartAutoAttack then 
            Magnitude = 5
        end
        local returned = old(game.Players.LocalPlayer.Character,{game.Players.LocalPlayer.Character.HumanoidRootPart},Magnitude)
        if env.StartAutoAttack then
            local cac = {}
            local hash = {}
            for k, v in pairs(returned) do
                if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                    if v.Parent.Parent.Name == "Enemies" then
                        table.insert(cac, v.Parent.HumanoidRootPart)
                        hash[v.Parent] = true
                    end
                end
            end
            returned = cac
        end
        if #returned > 0  and env.Fastattack  then 
            if env.CountAttack == 0  then
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",b[1].Parent.Parent.Name)
                env.CountAttack = 1
            else 
                env.CountAttack = 0
            end
        end
        return returned
    end)
]])()


local up = getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
local ret = up[2]
function autoattack()
    if game.Players.LocalPlayer.Character.Stun.Value == 0 then
        spawn(function()
            ret.activeController:attack()
            ret.activeController.timeToNextAttack = 0
            ret.activeController.attacking = false
            ret.activeController.increment = 3
        end)
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Fast Attack"].Value then 
                getgenv().Fastattack = true 
            else
                getgenv().Fastattack = false
            end 
        end)
    end
end)
function DetectFastAttack()
    getgenv().StartAutoAttack = true
end
local CountAttack = 0

spawn(function()
    --[[while task.wait() do 
        pcall(function()
            if getgenv().StartAutoAttack  then
                autoattack()
                task.wait(OrionLib.Flags["Select Speed Attack"].Value+0.02)
                getgenv().StartAutoAttack = false 
            end
        end)
    end]]
    game:GetService("RunService").RenderStepped:connect(function()
        if getgenv().StartAutoAttack  then
            autoattack()
            task.wait(OrionLib.Flags["Select Speed Attack"].Value+0.01)
            getgenv().StartAutoAttack = false 
        end
    end)
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Click"].Value  then
                autoattack()
            end
        end)
    end
end)

function poscheckspawn(pos)
    dist = math.huge
    local name
    for i,v in next,game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates:GetChildren() do
        if v:IsA("Model") then
            local magnitude = (v.Part.Position - pos).magnitude
            if magnitude < dist then
                dist = magnitude
                name = v
            end
        end
    end
    return name
end
if game.PlaceId == 7449423635 then 
    TableLocations = {
        ["Caslte On The Sea"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
        ["Hydra"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
        ["Mansion"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
        ["Great Tree"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656),
        ["Temple Clock"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
    }
elseif game.PlaceId == 2753915549 then
    TableLocations = {
        ["FishmanSea1"] =  game:GetService("Workspace").Map.TeleportSpawn.EntrancePoint.Position,
        ["Island Sky 2"] =   game:GetService("Workspace").Map.SkyArea2.PathwayHouse.EntrancePoint.Position,
        ["Island Sky 1"] = game:GetService("Workspace").Map.SkyArea1.PathwayTemple.ExitPoint.Position,
    }
elseif game.PlaceId == 4442272183 then
    TableLocations = {
        ["GhostShipInterior"] = game:GetService("Workspace").Map.GhostShipInterior.TeleportSpawn.Position
    }
end
function toTarget(pos, targetPos, targetCFrame,TpInstant)
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Sit then
        getgenv().noclip = false
        if getgenv().Tween then
            getgenv().Tween:Pause()
            getgenv().Tween:Cancel()
        end
        game.Players.LocalPlayer.Character.Humanoid.Sit = false
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
        plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,10,0)
        return 
    end
    local aaa = Settings["Tween Speed"] or 160
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((targetPos - pos).Magnitude/aaa, Enum.EasingStyle.Quad)
    if game.PlaceId == 7449423635 and  (targetPos-Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586)).Magnitude > 3000 and  (Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586)-plr.Character.HumanoidRootPart.Position).Magnitude <= 3000 then 
        getgenv().Tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), TweenInfo.new((Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586) - plr.Character.HumanoidRootPart.Position).Magnitude/aaa, Enum.EasingStyle.Quad), {CFrame = CFrame.new(28609.392578125, 14896.533203125, 106.4216537475586)})
        getgenv().noclip = true
        getgenv().Tween:Play()
        if (Vector3.new(28609.392578125, 14896.533203125, 106.4216537475586)-plr.Character.HumanoidRootPart.Position).Magnitude < 8 then 
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","Check")
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("RaceV4Progress","TeleportBack")
            if getgenv().Tween then
                getgenv().Tween:Pause()
                getgenv().Tween:Cancel()
            end
        end
        return
    end
    if game.PlaceId == 2753915549 and (targetPos-game:GetService("Workspace").Map.TeleportSpawn.EntrancePoint.Position).Magnitude > 3000 and  (game:GetService("Workspace").Map.TeleportSpawn.EntrancePoint.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.6884765625, 6.736950397491455, -1926.214111328125))
        return 
    elseif game.PlaceId == 4442272183 and (targetPos-game:GetService("Workspace").Map.GhostShipInterior.TeleportSpawn.Position).Magnitude > 3000 and  (game:GetService("Workspace").Map.GhostShipInterior.TeleportSpawn.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 3000 then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",game:GetService("Workspace").Map.GhostShip.TeleportSpawn.Position)
        return 
    end
    if TableLocations then
        for i,v2 in pairs(TableLocations) do
            if  (targetPos-v2).Magnitude <= 3000 and  (targetPos-plr.Character.HumanoidRootPart.Position).Magnitude >= 3000 then
                if getgenv().Tween then
                    getgenv().Tween:Pause()
                    getgenv().Tween:Cancel()
                end
                args = {
                    "requestEntrance",
                    v2,
                }
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer(unpack(args))
                return 
            end
        end
    end
    if (not OrionLib.Flags["Auto Raid and Find DF"].Value)  and (targetPos-pos).Magnitude >= 3000 and  OrionLib.Flags["Reset Teleport"].Value and poscheckspawn(targetPos).Name ~= game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value   then
        if getgenv().Tween then
            getgenv().Tween:Pause()
            getgenv().Tween:Cancel()
        end
        plr.Character.LastSpawnPoint.Disabled = true
        local TimeReset = tick()
        repeat wait()
            plr.Character.LastSpawnPoint.Disabled = true
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SetLastSpawnPoint", poscheckspawn(targetPos).Name)
            plr.Character.HumanoidRootPart.CFrame = poscheckspawn(targetPos).Part.CFrame
            if tick()-TimeReset >= 3 and plr.Character.Humanoid.Health > 0 then
                plr.Character.Humanoid.Health = 0
                wait()
                TimeReset = tick()
            end
        until poscheckspawn(targetPos).Name == game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value or not OrionLib.Flags["Reset Teleport"].Value
        plr.Character.Humanoid.Health = 0
        repeat wait()
        until plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 
        return
    end
    if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health > 0 then
        if (targetPos-pos).Magnitude <= 200 and not OrionLib.Flags["Auto Chest"].Value  and not TpInstant then
            if getgenv().Tween then
                getgenv().Tween:Pause()
                getgenv().Tween:Cancel()
            end
            getgenv().noclip = true
            plr.Character.HumanoidRootPart.CFrame = targetCFrame
        else
            local a = Vector3.new(0,plr.Character:FindFirstChild("HumanoidRootPart").Position.Y,0) 
            local b = Vector3.new(0,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y,0)
            if (a-b).Magnitude <= 60 then
                plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame*CFrame.new(0,20,0)
            end
            getgenv().Tween = tween_s:Create(game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"), info, {CFrame = targetCFrame})
            getgenv().noclip = true
            getgenv().Tween:Play()
        end
    end
end

function sizepart(v)
    v.HumanoidRootPart.CanCollide = false
    if syn or Fluxus then
        v.Humanoid:ChangeState(11)
    else
        for i,x in next,v:GetDescendants() do 
            if (x:IsA("Part") or x:IsA("MeshPart")) and not string.find(v.Name,"Leg") and  x.CanCollide then 
                x.CanCollide = false 
            end
        end
    end
    if not v.HumanoidRootPart:FindFirstChild("vando") then
        local lock = Instance.new("BodyVelocity")
        lock.Parent = v
        lock.Name = "vando"
        lock.MaxForce = Vector3.new(100000, 100000, 100000)
        lock.Velocity = Vector3.new(0, 0, 0)
    end
end
game:GetService("RunService").RenderStepped:connect(function()
    sethiddenproperty(game.Players.LocalPlayer, "SimulationRadius", math.huge)
end)
getgenv().ButtonRipIndra = false
function ToggleNoclip()
    if OrionLib.Flags["Auto Farm"].Value
    or OrionLib.Flags["Elite Hunter"].Value 
    or OrionLib.Flags["Raid Castle"].Value
    or OrionLib.Flags["Auto Boss"].Value 
    or OrionLib.Flags["Auto Dough King"].Value
    or OrionLib.Flags["Citizen Quest"].Value 
    or OrionLib.Flags["Auto Seabeast"].Value
    or OrionLib.Flags["Soul Guitar"].Value
    or OrionLib.Flags["Cursed Dual Katana"].Value
    or OrionLib.Flags["Canvander"].Value
    or OrionLib.Flags["Buddy Sword"].Value
    or OrionLib.Flags["Yama"].Value
    or OrionLib.Flags["Tushita"].Value
    or OrionLib.Flags["Auto Raid and Find DF"].Value
    or OrionLib.Flags["Auto Rip Indra"].Value
    or  OrionLib.Flags["Auto Spawn Rip Indra"].Value
    or OrionLib.Flags["Auto Chest"].Value
    or OrionLib.Flags["Auto Get Blue Gear"].Value 
    or OrionLib.Flags["Pull Lever"].Value  
    or OrionLib.Flags["Upgrade Race V2-V3"].Value 
    or OrionLib.Flags["Auto Trial"].Value
    or OrionLib.Flags["Auto New World"].Value 
    or OrionLib.Flags["Auto Third Sea"].Value
    or NoclipButton  
    or OrionLib.Flags["Dragon Talon"].Value 
    or OrionLib.Flags["Electric Claw"].Value 
    or OrionLib.Flags["Sharkman Karate"].Value 
    or OrionLib.Flags["DeathStep"].Value
    or OrionLib.Flags["SuperHuman"].Value
    or OrionLib.Flags["Teleport Island"].Value
    or OrionLib.Flags["Auto Kill Player When complete Trial"].Value
    or OrionLib.Flags["Find DF"].Value
    or OrionLib.Flags["Auto Next Island"].Value
    or OrionLib.Flags["Teleport Mirage"].Value
    or OrionLib.Flags["Farm Observation"].Value
    or OrionLib.Flags["Auto Factory"].Value
    or OrionLib.Flags["Saber Sword"].Value
    or OrionLib.Flags["Farm Select Mob"].Value
    or OrionLib.Flags["Auto Get Cyborg"].Value
    or OrionLib.Flags["Auto Get Ghoul"].Value then
        return true 
    end
end

if syn   then
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")

    game:GetService('RunService').Stepped:connect(function()
        pcall(function()
            if getgenv().noclip and ToggleNoclip()  then
                if plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health ~= 0    then
                    plr.Character.Humanoid:ChangeState(11)
                end 
            end
        end)
    end)
else
    setfflag("HumanoidParallelRemoveNoPhysics", "False")
    setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
    if Fluxus then 
        function isnetworkowner2(p1)
            for i,v in next,game.Workspace.Characters:GetChildren() do 
                if v.Name ~= plr.Name and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-p1.Position).Magnitude <= 300 then 
                    return false 
                end
            end
            return true
        end
        function isnetworkowner(p1)
            local A = gethiddenproperty(plr,"SimulationRadius")
            local B = plr.Character or Wait(plr.CharacterAdded)
            local C = game.WaitForChild(B, "HumanoidRootPart", 300)
            if C then
                if p1.Anchored then
                    return false
                end
                if game.IsDescendantOf(p1, B) or (C.Position - p1.Position).Magnitude <= A then
                    return true
                end
            end
            return false
        end
    end
    function CreateTweenFloat()
        if not plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
            local BV = Instance.new("BodyVelocity")
            BV.Parent = plr.Character.HumanoidRootPart
            BV.Name = "EffectsSY"
            BV.MaxForce = Vector3.new(0, 100000, 0)
            BV.Velocity = Vector3.new(0, 0, 0)
        end
    end
    local LocalPlayer = game:GetService("Players").LocalPlayer   
    local function getTorso(LocalPlayer)
        if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if LocalPlayer.Character:FindFirstChild('UpperTorso') then
                return LocalPlayer.Character.UpperTorso
            else
                return LocalPlayer.Character.Torso
            end
        end
    end    
    game:GetService("RunService").RenderStepped:Connect(function()
        if getgenv().noclip and ToggleNoclip() then
            if LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
                for i,v in next,LocalPlayer.Character:GetDescendants() do 
                    if (v:IsA("Part") or v:IsA("MeshPart")) and  v.CanCollide then 
                        v.CanCollide = false 
                    end
                end
            end
        end
    end)
    game:GetService('RunService').Stepped:connect(function()
        pcall(function()
            if getgenv().noclip and ToggleNoclip() then
                if plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health ~= 0 then
                    spawn(function()
                        CreateTweenFloat()
                    end)
                end
            end
            spawn(function()
                pcall(function()
                    if not ToggleNoclip() then
                        if plr.Character.HumanoidRootPart:FindFirstChild("EffectsSY") then
                            plr.Character.HumanoidRootPart.EffectsSY:Destroy()
                        end
                    end
                end)
            end)
        end)
    end)
end
function getcenter(name)
    local count = 0
    local vec
    if string.find(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
            if v.Name == name  then  
                if vec == nil then
                    vec = v.Position
                    count = count + 1
                else
                    vec = vec + v.Position
                    count = count + 1
                end
            end
        end
        for i, v in pairs(getnilinstances()) do
            if v:IsA("Part") and v.Name == name  then  
                if vec == nil then
                    vec = v.Position
                    count = count + 1
                else
                    vec = vec + v.Position
                    count = count + 1
                end
            end
        end
    else
        for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do 
            if  v.Name == tostring(name:gsub(" %pLv. %d+%p", "")) then
                if vec == nil then
                    vec = v.Position
                    count = count + 1
                else
                    vec = vec + v.Position
                    count = count + 1
                end
            end
        end
        for i, v in pairs(getnilinstances()) do 
            if v:IsA("Part") and  v.Name == tostring(name:gsub(" %pLv. %d+%p", "")) then
                if vec == nil then
                    vec = v.Position
                    count = count + 1
                else
                    vec = vec + v.Position
                    count = count + 1
                end
            end
        end
    end
    vec = vec / count
    return CFrame.new(vec)
end
function DetectPartMobBring(name,a,b,c)
    local Mob = {}
    local name1 
    if string.find(name,"Lv.") then 
        name1 = name:gsub(" %pLv. %d+%p", "")
    end
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if  v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            table.insert(Mob,v)
        end
    end
    for i, v in pairs(getnilinstances()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            table.insert(Mob,v)
        end
    end
    if b then
        local dist = math.huge
        local Closest
        for i,v in next,Mob do 
            local conconcac = (a.HumanoidRootPart.Position-v.Position).Magnitude
            if dist > conconcac then 
                dist = conconcac 
                Closest = v 
            end
        end
        return Closest
    else
        local mob2 = {}
        for i,v in next,Mob do 
            if (c.Position-v.Position).Magnitude <= 300 then 
                table.insert(mob2,v)
            end
        end
        if #mob2 < #Mob then 
            print("condimemay")
            return true 
        end
    end
end

local CenterMob
local NameMobBring 
local PosBring
local PositionBring

function DeleteIgnoredMob()
    for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Ignored")  then 
            v.Ignored:Destroy()
        end
    end
end
function BringMob(a)
    --[[
    if a and not NameMobBring then 
        if (a.HumanoidRootPart.Position-getcenter(a.Name)).Magnitude < 250  then 
            PosBring = getcenter(a.Name)
        else
            PosBring = a.HumanoidRootPart.Position
        end
        NameMobBring = a.Name 
        return 
    elseif NameMobBring ~= a.Name then 
        if (a.HumanoidRootPart.Position-getcenter(a.Name)).Magnitude < 250  then 
            PosBring = getcenter(a.Name)
        else
            PosBring = a.HumanoidRootPart.Position
        end
        NameMobBring = a.Name 
        return 
    end
    if (plr.Character.HumanoidRootPart.Position-a.HumanoidRootPart.Position).Magnitude <= 100 then
        for i,v in pairs(game.workspace.Enemies:GetChildren()) do
            if v.Name == a.Name  and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isnetworkowner(v.HumanoidRootPart)  then 
                if PosBring  and v.Name == "Chief Petty Officer [Lv. 120]" and (v.HumanoidRootPart.Position-a.HumanoidRootPart.Position).Magnitude <= 250 then
                    v.HumanoidRootPart.CFrame = CFrame.new(a.HumanoidRootPart.Position)
                    sizepart(v)
                elseif (v.HumanoidRootPart.Position-PosBring).Magnitude <= 250 then
                    v.HumanoidRootPart.CFrame = CFrame.new(PosBring)
                    sizepart(v)
                end
            end
        end
    end]]
    if a and NameMobBring ~= a then
        NameMobBring = a 
        --PositionBring = DetectPartMobBring(a.Name,a).CFrame
        PositionBring = getcenter(a.Name)
        if DetectPartMobBring(a.Name,a,false,PositionBring) then
            PositionBring = DetectPartMobBring(a.Name,a,true).CFrame
        end
        DeleteIgnoredMob()
    end
    if (plr.Character.HumanoidRootPart.Position-a.HumanoidRootPart.Position).Magnitude <= 100 then
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == a.Name and not v:FindFirstChild("Ignored") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isnetworkowner(v.HumanoidRootPart) and isnetworkowner2(v.HumanoidRootPart) then 
                if  (v.HumanoidRootPart.Position-PositionBring.Position).Magnitude <= 350 then
                    v.HumanoidRootPart.CFrame = PositionBring 
                    sizepart(v)
                end
            end
        end
        for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
            if v.Name == a.Name and not v:FindFirstChild("Ignored") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 and isnetworkowner(v.HumanoidRootPart) and isnetworkowner2(v.HumanoidRootPart) then 
                if  (v.HumanoidRootPart.Position-PositionBring.Position).Magnitude <= 350 then
                    local oldhealthmob = v.Humanoid.Health
                    wait(3.5)
                    if v.Humanoid.Health == oldhealthmob then 
                        local Ignored = Instance.new("IntValue", v)
                        Ignored.Name = "Ignored"
                        wait(0.3)
                    end
                end
            end
        end
    end
end
function checkcountitem(x,xx)
    for i,v in next,game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
        if v.Name == x and v.Count >= xx then
            return true
        end
    end
    return false
end
function CheckNameBoss(a)
    for i,v in next,game.ReplicatedStorage:GetChildren() do
        if v:IsA("Model") and  ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
    for i,v in next,game.Workspace.Enemies:GetChildren() do
        if v:IsA("Model") and ((typeof(a) == "table" and table.find(a, v.Name)) or v.Name == a)  and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v
        end
    end
end
function equiptool(toolname,x)
    if not x then
        if  OrionLib.Flags["Dragon Talon"].Value 
        or OrionLib.Flags["Electric Claw"].Value 
        or OrionLib.Flags["Sharkman Karate"].Value 
        or OrionLib.Flags["DeathStep"].Value
        or OrionLib.Flags["SuperHuman"].Value then 
            if plr.Backpack:FindFirstChild(NameWeapon("Melee"))  then
                plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(NameWeapon("Melee")))
            end
        else
            if plr.Backpack:FindFirstChild(toolname)  then
                plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(toolname))
            end
        end
    else
        if plr.Backpack:FindFirstChild(toolname)  then
            plr.Character.Humanoid:EquipTool(plr.Backpack:FindFirstChild(toolname))
        end
    end
end
function NameWeapon(x)
    local a 
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == x  then
            a = v.Name
        end
    end
    for i,v in next, game.Players.LocalPlayer.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == x  then
            a = v.Name
        end
    end
    return a 
end
local MobKatakuri = {
    "Baking Staff [Lv. 2250]",
    "Head Baker [Lv. 2275]",
    "Cake Guard [Lv. 2225]",
    "Cookie Crafter [Lv. 2200]"
}
local MobConjuredCocoa = {
    "Cocoa Warrior [Lv. 2300]",
    "Chocolate Bar Battler [Lv. 2325]",
    "Candy Rebel [Lv. 2375]",
    "Sweet Thief [Lv. 2350]",
}
local TableEliteHunter = {
    "Deandre [Lv. 1750]",
    "Urban [Lv. 1750]",
    "Diablo [Lv. 1750]",
}
local TableMobBones = {
    "Reborn Skeleton [Lv. 1975]",
    "Demonic Soul [Lv. 2025]",
    "Living Zombie [Lv. 2000]",
    "Posessed Mummy [Lv. 2050]",
}
local MobBlacklist = {}
function DetectPartSpawnMob(name)
    local name1 
    if string.find(name,"Lv.") then 
        name1 = name:gsub(" %pLv. %d+%p", "")
    end
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if  v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            return v 
        end
    end
    for i, v in pairs(getnilinstances()) do
        local stringgsub
        if string.find(v.Name, "Lv.") then 
            stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        end
        if v:IsA("Part") and ((stringgsub and stringgsub == name) or name == v.Name or (name1 and v.Name == name1)) then
            return v 
        end
    end
end
function TeleportSpawnMob(Path,value)
    if typeof(Path) == "table" then
        if #MobBlacklist >= 4 then 
            MobBlacklist = {}
            return 
        end
        local GetPart
        for i,v in next,Path do
            if not table.find(MobBlacklist,v) then
                GetPart = DetectPartSpawnMob(v)
                repeat wait()
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPart.Position,GetPart.CFrame*CFrame.new(0,60,0))
                until  (GetPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 100 or DetectMob(Path) or not value
            end
        end
    else
        GetPart = DetectPartSpawnMob(Path)
        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPart.Position,GetPart.CFrame*CFrame.new(0,60,0))
    end
end
function DetectMob(c)
    local dist = math.huge
    local name 
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        local stringgsub = v.Name:gsub(" %pLv. %d+%p", "")
        if  ((typeof(c) == "table" and (table.find(c, v.Name) or table.find(c, stringgsub))) or (v.Name == c or c == stringgsub)) and v:IsA('Model') and v:FindFirstChild('Humanoid') and v.Humanoid.Health > 0 and v:FindFirstChild('HumanoidRootPart') then
            local magnitude = (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if magnitude < dist then
                dist = magnitude
                name = v
            end
        end
    end
    return name
end
local Section = Tab:AddSection({
	Name = "Farm Main"
})
Tab:AddDropdown({
	Name = "Select Method Farm",
	Default =  Settings["Select Method Farm"] or "Level Farm",
	Options = { 'Level Farm', 'Farm Bones', 'Farm Katakuri'},
    Flag = "Select Method Farm",
	Callback = function(Value)
		SaveSettings("Select Method Farm",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto Farm",
	Default = Settings["Auto Farm"] or false,
    Flag = "Auto Farm",
	Callback = function(Value)
        SaveSettings("Auto Farm",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto New World",
	Default = Settings["Auto New World"] or false,
    Flag = "Auto New World",
	Callback = function(Value)
        SaveSettings("Auto New World",Value)
	end    
})
Tab:AddToggle({
	Name = "Auto Third Sea",
	Default = Settings["Auto Third Sea"] or false,
    Flag = "Auto Third Sea",
	Callback = function(Value)
        SaveSettings("Auto Third Sea",Value)
	end    
})
local TabMastery =  Tab:AddToggle({
	Name = "Auto Mastery",
	Default =  false,
    Flag = "Auto Mastery",
	Callback = function(Value)
        if not OrionLib.Flags["Auto Farm"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Auto Farm, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
	end    
})
print(TabMastery)
Tab:AddDropdown({
	Name = "Select Method Mastery",
	Default =  "Blox Fruit",
	Options = {"Blox Fruit","Gun"},
    Flag = "Select Method Mastery",
	Callback = function(Value)
	end    
})
Tab:AddSlider({
    Name = "% Health Mob",
    Min = 0,
    Max = 100,
    Default = 40,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "% Health Mob",
    Flag = "% Health Mob",
    Callback = function(Value)
    end    
})
Tab:AddToggle({
	Name = "Use Skill Z",
	Default =  false,
    Flag = "Z",
	Callback = function(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Skill X",
	Default =  false,
    Flag = "X",
	Callback = function(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Skill C",
	Default =  false,
    Flag = "C",
	Callback = function(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Skill V",
	Default =  false,
    Flag = "V",
	Callback = function(Value)
	end    
})
Tab:AddToggle({
	Name = "Use Skill F",
	Default =  false,
    Flag = "F",
	Callback = function(Value)
	end    
})
function CFrameQuest()
    getgenv().QuestPoses = {}
    for i, v in pairs(getnilinstances()) do 
        if v:IsA("Model")
        and v:FindFirstChild("Head")
        and v.Head:FindFirstChild("QuestBBG")
        and v.Head.QuestBBG.Title.Text == "QUEST" then
            getgenv().QuestPoses[v.Name] = v.Head.CFrame * CFrame.new(0, -2, 2)    
        end
    end

    for i, v in pairs(game.Workspace.NPCs:GetDescendants()) do 
        if v.Name == "QuestBBG"
        and v.Title.Text == "QUEST" then
            getgenv().QuestPoses[v.Parent.Parent.Name] = v.Parent.Parent.Head.CFrame * CFrame.new(0, -2, 2)    
        end
    end

    getgenv().DialoguesList = {}
    for i, v in pairs(require(game.ReplicatedStorage.DialoguesList)) do
        getgenv().DialoguesList[v] = i
    end

    local kiet = getscriptclosure(game:GetService("Players").LocalPlayer.PlayerScripts.NPC)

    local listremote = {}
    for k,v in pairs(debug.getprotos(kiet)) do 
        if #debug.getconstants(v)==1 then 
            table.insert(listremote, debug.getconstant(v,1))    
        end 
    end
    local start=false
    local listtvk = {}
    for k,v in pairs(debug.getconstants(kiet)) do
        if type(v) == "string" then 
            if v == "Players" then 
                start = false
            end
            if not start then 
                if v == "Blox Fruit Dealer" then 
                    start = true    
                end  
            else
            end
            if start then 
                table.insert(listtvk,v)    
            end
        end   
    end
    local questpoint1 = {}
    getgenv().questpoint = {}

    for k,v in pairs(listtvk) do 
        if QuestPoses[v] then 
            questpoint1[listremote[k]]=listtvk[k]    
        end
    end

    for i,v in next, questpoint1 do
        getgenv().questpoint[i] = QuestPoses[v]
    end
    getgenv().questpoint["SkyExp1Quest"] = CFrame.new(-7857.28516, 5544.34033, -382.321503, -0.422592998, 0, 0.906319618, 0, 1, 0, -0.906319618, 0, -0.422592998)
end
CFrameQuest()
local UselessQuest = {
    "BartiloQuest",
    "Trainees",
    "MarineQuest",
    "CitizenQuest"
}
local MobsList = {}
getgenv().mob = ''
getgenv().mobv = ""
local Quest = require(game.ReplicatedStorage.Quests)
local function checkquest()
    local lvlPl = plr.Data.Level.Value
    local min = 0
    if lvlPl >= 1450 and game.PlaceId == 4442272183 then 
        getgenv().mobv = "Water Fighter"
        getgenv().mobvv = "ForgottenQuest"
        getgenv().mobvvv = 2
    elseif lvlPl >= 700 and game.PlaceId == 2753915549 then
        getgenv().mobv = "Galley Captain"
        getgenv().mobvv = "FountainQuest"
        getgenv().mobvvv = 2
    else
        for i,v in pairs(Quest) do
            for i1,v1 in pairs(v) do
                local lvlreq = v1.LevelReq
                for i2,v2 in pairs(v1.Task) do
                    if lvlPl >= lvlreq and lvlreq >= min and v1.Task[i2] > 1 and not table.find(UselessQuest, tostring(i)) then
                        min = lvlreq
                        getgenv().mobv = tostring(i2)
                        getgenv().mobvv = i
                        getgenv().mobvvv = i1
                    end
                end
            end
        end
    end
end
function checkdoublquest()
    local a = {}
    for i,v in pairs(Quest) do
        for i1,v1 in pairs(v) do
            local lvlreq = v1.LevelReq
            for i2,v2 in pairs(v1.Task) do
                if i2 == getgenv().mobv then
                    for i3,v3 in next,v do
                        if v3.LevelReq <= game.Players.LocalPlayer.Data.Level.Value and v3.Name ~= "Town Raid" then
                            for i4,v4 in next,v3.Task do
                                if v4 > 1 then
                                    table.insert(a,i4)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return a 
end
local v17 = require(game.ReplicatedStorage:WaitForChild("GuideModule"));
function checkquestdata()
    for i,v in next,v17.Data do
        if i == "QuestData" then
            return true
        end
    end
    return false
end
function checknamedoublquest()
    local a 
    if checkquestdata() then
        for i,v in next,v17.Data.QuestData.Task do
            a = i 
        end
    end
    return a 
end
function doublequestdeptrai()
    checkquest()
    local aa = {}
    if OrionLib.Flags["Double Quest"].Value and checkquestdata() and  checknamedoublquest() == getgenv().mobv  and #checkdoublquest() >= 2 then
        for i,v in pairs(Quest) do
            for i1,v1 in pairs(v) do
                for i2,v2 in pairs(v1.Task) do
                    if tostring(i2) == getgenv().mobv then
                        for quest1,quest2 in next,v do
                            for quest3,quest4 in next,quest2.Task do
                                if  quest3 ~= getgenv().mobv and quest4 > 1 then
                                    aa["Name"] = tostring(quest3)
                                    aa["NameQuest"] = i
                                    aa["ID"] = quest1
                                    return aa
                                end
                            end
                        end
                    end
                end
            end
        end
    else
        aa["Name"] = getgenv().mobv
        aa["NameQuest"] = getgenv().mobvv
        aa["ID"] = getgenv().mobvvv
        return aa
    end
end
function teleportquestdeptrai(i)
    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,getgenv().questpoint[tostring(i)].Position,getgenv().questpoint[tostring(i)]*CFrame.new(0,4,2),true)
end
function getquest()
    if not getgenv().questpoint[tostring(doublequestdeptrai().NameQuest)] then
        CFrameQuest()
        return 
    end
    if (getgenv().questpoint[tostring(doublequestdeptrai().NameQuest)].Position-plr.Character.HumanoidRootPart.Position).magnitude <= 8 then
        wait(1)
        if plr.Character.Humanoid.Health > 0 then 
            CommF:InvokeServer("StartQuest", tostring(doublequestdeptrai().NameQuest), doublequestdeptrai().ID)
        end
    else
        teleportquestdeptrai(doublequestdeptrai().NameQuest)
    end
end
function checkskillMastery(x)
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[x]:GetChildren() do 
        if v:IsA("Frame")  then
            if v.Name ~= "Template" and OrionLib.Flags[v.Name].Value and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end
function WeaponsMastery()
    local a
    for i,v in next,plr.Backpack:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == OrionLib.Flags["Select Method Mastery"].Value then
            a = v.Name 
        end
    end
    for i,v in next,plr.Character:GetChildren() do
        if v:IsA("Tool") and v.ToolTip == OrionLib.Flags["Select Method Mastery"].Value then
            a = v.Name 
        end
    end
    return a 
end
local StartFarm = true
local RaidCastleStart = false
local EletrciClawStart = false
function StopFarm()
    if OrionLib.Flags["Find DF"].Value and GetPathFruit() then 
        StartFarm = false 
        return 
    end
    if  CheckNameBoss("Core")  and game.PlaceId == 4442272183 and OrionLib.Flags["Auto Factory"].Value then 
        StartFarm = false 
        return  
    end
    if RaidStart then 
        StartFarm = false 
        return 
    end
    if StopThirdSea() then StartFarm = false return end
    if game.PlaceId == 2753915549 and plr.Data.Level.Value >= 700 and OrionLib.Flags["Auto New World"].Value then StartFarm = false return end
    if OrionLib.Flags["Raid Castle"].Value and RaidCastleStart  then StartFarm = false  return end  
    if OrionLib.Flags["Elite Hunter"].Value and DetectEliteHunter()  then
        StartFarm = false 
        return  
    end  
    if EletrciClawStart then
        return 
    end 
    if CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") and OrionLib.Flags["Auto Rip Indra"].Value then  
        StartFarm = false 
        return 
    end
    if OrionLib.Flags["Auto Spawn Rip Indra"].Value and ( plr.Backpack:FindFirstChild("God's Chalice") or  plr.Character:FindFirstChild("God's Chalice")) then 
        StartFarm = false 
        return 
    end
    StartFarm = true
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Farm"].Value then 
                StopFarm()
            end
        end)
    end
end)
local QuestKillPlayer = false
blnamequest = {}
function DetectKillPlayerQuest()
    local namequest = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat ","")
    namequest = string.gsub(namequest," %p(0/1)%p","")
    if plr.PlayerGui.Main:FindFirstChild("Quest").Visible  and not game:GetService("Workspace").Characters:FindFirstChild(namequest) then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        print(namequest)
    end
    if game.Players[namequest].Data.Level.Value >= 20 and game.Players[namequest].Data.Level.Value >= 150 then 
        table.insert(blnamequest,namequest)
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        print(namequest,game.Players[namequest].Data.Level.Value)
        return 
    end
end

function checksafezone(p)
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].SafeZones:GetChildren()) do
        if v:IsA("Part") then
            if (v.Position-p.HumanoidRootPart.Position).magnitude <= 400 and p.Humanoid.Health / p.Humanoid.MaxHealth >= 90/100 then
                return true
            end
        end
    end
    return false
end

function FarmMethod()
    if not StartFarm then 
        return 
    end
    local MethodFarm 
    local LevelQuest
    local NameQuest 
    local IDQuest = 2
    if OrionLib.Flags["Select Method Farm"].Value == "Farm Katakuri" then
        MethodFarm = MobKatakuri
        NameQuest = "CakeQuest2"
        LevelQuest = 2275
    elseif OrionLib.Flags["Select Method Farm"].Value == "Farm Bones" then
        MethodFarm = TableMobBones
        NameQuest = "HauntedQuest2"
        LevelQuest = 2050
    end
    if MethodFarm then
        if plr.Data.Level.Value >= LevelQuest and not plr.PlayerGui.Main:FindFirstChild("Quest").Visible then  
            if not getgenv().questpoint[NameQuest] then
                CFrameQuest()
                return 
            end
            if (getgenv().questpoint[NameQuest].Position-plr.Character.HumanoidRootPart.Position).magnitude <= 8 then
                wait(1)
                if plr.Character.Humanoid.Health > 0 then 
                    CommF:InvokeServer("StartQuest", NameQuest, IDQuest)
                end
            else
                teleportquestdeptrai(NameQuest)
            end
            return 
        end
        if  OrionLib.Flags["Select Method Farm"].Value == "Farm Katakuri"  then 
            if CheckNameBoss("Cake Prince [Lv. 2300] [Raid Boss]")  then
                local v = CheckNameBoss("Cake Prince [Lv. 2300] [Raid Boss]")
                repeat wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,-20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Farm"].Value
                return
            else
                local v204 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
                if v204:find("open the portal now") then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                end 
            end
        end
        if not DetectMob(MethodFarm) then 
            TeleportSpawnMob(MethodFarm, ( not StartFarm  or OrionLib.Flags["Auto Farm"].Value))
        else
            local v = DetectMob(MethodFarm)
            repeat wait()
                task.spawn(function()
                    BringMob(v)
                end)
                sizepart(v)
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                if OrionLib.Flags["Auto Mastery"].Value then
                    getgenv().psskill = v.HumanoidRootPart.CFrame
                    if v.Humanoid.Health / v.Humanoid.MaxHealth > OrionLib.Flags["% Health Mob"].Value/100  then 
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    else
                        if OrionLib.Flags["Select Method Mastery"].Value == "Gun" then 
                            game:GetService "VirtualUser":CaptureController()
                            game:GetService "VirtualUser":Button1Down(Vector2.new(50, 50))
                        end
                        equiptool(WeaponsMastery())
                        local condimebeo = checkskillMastery(WeaponsMastery())
                        game:GetService("VirtualInputManager"):SendKeyEvent(true, condimebeo, false, game)
                        wait(0.5)
                        game:GetService("VirtualInputManager"):SendKeyEvent(false, condimebeo, false, game)
                        return 
                    end 
                else
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                end
                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                    DetectFastAttack()
                end
            until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Farm"].Value or not StartFarm
        end
    else
        local MobLevelFarm = checknamedoublquest() or ""
        if game.PlaceId == 2753915549 then 
            --[[if #blnamequest >= 6  then
                    HopServer()
                return
            end
            QuestKillPlayer = false
            local namequest = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,"Defeat ","")
            namequest = string.gsub(namequest," %p(0/1)%p","")
            if not QuestKillPlayer and plr.Data.Level.Value >= 35 then 
                game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("PlayerHunter")
            end
            if plr.PlayerGui.Main:FindFirstChild("Quest").Visible and namequest and  game:GetService("Workspace").Characters:FindFirstChild(namequest) then
                QuestKillPlayer = true
                DetectKillPlayerQuest()
                for i,v in next,game:GetService("Workspace").Characters:GetChildren() do
                    if v:IsA("Model") and v.Name == namequest then
                        repeat wait()
                            if game.Players.LocalPlayer.PlayerGui.Main.PvpDisabled.Visible  then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                            end
                            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                DetectFastAttack()
                            end
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        until not v or not v.Parent or v.Humanoid.Health <= 0 or not OrionLib.Flags["Auto Farm"].Value or not plr.PlayerGui.Main:FindFirstChild("Quest").Visible or checksafezone(v) or StartFarm
                    end
                end
                return 
            end]]
            if  plr.Data.Level.Value < 120 and plr.Data.Level.Value >= 10 then
                MobLevelFarm = {"Royal Squad [Lv. 525]","Shanda [Lv. 475]"}
            end
        end
        --[[if QuestKillPlayer then 
            return 
        end]]
        if not plr.PlayerGui.Main:FindFirstChild("Quest").Visible and typeof(MobLevelFarm) ==  "string" then
            getquest()
        else
            if not DetectMob(MobLevelFarm) then
                TeleportSpawnMob(MobLevelFarm,(not StartFarm  or OrionLib.Flags["Auto Farm"].Value))
            else
                local v = DetectMob(MobLevelFarm)
                repeat wait()
                    task.spawn(function()
                        BringMob(v)
                    end)
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if OrionLib.Flags["Auto Mastery"].Value then
                        getgenv().psskill = v.HumanoidRootPart.CFrame
                        if v.Humanoid.Health / v.Humanoid.MaxHealth > OrionLib.Flags["% Health Mob"].Value/100  then 
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                        else
                            if OrionLib.Flags["Select Method Mastery"].Value == "Gun" then 
                                game:GetService "VirtualUser":CaptureController()
                                game:GetService "VirtualUser":Button1Down(Vector2.new(50, 50))
                            end
                            equiptool(WeaponsMastery())
                            local condimebeo = checkskillMastery(WeaponsMastery())
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, condimebeo, false, game)
                            wait(0.5)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, condimebeo, false, game)
                            return 
                        end 
                    else
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    end
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Farm"].Value or not StartFarm
            end
        end
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Farm"].Value then 
                FarmMethod()
            end
        end)
    end
end)

function NewWorld()
    if game.PlaceId == 2753915549 and plr.Data.Level.Value >= 700 then
        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("DressrosaQuestProgress", "Dressrosa") ~= 0 then
            if game.Workspace.Map.Ice.Door.CanCollide then
                if not plr.Character:FindFirstChild("Key") and not plr.Backpack:FindFirstChild("Key") then 
                    if (CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359).Position - plr.Character.HumanoidRootPart.Position).magnitude < 5 then
                        game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("DressrosaQuestProgress", "Detective")
                        equiptool("Key",true)
                    else
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,Vector3.new(4852.2895507813, 5.651451587677, 718.53070068359),CFrame.new(4852.2895507813, 5.651451587677, 718.53070068359))
                    end
                else
                    equiptool("Key",true)
                    if plr.Character:FindFirstChild("Key") then
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game.Workspace.Map.Ice.Door.Position,game.Workspace.Map.Ice.Door.CFrame)
                    end
                end
            else
                local folder = game.workspace.Enemies
                if game.ReplicatedStorage:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
                    folder = game.ReplicatedStorage
                end
                for i,v in pairs(folder:GetChildren()) do
                    if v.Name == "Ice Admiral [Lv. 700] [Boss]" then
                        if v:FindFirstChild("Humanoid") and v.Humanoid.Health ~= 0 then
                            repeat wait()
                                sizepart(v)
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,0))
                                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                    DetectFastAttack()
                                end
                                equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            until v.Humanoid.Health <= 0 or not OrionLib.Flags["Auto New World"].Value 
                        end
                    end
                end
            end
        else
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
        end
    end
end
function checkplatebarito()
    local a  
    if game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1.BrickColor == BrickColor.new("Sand yellow") then 
        a = "Plate1"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate2"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate3"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate4"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate5"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate6"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate7"
    elseif game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8.BrickColor == BrickColor.new("Sand yellow") then
        a = "Plate8"
    end
    return a 
end
local StopStoreFruit = false
cframethangdaubuoiredhead = CFrame.new(-1926.78772, 12.1678171, 1739.80884, 0.956294656, -0, -0.292404652, 0, 1, -0, 0.292404652, 0, 0.956294656)
function StopThirdSea()
    if OrionLib.Flags["Auto Third Sea"].Value  and game.PlaceId == 4442272183 and plr.Data.Level.Value >= 1500 then
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then 
                if #getbackpack() >= 1 then
                    return true
                elseif not checkdevilfruit()  and getfruitstore()  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore())
                end
            elseif not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")  then 
                if CheckNameBoss("Don Swan [Lv. 1000] [Boss]") then
                    return true
                end
            elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                return true
            end
        else
            if (OrionLib.Flags["Sharkman Karate"].Value and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 3) 
            or (OrionLib.Flags["DeathStep"].Value and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 3)
            or (OrionLib.Flags["Superhuman"].Value and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true) ~= 1) then 
                return true
            end
            return 
        end
    end
end
function SeaThird()
    if game.PlaceId == 4442272183 and plr.Data.Level.Value >= 1500 and StopThirdSea() then
        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3 then
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 0 then 
                if #getbackpack() >= 1 then
                    toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-339.79840087891, 331.86065673828, 643.83178710938),CFrame.new(-339.79840087891, 331.86065673828, 643.83178710938))
                    if (Vector3.new(-339.79840087891, 331.86065673828, 643.83178710938)-plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") ~= 1 then
                            for i,v in next, getbackpack() do
                                plr.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild(v))
                            end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "1")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "2")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "3")
                            StopStoreFruit = false                     
                        end
                    end
                elseif not checkdevilfruit()  and getfruitstore()  then
                    StopStoreFruit = true 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore())
                end
            elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TalkTrevor", "1") == 0 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 1 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Zou") == 0 then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
            elseif not game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check")  then
                if CheckNameBoss("Don Swan [Lv. 1000] [Boss]") then
                    local v = CheckNameBoss("Don Swan [Lv. 1000] [Boss]")
                    repeat wait()
                        if game.ReplicatedStorage:FindFirstChild("Don Swan [Lv. 1000] [Boss]") then 
                            if getgenv().Tween then
                                getgenv().Tween:Pause()
                                getgenv().Tween:Cancel()
                            end
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance", Vector3.new(2284.912109375, 15.537666320801, 905.48291015625))
                            return 
                        end
                        plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    until v.Humanoid.Health <= 0 or not v
                end
            elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("ZQuestProgress", "Check") == 0 then
                if (plr.Character.HumanoidRootPart.Position-game:GetService("Workspace").Map.IndraIsland.Part.Position).Magnitude > 1000 then
                    toTarget(plr.Character.HumanoidRootPart.Position,cframethangdaubuoiredhead.p,cframethangdaubuoiredhead)
                    if (cframethangdaubuoiredhead.p-plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress","Begin")
                    end
                else
                    for i,v in next, workspace.Enemies:GetChildren() do
                        if v.Name == "rip_indra [Lv. 1500] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            if (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 300 then
                                toTarget(plr.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame)
                            else
                                repeat wait()
                                    DetectFastAttack()
                                    plr.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,20,0)
                                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                                until not workspace.Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]")
                            end
                        end
                    end
                end
            end
        else
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") 
                and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible  then
                    if not DetectMob("Swan Pirate [Lv. 775]") then 
                        TeleportSpawnMob("Swan Pirate [Lv. 775]",OrionLib.Flags["Auto Third Sea"].Value)
                    else
                        local v = DetectMob("Swan Pirate [Lv. 775]")
                        repeat wait()
                            sizepart(v)
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                DetectFastAttack()
                            end
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            task.spawn(function()
                                BringMob(v)
                            end)
                        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Third Sea"].Value
                    end
                else
                    if (plr.Character.HumanoidRootPart.Position-CFrame.new(-456.28952, 73.0200958, 299.895966).Position).Magnitude > 8 then
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-456.28952, 73.0200958, 299.895966).Position,CFrame.new(-456.28952, 73.0200958, 299.895966))
                    else
                        local args = {
                            [1] = "StartQuest",
                            [2] = "BartiloQuest",
                            [3] = 1
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                local v = CheckNameBoss("Jeremy [Lv. 850] [Boss]")
                if v then
                    repeat wait()
                        sizepart(v)
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Third Sea"].Value
                end
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                repeat wait()
                    if (plr.Character.HumanoidRootPart.Position-Vector3.new(-1835.65, 10.4325, 1679.75)).Magnitude > 100 then
                        toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-1835.65, 10.4325, 1679.75),CFrame.new(-1835.65, 10.4325, 1679.75))
                    else
                        plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()].CFrame
                        wait()
                        firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                        firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                    end
                until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3
            end
        end
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto New World"].Value then 
                NewWorld()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Third Sea"].Value then 
                SeaThird()
            end
        end)
    end
end)
local Section = Tab:AddSection({
	Name = "Farm Main"
})
Tab:AddToggle({
	Name = "Auto Factory",
	Default = Settings["Auto Factory"] or false,
    Flag = "Auto Factory",
	Callback = function(Value)
        SaveSettings("Auto Factory",Value)
	end
})
local ToggleEliteHunter =Tab:AddToggle({
	Name = "Elite Hunter",
	Default = Settings["Elite Hunter"] or false,
    Flag = "Elite Hunter",
	Callback = function(Value)
        SaveSettings("Elite Hunter",Value)
	end
})
Tab:AddToggle({
	Name = "Raid Castle",
	Default = Settings["Raid Castle"] or false,
    Flag = "Raid Castle",
	Callback = function(Value)
        SaveSettings("Raid Castle",Value)
	end
})
function DetectEliteHunter()
    for i,v in next,game:GetService("ReplicatedStorage"):GetChildren() do
        if v:IsA("Model") and table.find(TableEliteHunter,v.Name) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v 
        end
    end
    for i,v in next,game:GetService("Workspace").Enemies:GetChildren() do
        if v:IsA("Model") and table.find(TableEliteHunter,v.Name) and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
            return v 
        end
    end
end
function AutoEliteHunter()
    if StartTeleportSafe() then 
        return 
    end
    if RaidStart then 
        return 
    end 
    if CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") and OrionLib.Flags["Auto Rip Indra"].Value then   return end
    if OrionLib.Flags["Auto Spawn Rip Indra"].Value and ( plr.Backpack:FindFirstChild("God's Chalice") or  plr.Character:FindFirstChild("God's Chalice")) then  return end
    if  DetectEliteHunter() then 
        if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,DetectEliteHunter().Name:gsub(" %pLv. %d+%p", "")) 
        or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
        else
            local v = DetectEliteHunter()
            repeat wait()
                sizepart(v)
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                    DetectFastAttack()
                end
                equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
            until not v or not v.Parent or v.Humanoid.Health == 0   or not OrionLib.Flags["Elite Hunter"].Value or (OrionLib.Flags["Raid Castle"].Value and DetectMobRaidCastle()) or RaidStart
        end
    else
        if OrionLib.Flags["Hop Cup"].Value and not plr.Backpack:FindFirstChild("God's Chalice") and not plr.Character:FindFirstChild("God's Chalice") then
            HopServer()
        end
    end
end
function DetectMobRaidCastle()
    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
        if v:FindFirstChild("HumanoidRootPart")
        and (v.HumanoidRootPart.Position - Vector3.new(-5543.5327148438, 313.80062866211, -2964.2585449219)).magnitude <= 1000
        and not string.find(v.Name, "Boss") and v.Humanoid.Health > 0 then
            return v 
        end
    end
end

function RaidCastle()
    if StartTeleportSafe() then 
        return 
    end
    if RaidStart then return end 
    if CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]") and OrionLib.Flags["Auto Rip Indra"].Value then   return end
    if OrionLib.Flags["Auto Spawn Rip Indra"].Value and ( plr.Backpack:FindFirstChild("God's Chalice") or  plr.Character:FindFirstChild("God's Chalice")) then  return end
    if DetectMobRaidCastle() then
        local v = DetectMobRaidCastle()
        repeat wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0 or not OrionLib.Flags["Raid Castle"].Value or RaidStart
    end
end
function Factory()
    if StopThirdSea()  then  return end 
    if RaidStart then return end 
    if CheckNameBoss("Core") then 
        local v = CheckNameBoss("Core")
        repeat wait()
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HmanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0 or not OrionLib.Flags["Auto Factory"].Value or StopThirdSea() 
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Raid Castle"].Value then 
                if DetectMobRaidCastle() then 
                    RaidCastleStart = true
                    local timedelaya = tick()
                    repeat wait()
                        if DetectMobRaidCastle() then 
                            timedelaya = tick()
                        end
                    until tick()-timedelaya >= 20 or not OrionLib.Flags["Raid Castle"].Value
                    RaidCastleStart = false 
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Raid Castle"].Value then 
                if OrionLib.Flags["Find DF"].Value and GetPathFruit() then  return end
                RaidCastle()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function() 
            if OrionLib.Flags["Elite Hunter"].Value then 
                if OrionLib.Flags["Find DF"].Value and GetPathFruit() then  return end
                if OrionLib.Flags["Raid Castle"].Value and RaidCastleStart then return end 
                AutoEliteHunter()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function() 
            if OrionLib.Flags["Auto Factory"].Value then 
                Factory()
            end
        end)
    end
end)

local Section = Tab:AddSection({
	Name = "Get Melee"
})

Tab:AddToggle({
	Name = "SuperHuman",
	Default = Settings["SuperHuman"] or false,
    Flag = "SuperHuman",
	Callback = function(Value)
        SaveSettings("SuperHuman",Value)
	end
})
Tab:AddToggle({
	Name = "DeathStep",
	Default = Settings["DeathStep"] or false,
    Flag = "DeathStep",
	Callback = function(Value)
        SaveSettings("DeathStep",Value)
	end
})

Tab:AddToggle({
	Name = "Sharkman Karate",
	Default = Settings["Sharkman Karate"] or false,
    Flag = "Sharkman Karate",
	Callback = function(Value)
        SaveSettings("Sharkman Karate",Value)
	end
})
Tab:AddToggle({
	Name = "Electric Claw",
	Default = Settings["Electric Claw"] or false,
    Flag = "Electric Claw",
	Callback = function(Value)
        SaveSettings("Electric Claw",Value)
	end
})

Tab:AddToggle({
	Name = "Dragon Talon",
	Default = Settings["Dragon Talon"] or false,
    Flag = "Dragon Talon",
	Callback = function(Value)
        SaveSettings("Dragon Talon",Value)
	end
})

--[[Tab:AddToggle({
	Name = "GodHuman",
	Default = Settings["GodHuman"] or false,
    Flag = "GodHuman",
	Callback = function(Value)
        SaveSettings("GodHuman",Value)
	end
})]]
local TableMeleeSuperhuman = {
    ["Black Leg"] = 1,
    ["Fishman Karate"] = 2 ,
    ["Electro"] = 3,
    ["Dragon Claw"] = 4,
}
local BlMeleeSuperHuman = {}
function DetectMeleeSuperhuman()
    local a
    local dist = math.huge
    for i,v in next,TableMeleeSuperhuman do 
        if not table.find(BlMeleeSuperHuman,i) then 
            if dist > v then 
                dist = v 
                a = i
            end
        end
    end
    return a 
end
function CheckMasteryMelee(x)
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Tool") and (x and v.Name == x or not x and  v.ToolTip == "Melee") then
            return  v.Level.Value
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v:IsA("Tool") and (x and v.Name == x or not x and  v.ToolTip == "Melee") then
            return   v.Level.Value
        end
    end
end
function AutoSuperhuman()
    local Path = DetectMeleeSuperhuman()
    if not Path then 
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman")
        return 
    end
    if not game.Players.LocalPlayer.Character:FindFirstChild(Path) and not game.Players.LocalPlayer.Backpack:FindFirstChild(Path) then
        if Path == "Dragon Claw" then
            if game.Players.LocalPlayer.Data.Fragments.Value >= 1500 or game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1") == 1  then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1")
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
            end
            if game.Players.LocalPlayer.Data.Level.Value >= 1100 and game.Players.LocalPlayer.Data.Fragments.Value < 1500 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "1") ~= 1  then
                AutoRaidsfully()
            end
            return
        end
        local Gsub = string.gsub(Path, " ","")
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Buy"..Gsub)
    else
        if CheckMasteryMelee(Path) >= 300 then 
            table.insert(BlMeleeSuperHuman,Path) 
        end
    end
end
function DetectKey(x)
    local a 
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v.Name == x then
            a = v.Name
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if v.Name == x then
            a = v.Name
        end
    end
    return a
end
local Tablefishmananddarkleg = {
    ["fishman"] = false,
    ["darkleg"] = false,
}
function EquipSharkmanorDeadthstep()
    if not Tablefishmananddarkleg["darkleg"] and OrionLib.Flags["DeathStep"].Value  then 
        if not plr.Backpack:FindFirstChild("Black Leg") and not plr.Character:FindFirstChild("Black Leg") then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyBlackLeg")
        else
            if CheckMasteryMelee("Black Leg") >= 400 then
                Tablefishmananddarkleg["darkleg"] = true
            end
        end
    elseif not Tablefishmananddarkleg["fishman"] and OrionLib.Flags["Sharkman Karate"].Value then 
        if not plr.Backpack:FindFirstChild("Fishman Karate") and not plr.Character:FindFirstChild("Fishman Karate") then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyFishmanKarate")
        else
            if CheckMasteryMelee("Fishman Karate") >= 400 then
                Tablefishmananddarkleg["fishman"] = true
            end
        end
    end
end
function DeadthStepAndSharkman()
    if OrionLib.Flags["DeathStep"].Value and DetectKey("Library Key") 
    and game.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") 
    and  game.Workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.CanCollide  then
        repeat wait()
            if (CFrame.new(6375.9126, 296.634583, -6843.14062, -0.849467814, 1.5493983e-08, -0.527640462, 3.70608895e-08, 1, -3.0301031e-08, 0.527640462, -4.5294577e-08, -0.849467814).Position-plr.Character.HumanoidRootPart.Position).Magnitude < 5 then
                game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
                wait(0.2)
                game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
            end
            equiptool(DetectKey("Library Key"),true)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(6375.9126, 296.634583, -6843.14062, -0.849467814, 1.5493983e-08, -0.527640462, 3.70608895e-08, 1, -3.0301031e-08, 0.527640462, -4.5294577e-08, -0.849467814).Position,CFrame.new(6375.9126, 296.634583, -6843.14062, -0.849467814, 1.5493983e-08, -0.527640462, 3.70608895e-08, 1, -3.0301031e-08, 0.527640462, -4.5294577e-08, -0.849467814))
        until not DetectKey("Library Key")  or (game.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor") and not game.Workspace.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.CanCollide  or not game.Workspace.Map.IceCastle.Hall.LibraryDoor:FindFirstChild("PhoeyuDoor")) 
        return 
    end
    if DetectKey("Water Key") and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)  == 3 then 
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
    end
    if OrionLib.Flags["SuperHuman"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true) == 1 then 
        if OrionLib.Flags["Sharkman Karate"].Value and plr.Data.Fragments.Value >= 5000 and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) == 0 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate")
        elseif OrionLib.Flags["DeathStep"].Value and  plr.Data.Fragments.Value >= 5000 and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 0 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep")
        elseif plr.Data.Fragments.Value < 5000 then 
            AutoRaidsfully()
        end 
    end
    local namemob = (OrionLib.Flags["Sharkman Karate"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true)  == 3 and CheckNameBoss("Tide Keeper [Lv. 1475] [Boss]")) or (OrionLib.Flags["DeathStep"].Value and  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) == 3 and CheckNameBoss("Awakened Ice Admiral [Lv. 1400] [Boss]")) 
    if namemob then
        local v = namemob
        repeat wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until v.Humanoid.Health <= 0  or not v or (v.Name == "Tide Keeper [Lv. 1475] [Boss]" and not OrionLib.Flags["Sharkman Karate"].Value) or (v.Name == "Awakened Ice Admiral [Lv. 1400] [Boss]" and not OrionLib.Flags["DeathStep"].Value)  or RaidStart
    end
end
local truefullyclaw = true
function ElectricClaw()
    if  not  plr.Backpack:FindFirstChild("Electro") and  not  plr.Character:FindFirstChild("Electro")   then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectro")
    end
    if game:GetService("Players").LocalPlayer.Data.Fragments.Value < 5000 then 
        AutoRaidsfully()
        return 
    end
    if CheckMasteryMelee("Electro") >= 400 and plr.Data.Beli.Value >= 3000000 and game:GetService("Players").LocalPlayer.Data.Fragments.Value >= 5000 and game.PlaceId == 7449423635 then 
        if (plr.Character.HumanoidRootPart.Position-Vector3.new(-10371.5, 330.764, -10131.4)).Magnitude > 8 and truefullyclaw then
            EletrciClawStart = true
            toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-10371.5, 330.764, -10131.4),CFrame.new(-10371.5, 330.764, -10131.4))
        else
            if truefullyclaw then
                EletrciClawStart = true
                local args = {
                    [1] = "BuyElectricClaw",
                    [2] = "Start"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                truefullyclaw = false
            else
                if (plr.Character.HumanoidRootPart.Position-Vector3.new(-12548.8, 332.378, -7617.77)).Magnitude > 8 then
                    toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-12548.8, 332.378, -7617.77),CFrame.new(-12548.8, 332.378, -7617.77))
                else
                    EletrciClawStart = false
                    game.ReplicatedStorage.Remotes['CommF_']:InvokeServer('BuyElectricClaw')
                end
            end
        end
    end
end
function DragonTalon()
    if  not  plr.Backpack:FindFirstChild("Dragon Claw") and  not  plr.Character:FindFirstChild("Dragon Claw")   then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "DragonClaw", "2")
    end
    if plr.Data.Level.Value >= 1975 then
        if plr.Character:FindFirstChild("Fire Essence") or plr.Backpack:FindFirstChild("Fire Essence") then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
        else
            if CheckMasteryMelee("Dragon Claw") >= 400 and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon",true) == 0 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon")
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon",true)
            end
            local v251, v252, v253, v254 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Bones", "Check");
            if v251 >= 50 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end
        end
    end
    if   plr.Data.Level.Value >= 1100 and game:GetService("Players").localPlayer.Data.Fragments.Value < 5000    then
        AutoRaidsfully()
    end
end

spawn(function()
    while wait() do 
        pcall(function()
            if StopThirdSea() then return end 
            if OrionLib.Flags["SuperHuman"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySuperhuman", true) ~= 1  then
                AutoSuperhuman()
                DeadthStepAndSharkman()
            elseif (OrionLib.Flags["DeathStep"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDeathStep", true) ~= 1) 
            or (OrionLib.Flags["Sharkman Karate"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuySharkmanKarate", true) ~= 1) then 
                EquipSharkmanorDeadthstep()
                DeadthStepAndSharkman()

            elseif OrionLib.Flags["Electric Claw"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyElectricClaw", true)  ~= 1  then
                ElectricClaw()
            elseif OrionLib.Flags["Dragon Talon"].Value and game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BuyDragonTalon", true)  ~= 1 then 
                DragonTalon()
            end
        end)
    end
end)
local Section = Tab2:AddSection({
	Name = "Boss"
})
function tableboss()
    local a = {"Deo Co boss"}
    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
        if string.find(v.Name, ' %pBoss%p') or string.find(v.Name, ' %pRaid Boss%p') then
            table.insert(a, v.Name)
            if table.find(a,"Deo Co boss") then
                table.remove(a,1)
            end
        end
    end
    for i, v in pairs(game.ReplicatedStorage:GetChildren()) do
        if string.find(v.Name, ' %pBoss%p') or string.find(v.Name, ' %pRaid Boss%p') then
            table.insert(a, v.Name)
            if table.find(a,"Deo Co boss") then
                table.remove(a,1)
            end
        end
    end
    return a
end
local DropdownBoss = Tab2:AddDropdown({
	Name = "Select Boss",
	Default =  "",
	Options = tableboss(),
    Flag = "Select Boss",
	Callback = function(Value)
	end    
})
Tab2:AddButton({
	Name = "Refresh Boss",
	Callback = function()
        DropdownBoss:Refresh(tableboss(),true)
  	end    
})
Tab2:AddToggle({
	Name = "Auto Boss",
	Default =  false,
    Flag = "Auto Boss",
	Callback = function(Value)
	end
})
Tab2:AddToggle({
	Name = "Get Quest Boss",
	Default =  false,
    Flag = "Get Quest Boss",
	Callback = function(Value)
	end
})
function TableMob()
    local tablemob = {}
    local tablefoldermmb = {}
    for i,v in next,require(game:GetService("ReplicatedStorage").Quests) do
        for i1,v1 in next,v do
            for i2,v2 in next,v1.Task do
                if v2 > 1 then
                    table.insert(tablefoldermmb,i2)
                end
            end
        end
    end
    for i, v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
        if not table.find(tablemob,v.Name) then
            table.insert(tablemob,v.Name)
        end
    end
    if string.find(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()[1].Name, "Lv.") then
        for i, v in pairs(getnilinstances()) do 
            if  table.find(tablefoldermmb,tostring(v.Name:gsub(" %pLv. %d+%p", ""))) and not table.find(tablemob,v.Name) then
                table.insert(tablemob,v.Name)
            end
        end
    else
        for i, v in pairs(getnilinstances()) do 
            if  table.find(tablefoldermmb,v.Name) and not table.find(tablemob,v.Name) then
                table.insert(tablemob,v.Name)
            end
        end
    end
    return tablemob
end
local TableSetectMob = {}
Tab2:AddDropdown({
	Name = "Select Mobs",
	Default =  "",
	Options = TableMob(),
    Flag = "Select Mob",
	Callback = function(Value)
        if Value then
            if not table.find(TableSetectMob,Value) then 
                table.insert(TableSetectMob,Value)
            else
                for i,v in next,TableSetectMob do 
                    if v == Value then 
                        table.remove(TableSetectMob,i)
                    end
                end
            end
            if getgenv().StatusSelectMob then 
                local b = ""
                for i,v in next,TableSetectMob do
                    local c = v
                    if string.find(v,"Lv.") then 
                        c = string.gsub(v," %pLv. %d+%p","")
                    end
                    b = b..c..", "
                end
                getgenv().StatusSelectMob:Set("Mob Select :"..b)
            end
        end
	end    
})
Tab2:AddButton({
	Name = "Refresh Select Mobs",
	Callback = function()
        TableSetectMob = {}
        getgenv().StatusSelectMob:Set("Mob Select :")
  	end    
})
getgenv().StatusSelectMob = Tab2:AddLabel("Mob Select :")
Tab2:AddToggle({
	Name = "Farm Select Mob",
	Default =  false,
    Flag = "Farm Select Mob",
	Callback = function(Value)
	end
})
function checkquestboss(d)
    local x = d
    local a 
    local b
    if string.find(x,' %pRaid Boss%p') then
        a = string.gsub(x,"%pLv. %d+%p", "")
        b = string.gsub(a,"  %pRaid Boss%p","")
    else
        a = string.gsub(x,"%pLv. %d+%p", "")
        b = string.gsub(a,"  %pBoss%p","")
    end
    for i,v in next,require(game:GetService("ReplicatedStorage").Quests) do
        for i1,v1 in next,v do
            for i2,v2 in next,v1.Task do
                if i2 == b then
                    return true
                end
            end
        end
    end
    return false
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Boss"].Value then 
                local x = OrionLib.Flags["Select Boss"].Value
                local a 
                local b
                if string.find(x,' %pRaid Boss%p') then
                    a = string.gsub(x,"%pLv. %d+%p", "")
                    b = string.gsub(a,"  %pRaid Boss%p","")
                else
                    a = string.gsub(x,"%pLv. %d+%p", "")
                    b = string.gsub(a,"  %pBoss%p","")
                end
                if (not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible or (game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible and not string.find(plr.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, b)))
                and OrionLib.Flags["Get Quest Boss"].Value 
                and checkquestboss(OrionLib.Flags["Select Boss"].Value) then
                    for i,v in pairs(Quest) do
                        for i2, v2 in pairs(v) do
                            if v2.Task[b] then
                                if (getgenv().questpoint[tostring(i)].Position-plr.Character.HumanoidRootPart.Position).magnitude <= 8 then
                                    wait(1)
                                    if plr.Character.Humanoid.Health > 0 then 
                                        CommF:InvokeServer("StartQuest", tostring(i), i2)
                                    end
                                else
                                    teleportquestdeptrai(i)
                                end
                            end
                        end
                    end
                else 
                    if CheckNameBoss(OrionLib.Flags["Select Boss"].Value)  then
                        local v = CheckNameBoss(OrionLib.Flags["Select Boss"].Value)
                        repeat wait()
                            sizepart(v)
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                DetectFastAttack()
                            end
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Boss"].Value
                    end
                end
            end
        end)
    end
end)
function FarmMobSelect()
    if not DetectMob(TableSetectMob) then 
        TeleportSpawnMob(TableSetectMob,OrionLib.Flags["Farm Select Mob"].Value)
    else
        local v = DetectMob(TableSetectMob)
        repeat wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
            task.spawn(function()
                BringMob(v)
            end)
        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Farm Select Mob"].Value
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Farm Select Mob"].Value then 
                FarmMobSelect()
            end
        end)
    end
end)
local Section = Tab2:AddSection({
	Name = "Observation haki"
})
local StatusRadius = Tab2:AddLabel("Observation Level :"..game:GetService("Players").LocalPlayer.VisionRadius.Value)
Tab2:AddToggle({
	Name = "Farm Observation",
	Default = Settings["Farm Observation"] or false,
    Flag = "Farm Observation",
	Callback = function(Value)
        SaveSettings("Farm Observation",Value)
	end
})
Tab2:AddToggle({
	Name = "Farm Observation [ Hop ]",
	Default = Settings["Farm Observation [Hop]"] or false,
    Flag = "Farm Observation [Hop]",
	Callback = function(Value)
        SaveSettings("Farm Observation [Hop]",Value)
	end
})

function FarmObservation()
    local mob
    for i,v in next,game.workspace.Enemies:GetChildren() do
        if v:IsA("Model") and v.Name == "Marine Commodore [Lv. 1700]"  and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
            mob = v
        end
    end
    if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") then
        if mob then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,mob.HumanoidRootPart.Position,mob.HumanoidRootPart.CFrame*CFrame.new(0,0,50))
        end
        game:GetService("VirtualInputManager"):SendKeyEvent(true, "E", false, game)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, "E", false, game)
        wait(3)
        if not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel") and OrionLib.Flags["Farm Observation [Hop]"].Value then 
            HopServer()
        end
    else
        if not mob then
            GetPart = DetectPartSpawnMob("Marine Commodore [Lv. 1700]")
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPart.Position,GetPart.CFrame*CFrame.new(0,60,0))
        else
            repeat wait()
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,mob.HumanoidRootPart.Position,mob.HumanoidRootPart.CFrame*CFrame.new(0,0,3))
            until not OrionLib.Flags["Farm Observation"].Value or not game.Players.LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("ImageLabel")
        end
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Farm Observation"].Value then 
                FarmObservation()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            local TurnOn = game:GetService("Players").LocalPlayer.VisionRadius.Value
            if game:GetService("Players").LocalPlayer.VisionRadius.Value == 0 then
                TurnOn = "Turn On Haki Observation, Please"
            end
            StatusRadius:Set("Observation Level :"..TurnOn)
        end)
    end
end)

local Section = Tab2:AddSection({
	Name = "Other"
})
Tab2:AddToggle({
	Name = "Trade Bones",
	Default = Settings["Trade Bones"] or false,
    Flag = "Trade Bones",
	Callback = function(Value)
        SaveSettings("Trade Bones",Value)
	end
})
Tab2:AddToggle({
	Name = "Auto Buy Haki Color",
	Default = Settings["Auto Buy Haki Color"] or false,
    Flag = "Auto Buy Haki Color",
	Callback = function(Value)
        SaveSettings("Auto Buy Haki Color",Value)
	end
})

Tab2:AddToggle({
	Name = "Tp Safe When Have God Chalice or Fist of Darkness",
	Default = Settings["Tp Safe When Have God Chalice or Fist of Darkness"] or false,
    Flag = "Tp Safe When Have God Chalice or Fist of Darkness",
	Callback = function(Value)
        SaveSettings("Tp Safe When Have God Chalice or Fist of Darkness",Value)
        if Value then
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Support Only Elite Hunter And Auto Seabeast And Tp Chest",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
	end
})
Tab2:AddToggle({
	Name = "Auto Chest",
	Default = Settings["Auto Chest"] or false,
    Flag = "Auto Chest",
	Callback = function(Value)
        SaveSettings("Auto Chest",Value)
	end
})
Tab2:AddToggle({
	Name = "Auto Rip Indra",
	Default = Settings["Auto Rip Indra"] or false,
    Flag = "Auto Rip Indra",
	Callback = function(Value)
        if Value then
            if OrionLib.Flags["Tp Safe When Have God Chalice or Fist of Darkness"].Value then 
                OrionLib:MakeNotification({
                    Name = "Banana Hub",
                    Content = "Turn Off Tp Safe When Have God Chalice or Fist of Darkness Please",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        end
        SaveSettings("Auto Rip Indra",Value)
	end
})
Tab2:AddToggle({
	Name = "Auto Spawn Rip Indra",
	Default = Settings["Auto Spawn Rip Indra"] or false,
    Flag = "Auto Spawn Rip Indra",
	Callback = function(Value)
        if Value then
            if OrionLib.Flags["Tp Safe When Have God Chalice or Fist of Darkness"].Value then 
                OrionLib:MakeNotification({
                    Name = "Banana Hub",
                    Content = "Turn Off Tp Safe When Have God Chalice or Fist of Darkness Please",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
        end
        SaveSettings("Auto Spawn Rip Indra",Value)
	end
})
function DetectButtons()
    for i,v in next,game:GetService("Workspace").Map["Boat Castle"].Summoner.Circle:GetChildren() do
        if v:IsA("Part") and v.Part.BrickColor.Name ~= "Lime green"  then
            return v
        end
    end
end
Tab2:AddButton({
	Name = "Touch Buttons Spawn Rip Indra",
	Callback = function()
        while wait() do 
            if DetectButtons().BrickColor.Name == "Hot pink"  then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
                toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame*CFrame.new(0,3.5,0))
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            elseif DetectButtons().BrickColor.Name == "Really red"  then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame*CFrame.new(0,3.5,0))
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            elseif DetectButtons().BrickColor.Name == "Oyster"  then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
                toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame*CFrame.new(0,3.5,0))
                game.Players.LocalPlayer.Character.Humanoid.Jump = true
            end
            if not DetectButtons() then 
                break; 
            end
        end
  	end    
})

function StartTeleportSafe()
    if OrionLib.Flags["Tp Safe When Have God Chalice or Fist of Darkness"].Value 
    and (plr.Backpack:FindFirstChild("God's Chalice") 
    or plr.Character:FindFirstChild("God's Chalice") 
    or plr.Character:FindFirstChild("Fist of Darkness") 
    or plr.Backpack:FindFirstChild("Fist of Darkness")) then 
        return true
    end
end
local TeleportY = 1000
function ClosestPlayerTeleportY()
    local dist = math.huge
    local a 
    for i,v in pairs(game:GetService("Workspace").Characters:GetChildren()) do
        for i,v in pairs(game.Workspace.Characters:GetChildren()) do
            if v:IsA("Model") and v.Name ~= plr.Name  then
                local magnitude = (v.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if magnitude <= 1000 then
                    dist = magnitude
                    a = v.Name
                end
            end
        end
    end
    return a
end
spawn(function()
    while wait() do
        pcall(function()
            if StartTeleportSafe()  then 
                if game.PlaceId == 4442272183 then  
                    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-385.250916, 73.0458984, 297.388397).Position,CFrame.new(-385.250916, 73.0458984, 297.388397))
                else
                    toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-12463.8740234375, 374.9144592285156, -7523.77392578125).Position,CFrame.new(-12463.8740234375, 374.9144592285156, -7523.77392578125))
                end
            end
        end)
    end
end)

Tab2:AddToggle({
	Name = "Auto Dough King",
	Default = Settings["Auto Dough King"] or false,
    Flag = "Auto Dough King",
	Callback = function(Value)
        SaveSettings("Auto Dough King",Value)
	end
})
Tab2:AddToggle({
	Name = "Hop Cup",
	Default = Settings["Hop Cup"] or false,
    Flag = "Hop Cup",
	Callback = function(Value)
        SaveSettings("Hop Cup",Value)
	end
})
Tab2:AddToggle({
	Name = "Citizen Quest",
	Default =  false,
    Flag = "Citizen Quest",
	Callback = function(Value)
	end
})
Tab2:AddToggle({
	Name = "Auto Seabeast",
	Default =  false,
    Flag = "Auto Seabeast",
	Callback = function(Value)
        if Value then
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Select Weapons In Setting",
                Image = "rbxassetid://4483345998",
                Time = 5
            })    
        end
	end
})
Tab2:AddToggle({
	Name = "Auto PirateShip",
	Default =  false,
    Flag = "Auto PirateShip",
	Callback = function(Value)
	end
})
function DoughKing()
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Red Key") or game.Players.LocalPlayer.Character:FindFirstChild("Red Key") then
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select", "Dough")
        return 
    end
    if CheckNameBoss("Cake Prince [Lv. 2300] [Raid Boss]") or CheckNameBoss("Dough King [Lv. 2300] [Raid Boss]") then
        local v = CheckNameBoss("Cake Prince [Lv. 2300] [Raid Boss]") or CheckNameBoss("Dough King [Lv. 2300] [Raid Boss]")
        repeat wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,-20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0   or not OrionLib.Flags["Auto Dough King"].Value
        return 
    end
    if not plr.Character:FindFirstChild("Sweet Chalice") and not plr.Backpack:FindFirstChild("Sweet Chalice") then
        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("SweetChaliceNpc")  == "Where are the items?"   then
            if not checkcountitem("Conjured Cocoa",10) then
                if not DetectMob(MobConjuredCocoa) then 
                    TeleportSpawnMob(MobConjuredCocoa,OrionLib.Flags["Auto Dough King"].Value)
                else
                    local v = DetectMob(MobConjuredCocoa)
                    repeat wait()
                        sizepart(v)
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                        task.spawn(function()
                            BringMob(v)
                        end)
                    until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Dough King"].Value
                end
            else
                if not plr.Backpack:FindFirstChild("God's Chalice") and not plr.Character:FindFirstChild("God's Chalice") then
                    if DetectEliteHunter() then 
                        if not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text,DetectEliteHunter().Name:gsub(" %pLv. %d+%p", "")) 
                        or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EliteHunter")
                        else
                            local v = DetectEliteHunter()
                            repeat wait()
                                sizepart(v)
                                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                                if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                    DetectFastAttack()
                                end
                                equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            until not v or not v.Parent or v.Humanoid.Health == 0   or not OrionLib.Flags["Auto Dough King"].Value
                        end
                    else
                        if OrionLib.Flags["Hop Cup"].Value then
                            HopServer()
                        end
                    end
                end
            end
        end
    else
        local v204 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CakePrinceSpawner", true)
        if v204:find("open the portal now") then
            task.spawn(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
            end)
        else
            if not DetectMob(MobKatakuri) then 
                TeleportSpawnMob(MobKatakuri,OrionLib.Flags["Auto Dough King"].Value)
            else
                local v = DetectMob(MobKatakuri)
                repeat wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    task.spawn(function()
                        BringMob(v)
                    end)
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Dough King"].Value
            end
        end
    end
end
spawn(function()
    while wait() do 
        if OrionLib.Flags["Auto Dough King"].Value  then
            pcall(function()
                DoughKing()
            end)
        end
    end
end)
spawn(function()
    while task.wait() do 
        if OrionLib.Flags["Auto Dough King"].Value   then
            pcall(function()
                if  plr.Character:FindFirstChild("Sweet Chalice") or plr.Backpack:FindFirstChild("Sweet Chalice") then
                    task.spawn(function()
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("CakePrinceSpawner")
                    end)
                end
            end)
        end
    end
end)
function CitizenQuestt()
    ---11893.650390625, 932.1987915039062, -8760.5927734375
    if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible 
    and not (string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Stone") 
    or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Island Empress") 
    or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Kilo Admiral") 
    or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Captain Elephant") 
    or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Beautiful Pirate")) then 
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
        return 
    end
    if not game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible then
        if (plr.Character.HumanoidRootPart.Position-Vector3.new(-11893.7, 929.661, -8760.59)).Magnitude < 8 then 
            local string_1 = "HornedMan";
            local string_2 = "Bet";
            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
            Target:InvokeServer(string_1, string_2);
            local string_1 = "HornedMan";
            local string_2 = "Bet";
            local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
        else
            toTarget(plr.Character.HumanoidRootPart.Position,CFrame.new(-11893.7, 929.661, -8760.59).Position,CFrame.new(-11893.7, 929.661, -8760.59))
        end
    else
        local name
        if checknamedoublquest() == "Stone" then 
            name = "Stone [Lv. 1550] [Boss]"
        elseif checknamedoublquest() == "Island Empress" then 
            name = "Island Empress [Lv. 1675] [Boss]"
        elseif checknamedoublquest() == "Kilo Admiral" then 
            name = "Kilo Admiral [Lv. 1750] [Boss]"
        elseif checknamedoublquest() == "Captain Elephant" then 
            name = "Captain Elephant [Lv. 1875] [Boss]"
        elseif checknamedoublquest() == "Beautiful Pirate" then  
            name = "Beautiful Pirate [Lv. 1950] [Boss]"
        end
        local v = CheckNameBoss(name)
        repeat wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0   or not OrionLib.Flags["Citizen Quest"].Value
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Citizen Quest"].Value then 
                CitizenQuestt()
            end
        end)
    end
end)

local tableprirate = {
    "PirateBasic",
    "PirateBrigade",
}

function checkseabeast()
    for i,v in next,game:GetService("Workspace").SeaBeasts:GetChildren() do
        if v.Name == "SeaBeast1" then
            local s = v.HealthBBG.Frame.TextLabel.Text
            local x = s:gsub("/%d+,%d+","")
            local a = v.HealthBBG.Frame.TextLabel.Text
            local b 
            if string.find(x, ",") then
                b = a:gsub("%d+,%d+/","")
            else
                b = a:gsub("%d+/","")
            end
            local c = b:gsub(",","")
            if tonumber(c) >= 90000 then
                return v
            end
        end
    end
    if OrionLib.Flags["Auto PirateShip"].Value  then
        for i,v in next,game:GetService("Workspace").Enemies:GetChildren() do
            if table.find(tableprirate,v.Name) and v:FindFirstChild("Health") and v.Health.Value > 0 then
                return v
            end
        end
    end
    return false
end
local plr = game.Players.LocalPlayer
function checkboat()
    for i,v in next,game:GetService("Workspace").Boats:GetChildren() do
        if v:IsA("Model") then
            if v:FindFirstChild("Owner") and  tostring(v.Owner.Value) == plr.Name and v.Humanoid.Value > 0 then
                return v
            end
        end
    end
    return false
end
function TeleportSeabeast(x)
    if x:FindFirstChild("Engine") then 
        toTarget(plr.Character.HumanoidRootPart.Position,x.Engine.Position,x.Engine.CFrame*CFrame.new(0,-15,0))
        return
    end
    local a = Vector3.new(0,x:FindFirstChild("HumanoidRootPart").Position.Y,0) 
    local b = Vector3.new(0,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y,0)
    if (a-b).Magnitude <= 175 then
        toTarget(plr.Character.HumanoidRootPart.Position,x.HumanoidRootPart.Position,x.HumanoidRootPart.CFrame*CFrame.new(0,300,50))
    else
        toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(x.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y,x.HumanoidRootPart.Position.Z),CFrame.new(x.HumanoidRootPart.Position.X,game:GetService("Workspace").Map["WaterBase-Plane"].Position.Y+200,x.HumanoidRootPart.Position.Z))
    end		
end
function checkskillMelee()
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 2"].Value)) then 
        equiptool(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 2"].Value))
        return false
    end
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 2"].Value)]:GetChildren() do 
        if v:IsA("Frame")  then
            if v.Name ~= "Template" and  OrionLib.Flags["Seabeast2 "..v.Name].Value and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end
function checkskillDF()
    if not game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:FindFirstChild(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 1"].Value)) then 
        equiptool(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 1"].Value))
        return false
    end
    for i,v in next,game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills[NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 1"].Value)]:GetChildren() do 
        if v:IsA("Frame")  then
            if v.Name ~= "Template" and OrionLib.Flags["Seabeast1 "..v.Name].Value and v.Title.TextColor3 == Color3.new(1, 1, 1) and v.Cooldown.Size == UDim2.new(0, 0, 1, -1) or v.Cooldown.Size == UDim2.new(1, 0, 1, -1) then
                return v.Name
            end
        end
    end
end

function autoskill()
    if checkskillDF() then 
        equiptool(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 1"].Value))
        local condimebeo = checkskillDF()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, condimebeo, false, game)
        wait(0.5)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, condimebeo, false, game)
    elseif checkskillMelee() then 
        equiptool(NameWeapon(OrionLib.Flags["Select Weapon SeaBeast 2"].Value))
        local condimebeo = checkskillMelee()
        game:GetService("VirtualInputManager"):SendKeyEvent(true, condimebeo, false, game)
        wait(0.5)
        game:GetService("VirtualInputManager"):SendKeyEvent(false, condimebeo, false, game)
    end
end

function Seabeast()
    if not checkseabeast() then
        if not checkboat() then
            local PositionGetBoat = CFrame.new(-13.488054275512695, 10.311711311340332, 2927.692)
            if game.PlaceId == 7449423635 then
                PositionGetBoat = CFrame.new(-6044.32, 15.1151, -2038.66)
            end
            if (PositionGetBoat.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 8 then
                toTarget(plr.Character.HumanoidRootPart.Position,PositionGetBoat.Position,PositionGetBoat)
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat","PirateBasic")
            end
        else
            local PositionWaitSea = CFrame.new(28.4108+20, 1.2327+10, 3679.99+10)
            if game.PlaceId == 7449423635 then
                PositionWaitSea = CFrame.new(-7551.96, 10.4861, -1537.59)
            end
            if (checkboat().VehicleSeat.Position-PositionWaitSea.Position).Magnitude > 50 then 
                checkboat().VehicleSeat.CFrame = PositionWaitSea
            else
                if not plr.Character.Humanoid.Sit then 
                    toTarget(plr.Character.HumanoidRootPart.Position,checkboat().VehicleSeat.Position,checkboat().VehicleSeat.CFrame)
                end
            end
        end
    else
        local v = checkseabeast()
        repeat wait()
            TeleportSeabeast(v)
            spawn(function()
                autoskill()
            end)
            if v:FindFirstChild("Engine") then
                getgenv().psskill = v.Engine.CFrame
            else
                getgenv().psskill = v.HumanoidRootPart.CFrame
            end
        until not v or not v.Parent or v.Health.Value <= 0 or not OrionLib.Flags["Auto Seabeast"].Value
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Seabeast"].Value  then 
                if StartTeleportSafe() then 
                    return 
                end
                Seabeast()
            end
        end)
    end
end)
function AutoRipIndra()
    if StartTeleportSafe() then 
        return 
    end
    local v = CheckNameBoss("rip_indra True Form [Lv. 5000] [Raid Boss]")
    if v then 
        repeat wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0 or not OrionLib.Flags["Auto Rip Indra"].Value
    else
        if OrionLib.Flags["Auto Spawn Rip Indra"].Value and ( plr.Backpack:FindFirstChild("God's Chalice") or  plr.Character:FindFirstChild("God's Chalice")) then
            if  not DetectButtons() then 
                equiptool("God's Chalice",true)
                toTarget(plr.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection.Position,game:GetService("Workspace").Map["Boat Castle"].Summoner.Detection.CFrame)
            else
                if DetectButtons().BrickColor.Name == "Hot pink"  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Winter Sky")
                    toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame)
                elseif DetectButtons().BrickColor.Name == "Really red"  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Pure Red")
                    toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame)
                elseif DetectButtons().BrickColor.Name == "Oyster"  then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("activateColor","Snow White")
                    toTarget(plr.Character.HumanoidRootPart.Position,DetectButtons().Position,DetectButtons().CFrame)
                end
            end
        end
    end
end
function AutoChest()
    if StartTeleportSafe() then 
        return 
    end
    local v = DetectChest()
    repeat wait()
        if  (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 2 then
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        end
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 5 then 
            game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
            wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
        end
        toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,v.Position,v.CFrame*CFrame.new(0,1,0),true)
    until not v or not v.Parent or not OrionLib.Flags["Auto Chest"].Value
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Chest"].Value  then 
                AutoChest()
            end
        end)
    end
end)

spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Rip Indra"].Value  then 
                AutoRipIndra()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Buy Haki Color"].Value  then 
                game.ReplicatedStorage.Remotes["CommF_"]:InvokeServer("ColorsDealer", "2")
            end
        end)
    end
end)
local Section = Tab3:AddSection({
	Name = "Devil Fruit"
})
Tab3:AddToggle({
	Name = "Buy Random DF",
	Default = Settings["Buy Random DF"] or false,
    Flag = "Buy Random DF",
	Callback = function(Value)
        SaveSettings("Buy Random DF",Value)
	end
})
Tab3:AddToggle({
	Name = "Esp Fruit",
	Default = Settings["Esp Fruit"] or false,
    Flag = "Esp Fruit",
	Callback = function(Value)
        SaveSettings("Esp Fruit",Value)
	end
})
Tab3:AddToggle({
	Name = "Find DF",
	Default = Settings["Find DF"] or false,
    Flag = "Find DF",
	Callback = function(Value)
        SaveSettings("Find DF",Value)
	end
})
Tab3:AddToggle({
	Name = "Hop Find DF",
	Default = Settings["Hop Find DF"] or false,
    Flag = "Hop Find DF",
	Callback = function(Value)
        if Value and not OrionLib.Flags["Find DF"].Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Find DF, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        SaveSettings("Hop Find DF",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Store",
	Default = Settings["Auto Store"] or false,
    Flag = "Auto Store",
	Callback = function(Value)
        SaveSettings("Auto Store",Value)
	end
})
getgenv().tablefruitausea3 = {}
local whitelistedfruit = {}
local TableDevilFruit = {}
for i,v in next,game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop:GetAttribute("Shop2")) do
    if v.Price >= 1000000 then
        table.insert(whitelistedfruit,string.split(v.Name,"-")[1].." Fruit")
        getgenv().tablefruitausea3[v.Name] = v.Price
    end
    table.insert(TableDevilFruit,v.Name)
end
function getbackpack()
    mybackpack = {}
    for i,v in next, game.Players.LocalPlayer.Backpack:GetChildren() do
        if v:IsA("Tool") and table.find(whitelistedfruit,v.Name) then
            table.insert(mybackpack,v.Name)
        end
    end
    for i1,v1 in next, game.Players.LocalPlayer.Character:GetChildren() do
        if v1:IsA("Tool") and table.find(whitelistedfruit,v1.Name) then
            table.insert(mybackpack,v1.Name)
        end
    end
    return mybackpack
end
function checkdevilfruit()
    local name
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if string.find(v.Name,"Fruit")  then
            name = v.Name
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if string.find(v.Name,"Fruit")  then
            name = v.Name
        end
    end
    return name
end
Tab3:AddDropdown({
	Name = "Blox Fruit Sniper Shop",
	Default =  Settings["Blox Fruit Sniper Shop"] or "",
	Options = TableDevilFruit,
    Flag = "Blox Fruit Sniper Shop",
	Callback = function(Value)
		SaveSettings("Blox Fruit Sniper Shop",Value)
	end    
})
Tab3:AddToggle({
	Name = "Buy Blox Fruit Sniper Shop",
	Default = Settings["Buy Blox Fruit Sniper Shop"] or false,
    Flag = "Buy Blox Fruit Sniper Shop",
	Callback = function(Value)
        SaveSettings("Buy Blox Fruit Sniper Shop",Value)
	end
})
function GetPathFruit()
    for i,v in next,game.Workspace:GetChildren() do
        if v:IsA("Tool") or v:IsA("Model") and string.find(v.Name, "Fruit") then
            return v
        end
    end
end
function HopFindDF()
    if GetPathFruit()  then
        if (GetPathFruit().Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then 
            firetouchinterest(GetPathFruit().Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(GetPathFruit().Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        else          
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPathFruit().Handle.Position,GetPathFruit().Handle.CFrame)
        end
    else
        if OrionLib.Flags["Hop Find DF"].Value then
            HopServer()
        end
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Find DF"].Value  then 
                HopFindDF()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Buy Random DF"].Value  then 
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin", "Buy")
            end
        end)
    end
end)
function StoreFruit(path)
    for i,v in pairs(path:GetChildren()) do
        if string.find(v.Name,"Fruit") and not v:FindFirstChild("Ignored")  then
            if OrionLib.Flags["Webhook Store Fruit"].Value then
                sendmsgStoreFruit(tostring(Settings["Url Webhook"] or ""),v.Name)
            end
            local test  = string.gsub(v.Name, " Fruit","")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",string.gsub(v.Name, " Fruit","-"..test),path:FindFirstChild(v.Name))
            local Ignored = Instance.new("IntValue", v)
            Ignored.Name = "Ignored"
        end
    end
end
spawn(function()
    while wait() do
        if OrionLib.Flags["Auto Store"].Value then
            pcall(function()
                if OrionLib.Flags["Auto Raid and Find DF"].Value and DetectCountDF() then return end
                StoreFruit(plr.Backpack)
                StoreFruit(plr.Character)
            end)
        end
    end
end)
function autobuydfshopp()
    for i,v in next,game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetFruits", game:GetService("Players").LocalPlayer.PlayerGui.Main.FruitShop:GetAttribute("Shop2")) do
        if v.Name == OrionLib.Flags["Blox Fruit Sniper Shop"].Value then
            if v.OnSale then
                return v.Name 
            end
        end
    end
end

spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Buy Blox Fruit Sniper Shop"].Value  then 
                if game:GetService("Players").LocalPlayer.Data.DevilFruit.Value == OrionLib.Flags["Blox Fruit Sniper Shop"].Value and autobuydfshopp() then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PurchaseRawFruit",autobuydfshopp())
                end
            end
        end)
    end
end)
function GetEspFruit()
    for i,v in next,game.Workspace:GetChildren() do
        if (v:IsA("Tool") or v:IsA("Model")) and string.find(v.Name, "Fruit") and not v.Handle:FindFirstChild("Ignored") then
            return v
        end
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Esp Fruit"] then
                local v = GetEspFruit()
                if v then
                    local Ignored = Instance.new("IntValue", v.Handle)
                    Ignored.Name = "Ignored"
                    local Text = Drawing.new("Text")
                    Text.Visible = false
                    Text.Transparency = 1
                    Text.Text = v.Name
                    Text.Color = Color3.fromRGB(255, 255, 255)
                    Text.Size = 20
                    Text.Outline = true
                    Text.OutlineColor = Color3.fromRGB(0, 0, 0)
                    Text.Center = true
                    Text.Font = 1
                    spawn(function()
                        repeat wait()
                            if v:FindFirstChild("Handle") then
                                local Pos, OnScreen =  game.workspace.CurrentCamera:WorldToViewportPoint(v.Handle.Position)
                                if OnScreen then
                                    Text.Text = v.Name .. " (" .. math.round(plr:DistanceFromCharacter(v.Handle.Position)) .. ")"
                                    Text.Position = Vector2.new(Pos.X, Pos.Y - 20)
                                    Text.Visible = true
                                else
                                    Text.Visible = false
                                end
                            end
                        until not v or not v.Parent or not game.Workspace:FindFirstChild(v.Name)
                        or not OrionLib.Flags["Esp Fruit"].Value
                        Text:Remove()
                        if v then
                            Ignored:Destroy()
                        end
                    end)
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do
        if OrionLib.Flags["Trade Bones"].Value then
            pcall(function()
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Bones","Buy",1,1)
            end)
        end
    end
end)
local Section = Tab3:AddSection({
	Name = "Raids And Awake"
})
local tableraid = {}
for i,v in next,require(game.ReplicatedStorage.Raids) do
    for i1,v1 in next,v do
        table.insert(tableraid,v1)
    end
end
Tab3:AddDropdown({
	Name = "Select Raid",
	Default =  Settings["Select Raid"] or "",
	Options = tableraid,
    Flag = "Select Raid",
	Callback = function(Value)
		SaveSettings("Select Raid",Value)
	end    
})
Tab3:AddToggle({
	Name = "Get Fruit In Store Low Beli",
	Default = Settings["Get Fruit In Store Low Beli"] or false,
    Flag = "Get Fruit In Store Low Beli",
	Callback = function(Value)
        SaveSettings("Get Fruit In Store Low Beli",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Buy Chip",
	Default = Settings["Auto Buy Chip"] or false,
    Flag = "Auto Buy Chip",
	Callback = function(Value)
        SaveSettings("Auto Buy Chip",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Start Raid",
	Default = Settings["Auto Start Raid"] or false,
    Flag = "Auto Start Raid",
	Callback = function(Value)
        SaveSettings("Auto Start Raid",Value)
	end
})

Tab3:AddToggle({
	Name = "Auto Next Island",
	Default = Settings["Auto Next Island"] or false,
    Flag = "Auto Next Island",
	Callback = function(Value)
        SaveSettings("Auto Next Island",Value)
	end
})
Tab3:AddToggle({
	Name = "Kill Aura Mob",
	Default = Settings["Kill Aura Mob"] or false,
    Flag = "Kill Aura Mob",
	Callback = function(Value)
        SaveSettings("Kill Aura Mob",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Awake",
	Default = Settings["Auto Awake"] or false,
    Flag = "Auto Awake",
	Callback = function(Value)
        SaveSettings("Auto Awake",Value)
	end
})
Tab3:AddToggle({
	Name = "Auto Raid and Find DF [ Hop ]",
	Default = Settings["Auto Raid and Find DF"] or false,
    Flag = "Auto Raid and Find DF",
	Callback = function(Value)
        SaveSettings("Auto Raid and Find DF",Value)
	end
})
spawn(function()
    while wait() do
        if OrionLib.Flags["Auto Awake"].Value then
            pcall(function()
                local args = {
                    [1] = "Awakener",
                    [2] = "Check"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Awakener", "Awaken")
            end)
        end
    end
end)
getgenv().island1 = true
getgenv().island2 = false
getgenv().island3 = false
getgenv().island4 = false
getgenv().island5 = false
getgenv().buychip = true
local RaidStart2 = false
spawn(function()
    while wait() do 
        pcall(function()
            for i,v in pairs(plr.PlayerGui.Notifications:GetDescendants()) do
                if v:IsA("TextLabel") then
                    if string.find(v.Text,"Island #1")  then
                        getgenv().island2 = true
                    end
                    if string.find(v.Text,"Island #2")  then
                        getgenv().island3 = true
                    end
                    if string.find(v.Text,"Island #3")  then 
                        getgenv().island4 = true
                    end
                    if string.find(v.Text,"Island #4")  then 
                        getgenv().island5 = true
                    end
                    if string.find(v.Text,"1000")  then
                        RaidStart = false
                        RaidStart2 = false
                    end 
                end
            end
            if  plr.PlayerGui.Main.Timer.Visible  then 
                getgenv().buychip = true
            else
                getgenv().island1 = true
                getgenv().island2 = false
                getgenv().island3 = false
                getgenv().island4 = false
                getgenv().island5 = false
            end
        end)
    end
end)
function ClosestPartIsland(xx)
    local dist = math.huge
    local name
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        if v:IsA("Part") and v.Name == xx then
            local conconcac = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude
            if conconcac < dist then
                dist = conconcac
                name = v
            end
        end
    end
    return name
end
function getfruitstore(x)
    local max = math.huge
    local name 
    for i,v in next,game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
        if v.Type == "Blox Fruit" then
            if not x then
                for i2, v2 in pairs(getgenv().tablefruitausea3) do
                    if v.Name == i2 then
                        if tonumber(v2) < tonumber(max) then
                            max = v2
                            name = i2
                        end
                    end
                end
            else
                if not getgenv().tablefruitausea3[v.Name] then 
                    return v.Name
                end
            end
        end
    end
    return name
end
function AutoRaids()
    if (OrionLib.Flags["Auto Raid and Find DF"].Value or OrionLib.Flags["Auto Buy Chip"].Value) and getgenv().buychip  and plr.Data.Level.Value >= 1100  and not plr.PlayerGui.Main.Timer.Visible and not plr.Backpack:FindFirstChild("Special Microchip") and not plr.Character:FindFirstChild("Special Microchip") then
        if not checkdevilfruit()   and getfruitstore(true) and OrionLib.Flags["Get Fruit In Store Low Beli"].Value and not OrionLib.Flags["Auto Raid and Find DF"].Value then 
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore(true))
        end
        if #getbackpack() == 0 then
            wait(5)
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select",OrionLib.Flags["Select Raid"].Value or "Flame")
        end
    end
    if (OrionLib.Flags["Auto Raid and Find DF"].Value or OrionLib.Flags["Auto Start Raid"].Value) and (plr.Backpack:FindFirstChild("Special Microchip") or plr.Character:FindFirstChild("Special Microchip"))  then
        if OrionLib.Flags["Auto Raid and Find DF"].Value then
            RaidStart2 = true
        end
        
        getgenv().buychip = false
        if game.PlaceId == 7449423635 then
            wait(2)
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector,0)
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector,1)
        end
        if game.PlaceId == 4442272183 then
            wait(2)
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector,0)
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector,1)
        end
    end
    if (OrionLib.Flags["Auto Raid and Find DF"].Value or  OrionLib.Flags["Auto Next Island"].Value) and plr.PlayerGui.Main.Timer.Visible then
        if getgenv().island5 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 5").Position,ClosestPartIsland("Island 5").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island4 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 4").Position,ClosestPartIsland("Island 4").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island3 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 3").Position,ClosestPartIsland("Island 3").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island2 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 2").Position,ClosestPartIsland("Island 2").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island1 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 1").Position,ClosestPartIsland("Island 1").CFrame * CFrame.new(0,60,0))
        end
    end 
    if (OrionLib.Flags["Auto Raid and Find DF"].Value or  OrionLib.Flags["Kill Aura Mob"].Value) and plr.PlayerGui.Main.Timer.Visible then
        for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 500  and v.Humanoid.Health > 0 then
                v.Humanoid.Health = 0
            end
        end
    end  
end

function AutoRaidsfully(mmb)
    if getgenv().buychip  and plr.Data.Level.Value >= 1100 and not plr.PlayerGui.Notifications:FindFirstChild("NotificationTemplate") and not plr.PlayerGui.Main.Timer.Visible and not plr.Backpack:FindFirstChild("Special Microchip") and not plr.Character:FindFirstChild("Special Microchip") then
        wait(5)
        if not checkdevilfruit()   and getfruitstore(true)  then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore(true))
        end
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Check")
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaidsNpc", "Select",mmb or "Flame")
    end
    if RaidStart and not plr.PlayerGui.Main.Timer.Visible  then 
        if getgenv().Tween then
            getgenv().Tween:Pause()
            getgenv().Tween:Cancel()
        end
    end
    if  (plr.Backpack:FindFirstChild("Special Microchip") or plr.Character:FindFirstChild("Special Microchip"))  and not plr.PlayerGui.Main.Timer.Visible then
        RaidStart = true
        getgenv().buychip = false
        if game.PlaceId == 7449423635 then
            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
        end
        if game.PlaceId == 4442272183 then
            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
        end
    end
    if plr.PlayerGui.Main.Timer.Visible then
        if getgenv().island5 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 5").Position,ClosestPartIsland("Island 5").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island4 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 4").Position,ClosestPartIsland("Island 4").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island3 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 3").Position,ClosestPartIsland("Island 3").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island2 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 2").Position,ClosestPartIsland("Island 2").CFrame * CFrame.new(0,60,0))
        elseif getgenv().island1 then
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,ClosestPartIsland("Island 1").Position,ClosestPartIsland("Island 1").CFrame * CFrame.new(0,60,0))
        end
    end
    if plr.PlayerGui.Main.Timer.Visible then
        for i,v in pairs(game.Workspace.Enemies:GetDescendants()) do
            if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 500  and v.Humanoid.Health > 0 then
                v.Humanoid.Health = 0
            end
        end
    end 
end


spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Next Island"].Value 
            or OrionLib.Flags["Auto Buy Chip"].Value
            or OrionLib.Flags["Auto Start Raid"].Value
            or OrionLib.Flags["Kill Aura Mob"].Value then 
                AutoRaids()
            end
        end)
    end
end)
function DetectCountDF()
    if #getbackpack() > 1 then 
        for i,v in next,getbackpack() do 
            for i1,v1 in next,game.ReplicatedStorage.Remotes.CommF_:InvokeServer("getInventory") do
                if v1.Type == "Blox Fruit" and ((v1.Name == v and v1.Count < game.Players.LocalPlayer.Data.FruitCap.Value) or not v1.Name == v) then
                    return true 
                end
            end
        end
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Raid and Find DF"].Value   then
                if RaidStart2 and not plr.PlayerGui.Main.Timer.Visible  then 
                    if getgenv().Tween then
                        getgenv().Tween:Pause()
                        getgenv().Tween:Cancel()
                    end
                end
                if GetPathFruit()  and not RaidStart2 then
                    if (GetPathFruit().Handle.Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 5 then 
                        firetouchinterest(GetPathFruit().Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                        firetouchinterest(GetPathFruit().Handle, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                    else          
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,GetPathFruit().Handle.Position,GetPathFruit().Handle.CFrame)
                    end 
                    return 
                end
                if (not DetectCountDF() and checkdevilfruit()) or RaidStart2 then 
                    AutoRaids()
                    if not RaidStart2 then
                       wait(5)
                    end
                elseif not checkdevilfruit() and not RaidStart2 then  
                    HopServer()
                end
            end
        end)
    end
end)

local Section = Tab4:AddSection({
	Name = "Webhook"
})
Tab4:AddTextbox({
	Name = "Url Webhook",
	Default = Settings["Url Webhook"] or "",
	TextDisappear = true,
    Flag = "Url Webhook",
	Callback = function(Value)
        SaveSettings("Url Webhook",Value)
	end	  
})
Tab4:AddToggle({
	Name = "Webhook Store Fruit",
	Default = Settings["Webhook Store Fruit"] or false,
    Flag = "Webhook Store Fruit",
	Callback = function(Value)
        SaveSettings("Webhook Store Fruit",Value)
	end
})
Tab4:AddToggle({
	Name = "Webhook Server Full Moon Or Next Night",
	Default = Settings["Webhook Server Full Moon Or Next Night"] or false,
    Flag = "Webhook Server Full Moon Or Next Night",
	Callback = function(Value)
        SaveSettings("Webhook Server Full Moon Or Next Night",Value)
	end
})
Tab4:AddToggle({
	Name = "Webhook Mirage",
	Default = Settings["Webhook Mirage"] or false,
    Flag = "Webhook Mirage",
	Callback = function(Value)
        SaveSettings("Webhook Mirage",Value)
	end
})

function format(num, digits)
	return string.format("%0" .. digits .. "i", num)
end

function parseDateTime()
	local osDate = os.date("!*t")
	local year, mon, day = osDate["year"], osDate["month"], osDate["day"]
	local hour, min, sec = osDate["hour"], osDate["min"], osDate["sec"]
	return year .. "-" .. format(mon, 2) .. "-" .. format(day, 2) .. "T" .. format(hour, 2) .. ":" .. format(min, 2) .. ":" .. format(sec, 2) .. "Z"
end
function sendmsgStoreFruit(url,x)
    local dt = DateTime.now()
    local timestamp = dt:FormatUniversalTime("LL", "vi-vn")
    local now = DateTime.now()
    local timestamp2 = now:FormatLocalTime("LT", "vi-vn")  

	msg = {
		["content"] = "",
		["embeds"] = {
			{
                ["author"] = {
                    ["name"] = "Store Fruit.Exe",
                    ["url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg",
                    ["icon_url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg"
                },
				["color"] = tonumber(0x000000),
				["title"] = "Skider so 1 viet nam : Obii#3012",
                ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097971676353937448/banner.png",
				["fields"] = {
					{
						["name"] = "Name :",
						["value"] = "||"..game.Players.LocalPlayer.Name.."||",
						["inline"] = true
					},
                    {
						["name"] = "Fruit ",
						["value"] = "```"..x.."```",
						["inline"] = true
					},
				},
                ["thumbnail"] = {
                    ["url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097970280023990422/gabimaru-anime.gif"
                },
                ["image"] = {
                    ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["footer"] = {
                    ["text"] = "discord.gg/chuoihub",
                    ["icon_url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["timestamp"] = parseDateTime(),
			}
		}
	} 
    local request = http_request
    if syn then
        request = syn.request 
    end
    local response = request(
        {
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        }
    )
end
function sendWebhook(url,xx)
    local dt = DateTime.now()
    local timestamp = dt:FormatUniversalTime("LL", "vi-vn")
    local now = DateTime.now()
    local timestamp2 = now:FormatLocalTime("LT", "vi-vn")  
    local name = "Mirage"
    local Value = "Spawn"
    if xx then 
        name = "Moon"
        Value = "Moon : "..CheckMoon().."|"..function8()
    end
	msg = {
		["content"] = "",
		["embeds"] = {
			{
                ["author"] = {
                    ["name"] = name..".Exe",
                    ["url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg",
                    ["icon_url"] = "https://media.discordapp.net/attachments/1062732545873154188/1085958426250715257/336317801_930962918254488_4971073765429070118_n.jpg"
                },
				["color"] = tonumber(0x000000),
				["title"] = "Skider so 1 viet nam : Obii#3012",
                ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097971676353937448/banner.png",
				["fields"] = {
					{
						["name"] = "Name :",
						["value"] = "||"..game.Players.LocalPlayer.Name.."||",
						["inline"] = true
					},
                    {
						["name"] = name.." ",
						["value"] = "```"..Value.."```",
						["inline"] = true
					},
				},
                ["thumbnail"] = {
                    ["url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097970280023990422/gabimaru-anime.gif"
                },
                ["image"] = {
                    ["url"] =  "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["footer"] = {
                    ["text"] = "discord.gg/chuoihub",
                    ["icon_url"] = "https://cdn.discordapp.com/attachments/973570282356891719/1097969638333222963/banana_cat.jpg"
                },
                ["timestamp"] = parseDateTime(),
			}
		}
	} 
    local request = http_request
    if syn then
        request = syn.request 
    end
    local response = request(
        {
            Url = url,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        }
    )
end
spawn(function()
    while wait() do 
        if OrionLib.Flags["Webhook Server Full Moon Or Next Night"].Value then 
            pcall(function()
                repeat wait() until CheckMoon() == "Full Moon" or CheckMoon() == "Next Night"
                if CheckMoon() == "Full Moon" or CheckMoon() == "Next Night" then
                    sendWebhook(tostring(Settings["Url Webhook"] or ""),true)
                    wait(60)
                end
            end)
        end
    end
end)
spawn(function()
    while wait() do 
        if OrionLib.Flags["Webhook Mirage"].Value then 
            pcall(function()
                repeat wait() until game:GetService("Workspace").Map:FindFirstChild("MysticIsland")
                if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
                    sendWebhook(tostring(Settings["Url Webhook"] or ""),false)
                    wait(60)
                end
            end)
        end
    end
end)
local Section = Tab5:AddSection({
	Name = "Soul Guitar And CDK"
})
Tab5:AddToggle({
	Name = "Soul Guitar",
	Default = Settings["Soul Guitar"] or false,
    Flag = "Soul Guitar",
	Callback = function(Value)
        SaveSettings("Soul Guitar",Value)
	end
})
Tab5:AddToggle({
	Name = "Cursed Dual Katana",
	Default = Settings["Cursed Dual Katana"] or false,
    Flag = "Cursed Dual Katana",
	Callback = function(Value)
        SaveSettings("Cursed Dual Katana",Value)
	end
})
local Section = Tab5:AddSection({
	Name = "Other"
})
Tab5:AddToggle({
	Name = "Auto Unlock All Skill Sword In Inventory",
	Default = Settings["Auto Unlock All Skill Sword In Inventory"] or false,
    Flag = "Auto Unlock All Skill Sword In Inventory",
	Callback = function(Value)
        if Value then
            if not OrionLib.Flags["Auto Farm"].Value then
                OrionLib:MakeNotification({
                    Name = "Banana Hub",
                    Content = "Turn On Auto Farm, Please",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                })
            end
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Select Weapon In Main Farm = Sword, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        SaveSettings("Auto Unlock All Skill Sword In Inventory",Value)
	end
})

Tab5:AddToggle({
	Name = "Auto Buy Legend Sword",
	Default = Settings["Auto Buy Legend Sword"] or false,
    Flag = "Auto Buy Legend Sword",
	Callback = function(Value)
        SaveSettings("Auto Buy Legend Sword",Value)
	end
})
Tab5:AddToggle({
	Name = "Auto Buy Legend Sword [ Hop ]",
	Default = Settings["Auto Buy Legend Sword [ Hop ]"] or false,
    Flag = "Auto Buy Legend Sword [ Hop ]",
	Callback = function(Value)
        if not OrionLib.Flags["Auto Buy Legend Sword"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Auto Buy Legned Sword, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        SaveSettings("Auto Buy Legend Sword [ Hop ]",Value)
	end
})
Tab5:AddToggle({
	Name = "Yama",
	Default = Settings["Yama"] or false,
    Flag = "Yama",
	Callback = function(Value)
        SaveSettings("Yama",Value)
	end
})
Tab5:AddToggle({
	Name = "Tushita",
	Default = Settings["Tushita"] or false,
    Flag = "Tushita",
	Callback = function(Value)
        SaveSettings("Tushita",Value)
	end
})
local Section = Tab5:AddSection({
	Name = "Multi Toggle"
})
Tab5:AddToggle({
	Name = "Pole Sword",
	Default = Settings["Pole Sword"] or false,
    Flag = "Pole Sword",
	Callback = function(Value)
        SaveSettings("Pole Sword",Value)
	end
})
Tab5:AddToggle({
	Name = "Saber Sword",
	Default = Settings["Saber Sword"] or false,
    Flag = "Saber Sword",
	Callback = function(Value)
        SaveSettings("Saber Sword",Value)
	end
})
Tab5:AddToggle({
	Name = "Canvander",
	Default = Settings["Canvander"] or false,
    Flag = "Canvander",
	Callback = function(Value)
        SaveSettings("Canvander",Value)
	end
})
Tab5:AddToggle({
	Name = "Buddy Sword",
	Default = Settings["Buddy Sword"] or false,
    Flag = "Buddy Sword",
	Callback = function(Value)
        SaveSettings("Buddy Sword",Value)
	end
})
local BlankTablets = {
    "Segment6",
    "Segment2",
    "Segment8",
    "Segment9",
    "Segment5"
}
local Trophy = {
    ["Segment1"] = "Trophy1",
    ["Segment3"] = "Trophy2",
    ["Segment4"] = "Trophy3",
    ["Segment7"] = "Trophy4",
    ["Segment10"] = "Trophy5",
}
local Pipes = {
    ["Part1"] = "Really black",
    ["Part2"] = "Really black",
    ["Part3"] = "Dusty Rose",
    ["Part4"] = "Storm blue",
    ["Part5"] = "Really black",
    ["Part6"] = "Parsley green",
    ["Part7"] = "Really black",
    ["Part8"] = "Dusty Rose",
    ["Part9"] = "Really black",
    ["Part10"] = "Storm blue",
}

function DetectRequestSoulGuitar()
    local Mob = {}
    local PlaceId 
    local NameRemote 
    if not checkcountitem("Ectoplasm",250) then
        Mob = {
            "Ship Deckhand [Lv. 1250]",
            "Ship Steward [Lv. 1300]",
            "Ship Officer [Lv. 1325]",
            "Ship Engineer [Lv. 1275]"
        }
        PlaceId = 4442272183
        NameRemote = "TravelDressrosa"
    elseif not checkcountitem("Bones",500) then 
        Mob = {
            "Reborn Skeleton [Lv. 1975]",
            "Demonic Soul [Lv. 2025]",
            "Living Zombie [Lv. 2000]",
            "Posessed Mummy [Lv. 2050]",
        }
        PlaceId = 7449423635
        NameRemote = "TravelZou"
    end
    return Mob, PlaceId, NameRemote
end
function DetectChest()
    local dist = math.huge
    local name
    for k, v in pairs(game.Workspace:GetChildren()) do
        if string.match(v.Name, "Chest")  then
            local magnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
            if magnitude < dist then
                dist = magnitude
                name = v
            end
        end
    end
    if not name then 
        for i,v in next,game:GetService("Workspace").Map:GetDescendants() do
            if v:IsA("Part") and string.find(v.Name, "Chest")  then
                local magnitude = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                if magnitude < dist then
                    dist = magnitude
                    name = v
                end
            end
        end
    end
    return name 
end
function CountZombie(x)
    local Counter = 0
    for i, v in pairs(game.workspace.Enemies:GetChildren()) do
        if v.Name == "Living Zombie [Lv. 2000]"
        and v.Humanoid.Health > 0 then
            if not x or (v.HumanoidRootPart.Position - Vector3.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)).magnitude < 30 then
                Counter = Counter + 1
                v.HumanoidRootPart.CFrame = CFrame.new(-10171.7607421875, 138.62667846679688, 6008.0654296875)
            end
        end
    end
    return Counter
end

local Section = Tab8:AddSection({
	Name = "Server"
})
local InputJobId
Tab8:AddTextbox({
	Name = "Input JobId",
	Default =  "",
	TextDisappear = true,
    Flag = "Input JobId",
	Callback = function(Value)
        InputJobId = Value
	end	  
})
Tab8:AddButton({
	Name = "Join Server",
	Callback = function()
        while task.wait() do 
            game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",tostring(InputJobId))
        end
  	end    
})
Tab8:AddButton({
	Name = "Copy JobId",
	Callback = function()
        setclipboard(tostring(game.JobId))
  	end    
})
Tab8:AddButton({
	Name = "Hop Server",
	Callback = function()
        HopServer()
  	end    
})
local Section = Tab9:AddSection({
	Name = "Main"
})

Tab9:AddButton({
	Name = "No Fog",
	Callback = function()
        local c = game.Lighting
        c.FogEnd = 100000
        for i, v in pairs(c:GetDescendants()) do
            if v:IsA("Atmosphere") then
                v:Destroy()
            end
        end
  	end    
})
Tab9:AddToggle({
	Name = "Auto Get Cyborg",
	Default = Settings["Auto Get Cyborg"] or false,
    Flag = "Auto Get Cyborg",
	Callback = function(Value)
        SaveSettings("Auto Get Cyborg",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Get Ghoul",
	Default = Settings["Auto Get Ghoul"] or false,
    Flag = "Auto Get Ghoul",
	Callback = function(Value)
        SaveSettings("Auto Get Ghoul",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Get Ghoul [ Hop Find Boss ]",
	Default = Settings["Auto Get Ghoul [ Hop Find Boss ]"] or false,
    Flag = "Auto Get Ghoul [ Hop Find Boss ]",
	Callback = function(Value)
        if Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Auto Get Ghoul, Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
        SaveSettings("Auto Get Ghoul [ Hop Find Boss ]",Value)
	end
})

Tab9:AddToggle({
	Name = "Upgrade Race V2-V3",
	Default = Settings["Upgrade Race V2-V3"] or false,
    Flag = "Upgrade Race V2-V3",
	Callback = function(Value)
        SaveSettings("Upgrade Race V2-V3",Value)
	end
})
function CheckPlayerBackpack(mb)
    k = game.Players.LocalPlayer.Backpack
    k2 = game.Players.LocalPlayer.Character
    for i, v in pairs(k:GetChildren()) do
        if v.Name == tostring(mb) then
            return true
        end
    end
    for i, v in pairs(k2:GetChildren()) do
        if v.Name == tostring(mb) then
            return true
        end
    end
end
function CheckMicrochip()
    if CheckPlayerBackpack("Microchip") then
        return true
    end
end
function CheckCoreBrain()
    if CheckPlayerBackpack("Core Brain") then
        return true
    end
end
function BuyChipLaw()
    v354 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BlackbeardReward", "Microchip", "2")
    if v354 == 1 then
        return true
    end
    if v354 == 0 then
        return false
    end
    if v354 == 2 then
        return true
    end
end

function GetCyborg()
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Check") == 2 then 
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = "Turn Off Please",
            Image = "rbxassetid://4483345998",
            Time = 3
        })
        wait(3)
        return
    end
    if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Check") then 
        game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CyborgTrainer", "Buy")
        return
    end
    if  game.ReplicatedStorage.Remotes.CommF_:InvokeServer("CheckBlockPart") then
        if CheckNameBoss("Order [Lv. 1250] [Raid Boss]") then
            local v = CheckNameBoss("Order [Lv. 1250] [Raid Boss]")
            if v then
                repeat wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Get Cyborg"].Value
            end
        else
            if not CheckMicrochip() and game.Players.LocalPlayer.Data.Fragments.Value >= 1000 then
                BuyChipLaw()
            elseif CheckMicrochip() then
                fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
            end
        end
    else
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = "Find Fist of Darkness, Please",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
        wait(3)
    end
end
function GetGhoul()
    if not checkcountitem("Ectoplasm",100) then
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = "Ectoplasm >= 100",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
        wait(3)
        return 
    end
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Hellfire Torch") or game.Players.LocalPlayer.Character:FindFirstChild("Hellfire Torch") then
        if (CFrame.new(918.615234,122.202454,33454.3789,-0.999998808,0,0.00172644004,0,1,0,-0.00172644004,0,-0.999998808).Position-plr.Character.HumanoidRootPart.Position).Magnitude <= 8 then 
            local args = {
                [1] = "Ectoplasm",
                [2] = "BuyCheck",
                [3] = 4
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            v352 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Ectoplasm", "Buy", 4)
        else
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(918.615234,122.202454,33454.3789,-0.999998808,0,0.00172644004,0,1,0,-0.00172644004,0,-0.999998808).Position,CFrame.new(918.615234,122.202454,33454.3789,-0.999998808,0,0.00172644004,0,1,0,-0.00172644004,0,-0.999998808))
        end
    else
        if CheckNameBoss("Cursed Captain [Lv. 1325] [Raid Boss]") then
            local v = CheckNameBoss("Cursed Captain [Lv. 1325] [Raid Boss]")
            if v then
                repeat wait()
                    sizepart(v)
                    toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                    if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                        DetectFastAttack()
                    end
                    equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Auto Get Ghoul"].Value
                wait(2)
            end
        else
            if OrionLib.Flags["Auto Get Ghoul [ Hop Find Boss ]"].Value then 
                HopServer()
            end
        end
    end
end
function CheckItemInChar(x)
    if plr.Character:FindFirstChild(x) or plr.Backpack:FindFirstChild(x) then 
        return true 
    end
end
function CheckRace()
    local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
    local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1")
    if game.Players.LocalPlayer.Character:FindFirstChild("RaceTransformed") then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V4"
    end
    if v113 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V3"
    end
    if v111 == -2 then
        return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V2"
    end
    return game:GetService("Players").LocalPlayer.Data.Race.Value .. " V1"
end
getgenv().BlBossHuman = {}
function RaceHumanV2()
    local DetectbossHuman =  (not table.find(BlBossHuman,"Jeremy [Lv. 850] [Boss]") and CheckNameBoss("Jeremy [Lv. 850] [Boss]")) or (not table.find(BlBossHuman,"Fajita [Lv. 925] [Boss]") and CheckNameBoss("Fajita [Lv. 925] [Boss]")) or (not table.find(BlBossHuman,"Diamond [Lv. 750] [Boss]") and CheckNameBoss("Diamond [Lv. 750] [Boss]"))
    if DetectbossHuman then 
        local v = DetectbossHuman
        repeat wait()
            sizepart(v)
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                DetectFastAttack()
            end
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Upgrade Race V2-V3"].Value
        if not table.find(BlBossHuman,DetectbossHuman.Name) then
            table.insert(BlBossHuman,DetectbossHuman.Name)
        end
    end
end
function MinkHumanV2()
    local v = DetectChest()
    repeat wait()
        if  (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 2 then
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(v, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        end
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-v.Position).Magnitude <= 5 then 
            game:service("VirtualInputManager"):SendKeyEvent(true, "W", false, game)
            wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, "W", false, game)
        end
        toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,v.Position,v.CFrame*CFrame.new(0,1,0),true)
    until not v or not v.Parent or not OrionLib.Flags["Upgrade Race V2-V3"].Value
end
local SeabeastAim = false
function UpgradeRace()
    local Race = CheckRace()
    if string.find(Race,"V1") then 
        if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 0 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "2")
        elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 1 then
            if not CheckItemInChar("Flower 1") then 
                print("a")
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Flower1.Position,game:GetService("Workspace").Flower1.CFrame)
            elseif not CheckItemInChar("Flower 2") then 
                print("b")
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,game:GetService("Workspace").Flower2.Position,game:GetService("Workspace").Flower2.CFrame)
            elseif not CheckItemInChar("Flower 3") then 
                print("c")
                if not DetectMob("Swan Pirate [Lv. 775]") then 
                    TeleportSpawnMob("Swan Pirate [Lv. 775]",OrionLib.Flags["Upgrade Race V2-V3"].Value)
                else
                    local v = DetectMob("Swan Pirate [Lv. 775]")
                    repeat wait()
                        sizepart(v)
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                        task.spawn(function()
                            BringMob(v)
                        end)
                    until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Upgrade Race V2-V3"].Value
                end
            end
        elseif game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Alchemist", "1") == 2 then
            if (CFrame.new(-2777.6001, 72.9661407, -3571.42285).Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8 then
                toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-2777.6001, 72.9661407, -3571.42285).Position,CFrame.new(-2777.6001, 72.9661407, -3571.42285))
            else
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Alchemist","3")
            end
        else
            if game.ReplicatedStorage.Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") 
                and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible  then
                    if not DetectMob("Swan Pirate [Lv. 775]") then 
                        TeleportSpawnMob("Swan Pirate [Lv. 775]",OrionLib.Flags["Upgrade Race V2-V3"].Value)
                    else
                        local v = DetectMob("Swan Pirate [Lv. 775]")
                        repeat wait()
                            sizepart(v)
                            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                            if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                                DetectFastAttack()
                            end
                            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                            task.spawn(function()
                                BringMob(v)
                            end)
                        until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Upgrade Race V2-V3"].Value
                    end
                else
                    if (plr.Character.HumanoidRootPart.Position-CFrame.new(-456.28952, 73.0200958, 299.895966).Position).Magnitude > 8 then
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,CFrame.new(-456.28952, 73.0200958, 299.895966).Position,CFrame.new(-456.28952, 73.0200958, 299.895966))
                    else
                        local args = {
                            [1] = "StartQuest",
                            [2] = "BartiloQuest",
                            [3] = 1
                        }
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    end
                end
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 1 then
                local v = CheckNameBoss("Jeremy [Lv. 850] [Boss]")
                if v then
                    repeat wait()
                        sizepart(v)
                        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(7,20,0))
                        if (plr.Character.HumanoidRootPart.Position-v.HumanoidRootPart.Position).Magnitude < 50 then
                            DetectFastAttack()
                        end
                        equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
                    until not v or not v.Parent or v.Humanoid.Health == 0  or not OrionLib.Flags["Upgrade Race V2-V3"].Value
                end
            elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 2 then
                repeat wait()
                    if (plr.Character.HumanoidRootPart.Position-Vector3.new(-1835.65, 10.4325, 1679.75)).Magnitude > 100 then
                        toTarget(plr.Character.HumanoidRootPart.Position,Vector3.new(-1835.65, 10.4325, 1679.75),CFrame.new(-1835.65, 10.4325, 1679.75))
                    else
                        plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()].CFrame
                        wait()
                        firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                        firetouchinterest(game:GetService("Workspace").Map.Dressrosa.BartiloPlates[checkplatebarito()], game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
                    end
                until game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress","Bartilo") == 3
            end
        end
    else
        local v113 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "1")
        if v113 == 0 then
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "2")
            return
        elseif v113 == 2 then 
            game.ReplicatedStorage.Remotes.CommF_:InvokeServer("Wenlocktoad", "3")
            return
        elseif v113 == -1 then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Beli >= 2m",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            wait(2)
            return 
        end
        if Race == "Human V2" then 
            RaceHumanV2()
        elseif Race == "Mink V2" then 
            MinkHumanV2()
        elseif Race == "Cyborg V2" then 
            if not checkdevilfruit() then 
                if  getfruitstore(true) then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",getfruitstore(true))
                end
            end
        elseif Race == "Fishman V2" then
            if not checkseabeast() then
                if not checkboat() then
                    local PositionGetBoat = CFrame.new(-13.488054275512695, 10.311711311340332, 2927.692)
                    if game.PlaceId == 7449423635 then
                        PositionGetBoat = CFrame.new(-6044.32, 15.1151, -2038.66)
                    end
                    if (PositionGetBoat.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 8 then
                        toTarget(plr.Character.HumanoidRootPart.Position,PositionGetBoat.Position,PositionGetBoat)
                    else
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat","PirateBasic")
                    end
                else
                    local PositionWaitSea = CFrame.new(28.4108+20, 1.2327+10, 3679.99+10)
                    if game.PlaceId == 7449423635 then
                        PositionWaitSea = CFrame.new(-7551.96, 10.4861, -1537.59)
                    end
                    if (checkboat().VehicleSeat.Position-PositionWaitSea.Position).Magnitude > 50 then 
                        checkboat().VehicleSeat.CFrame = PositionWaitSea
                    else
                        if not plr.Character.Humanoid.Sit then 
                            if (checkboat().VehicleSeat.Position-plr.Character.HumanoidRootPart.Position).Magnitude > 50 then
                                toTarget(plr.Character.HumanoidRootPart.Position,checkboat().VehicleSeat.Position,checkboat().VehicleSeat.CFrame)
                            else
                                plr.Character.HumanoidRootPart.CFrame = checkboat().VehicleSeat.CFrame
                            end
                        end
                    end
                end
            else
                SeabeastAim = true
                local v = checkseabeast()
                repeat wait()
                    TeleportSeabeast(v)
                    spawn(function()
                        autoskill()
                    end)
                    if v:FindFirstChild("Engine") then
                        getgenv().psskill = v.Engine.CFrame
                    else
                        getgenv().psskill = v.HumanoidRootPart.CFrame
                    end
                until not v or not v.Parent or v.Health.Value <= 0 or not OrionLib.Flags["Upgrade Race V2-V3"].Value
                SeabeastAim = false
            end
        else
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Not Support, Suggest Please",
                Image = "rbxassetid://4483345998",
                Time = 2
            })
            wait(1)
        end
    end
end
--a3a4f17e-aa4a-4829-806a-3fc0fb764ec0
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Upgrade Race V2-V3"].Value then 
                UpgradeRace()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Get Cyborg"].Value then 
                GetCyborg()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Get Ghoul"].Value then 
                GetGhoul()
            end
        end)
    end
end)

local Section = Tab9:AddSection({
	Name = "Trial V4"
})
--[[
local SettingMultiAccount = {}
if not pcall(function() readfile(FolderName.."/" .. "AccountMulti.json") end) then
    writefile(FolderName.."/" .. "AccountMulti.json", game:GetService("HttpService"):JSONEncode(SettingMultiAccount))
end

SettingMultiAccount = HttpService:JSONDecode(readfile(FolderName.."/" .. "AccountMulti.json"))
Tab9:AddToggle({
	Name = "Multi Account",
	Default = Settings["Multi Account"] or false,
    Flag = "Multi Account",
	Callback = function(Value)
        SettingMultiAccount[plr.Name] = Value
        writefile(FolderName.."/" .. "AccountMulti.json", game:GetService("HttpService"):JSONEncode(SettingMultiAccount))
        SaveSettings("Multi Account",Value)
	end
})
]]

Tab9:AddToggle({
	Name = "Auto Buy Gear",
	Default = Settings["Auto Buy Gear"] or false,
    Flag = "Auto Buy Gear",
	Callback = function(Value)
        SaveSettings("Auto Buy Gear",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Choose Gears",
	Default = Settings["Auto Choose Gears"] or false,
    Flag = "Auto Choose Gears",
	Callback = function(Value)
        SaveSettings("Auto Choose Gears",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Get Blue Gear",
	Default = false,
    Flag = "Auto Get Blue Gear"
})

getgenv().NoclipButton = false
Tab9:AddButton({
	Name = "Teleport  Door Trial",
	Callback = function()
        NoclipButton = true
        local Door = game:GetService("Workspace").Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value.."Corridor"].Door.Door.RightDoor.Union
        repeat wait()
            toTarget(plr.Character.HumanoidRootPart.Position,Door.Position,Door.CFrame)
        until (Door.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8
        NoclipButton = false 
  	end    
})

Tab9:AddButton({
	Name = "Teleport Acient Clock ",
	Callback = function()
        local Prompt = game:GetService("Workspace").Map["Temple of Time"]:FindFirstChild("Prompt")
        NoclipButton = true
        repeat wait()
            toTarget(plr.Character.HumanoidRootPart.Position,Prompt.Position,Prompt.CFrame)
        until (Prompt.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8
        NoclipButton = false
  	end    
})
local TogglePullLever = Tab9:AddToggle({
	Name = "Pull Lever",
	Default = Settings["Pull Lever"] or false,
    Flag = "Pull Lever",
	Callback = function(Value)
        SaveSettings("Pull Lever",Value)
	end
})
Tab9:AddToggle({
	Name = "Pull Lever [ Hop ]",
	Default = Settings["Pull Lever [ Hop ]"] or false,
    Flag = "Pull Lever [ Hop ]",
	Callback = function(Value)
        if not OrionLib.Flags["Pull Lever"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Turn On Pull Lever Please",
                Image = "rbxassetid://4483345998",
                Time = 5
            }) 
        end
        SaveSettings("Pull Lever [ Hop ]",Value)
	end
})
getgenv().TrialDone = false
local ToggleTrial = Tab9:AddToggle({
	Name = "Auto Trial",
	Default = Settings["Auto Trial"] or false,
    Flag = "Auto Trial",
	Callback = function(Value)
        if Value then 
            if game.Players.LocalPlayer.Data.Race.Value == "Fishman" then 
                OrionLib:MakeNotification({
                    Name = "Banana Hub",
                    Content = "Select Weapons  Kill Seabeast In Setting ",
                    Image = "rbxassetid://4483345998",
                    Time = 5
                }) 
            end
        end
        SaveSettings("Auto Trial",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Trial [ Hop ]",
	Default = Settings["Auto Trial [ Hop ]"] or false,
    Flag = "Auto Trial [ Hop ]",
	Callback = function(Value)
        if not OrionLib.Flags["Auto Trial"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = " Turn On Auto Trial Please ",
                Image = "rbxassetid://4483345998",
                Time = 5
            }) 
        end
        SaveSettings("Auto Trial [ Hop ]",Value)
	end
})
Tab9:AddToggle({
	Name = "Auto Kill Player When complete Trial",
	Default = Settings["Auto Kill Player When complete Trial"] or false,
    Flag = "Auto Kill Player When complete Trial",
	Callback = function(Value)
        if Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = " Pick Weapon In Main Farm ",
                Image = "rbxassetid://4483345998",
                Time = 5
            }) 
        end
        SaveSettings("Auto Kill Player When complete Trial",Value)
	end
})
Tab9:AddToggle({
	Name = "Detect Players When Turn Race V3\n And Auto Turn On Race V3 [ Test ]",
	Default = Settings["Detect Players When Turn Race V3 And Auto Turn On Race V3"] or false,
    Flag = "Detect Players When Turn Race V3 And Auto Turn On Race V3",
	Callback = function(Value)
        if not OrionLib.Flags["Auto Trial"].Value and Value then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = " Turn On Auto Trial Please ",
                Image = "rbxassetid://4483345998",
                Time = 5
            }) 
        end
        SaveSettings("Detect Players When Turn Race V3 And Auto Turn On Race V3",Value)
	end
})
function CheckMultiAccount()
    local mmb = {}
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name ~= plr.Name  then 
            mmb[v.Name] = v.Data.Race.Value
        end
    end
    return mmb
end
function CheckMultiTeleDoor()
    local CountPlayer = 0 
    for i,v in next,CheckMultiAccount() do 
        for i1,v1 in next,game.Workspace.Characters:GetChildren() do
            if  i == v1.Name then 
                if v1.HumanoidRootPart:FindFirstChild("Agility") and (v1.HumanoidRootPart.Position-game:GetService("Workspace").Map["Temple of Time"][v.."Corridor"].Door.Door.RightDoor.Union.Position).Magnitude <= 50 then 
                    CountPlayer = CountPlayer + 1 
                end
            end
        end
    end
    if CountPlayer >= 2 then 
        return true 
    end
end
function TrialHuman()
    if  game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Strength") then
        StrengthPart = game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Strength"].CFrame
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - StrengthPart.Position).Magnitude <= 1000 then
            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if  (v.HumanoidRootPart.Position - StrengthPart.Position).Magnitude <= 1000 then 
                    toTarget(plr.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,75,0))
                    v.Humanoid.Health = 0
                end
            end
        end
    end
end
function TrialGhoul()
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Carnage") then
        if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Carnage"].Position).Magnitude <= 1000 then

            for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                if (v.HumanoidRootPart.Position - game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Carnage"].Position).Magnitude <= 1000 then
                    toTarget(plr.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,75,0))
                    v.Humanoid.Health = 0
                end
            end
        end
    end
end
local autospamskillTrial = false
function GetSeaBeastTrial()
    if not game.Workspace.Map:FindFirstChild("FishmanTrial") then
        autospamskillTrial = false
        return 
    end
    local FishmanTrial 
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then
        FishmanTrial = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water")
    end
    if FishmanTrial then
        for i, v in next, game:GetService("Workspace").SeaBeasts:GetChildren() do
            if string.find(v.Name, "SeaBeast") and v:FindFirstChild("HumanoidRootPart") and (v.HumanoidRootPart.Position - FishmanTrial.Position).Magnitude <= 1500 then
                if v.Health.Value > 0 then
                    return v
                end
            end
        end
    end
end

function function7()
    local GameTime = "Error"
    local c2 = game.Lighting.ClockTime
    if c2 >= 18 or c2 < 5 then
        GameTime = "Night"
    else
        GameTime = "Day"
    end
    return GameTime
end
getgenv().KillAuraDone = false
spawn(function()
    while wait() do
        pcall(function()
            for i,v in pairs(plr.PlayerGui.Notifications:GetDescendants()) do
                if v:IsA("TextLabel") then 
                    if string.find(v.Text,"completed your trial!")  or string.find(v.Text,"All trials have been completed!") then 
                        TrialDone = true 
                    end
                    if string.find(v.Text,"FIGHT!") then
                        wait(1)
                        KillAuraDone = true 
                    end
                end
            end
        end)
    end
end) 
loadstring([[
    local dotehookold
    dotehookold = hookfunction(require(game:GetService("ReplicatedStorage").Notification).new,function(...)
        local Args = {...}
        if Args[1] and (string.find(Args[1],"completed your trial!")  or string.find(Args[1],"All trials have been completed!")) then
            TrialDone = true 
        end
        if Args[1] and string.find(Args[1],"FIGHT!")  then
            KillAuraDone = true 
        end
        return dotehookold(...)
    end)
]])()
spawn(function()
game.ReplicatedStorage.Remotes.Temple.OnClientEvent:Connect((function(a1, a2)
    if a1 == "Start" and (a2 == 2 or a2 == "2") then 
        KillAuraDone = true

    end
end))
end)
function DetectPlayerKillauraTrial()
    for i,v in next,game.Workspace.Characters:GetChildren() do 
        if v:IsA("Model") and  v.Name ~= plr.Name and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and (v.HumanoidRootPart.Position-Vector3.new(28718.068359375, 14887.5625, -60.5482177734375)).Magnitude <= 150 then 
            return v
        end
    end
end

function  AutoKilPlayer()
    if not game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible and KillAuraDone then 
        KillAuraDone = false 
        return
    end
    if KillAuraDone and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible  
    and DetectPlayerKillauraTrial()  then
        local v = DetectPlayerKillauraTrial()
        if v then 
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,v.HumanoidRootPart.Position,v.HumanoidRootPart.CFrame*CFrame.new(0,0,4))
            equiptool(NameWeapon(OrionLib.Flags["Select Weapon"].Value))
        end
    end 
end
function AutoTrials()
    if  (CheckMoon() == "Full Moon"  or CheckMoon() == "Next Night")   and OrionLib.Flags["Auto Trial [ Hop ]"].Value  then 
        OrionLib:MakeNotification({
            Name = "Banana Hub",
            Content = " Turn Off Hop Trial, Please ",
            Image = "rbxassetid://4483345998",
            Time = 5
        }) 
        wait(3)
        return 
    else
        if OrionLib.Flags["Auto Trial [ Hop ]"].Value then 
            HopServer()
            return 
        end
    end
    if TrialDone then 
        ToggleTrial:Set(false)
        if autospamskillTrial then 
            autospamskillTrial = false
        end
        wait()
        TrialDone = false
        return 
    end
    if game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible then
        local Race = game.Players.LocalPlayer.Data.Race.Value
        if Race == "Human" then 
            TrialHuman()
        elseif Race == "Skypiea" then 
            if game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of the King"] and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of the King"].CFrame.Position).Magnitude <= 1000 then
                local FinishPart = game:GetService("Workspace").Map.SkyTrial.Model.FinishPart
                toTarget(plr.Character.HumanoidRootPart.Position,FinishPart.Position,FinishPart.CFrame)
                wait(3)
            end
        elseif Race == "Fishman" then
            local FishmanTrial 
            if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water") then
                FishmanTrial = game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Trial of Water")
            end
            if FishmanTrial and (FishmanTrial.Position-plr.Character.HumanoidRootPart.Position).Magnitude < 1500 then
                if GetSeaBeastTrial() then
                    autospamskillTrial = true
                    spawn(function()
                        autoskill()
                    end)
                    TeleportSeabeast(GetSeaBeastTrial())
                    getgenv().psskill = GetSeaBeastTrial().HumanoidRootPart.CFrame
                else
                    autospamskillTrial = false
                end
            end
        elseif Race == "Mink" then
            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position-game:GetService("Workspace")["_WorldOrigin"].Locations["Trial of Speed"].Position).Magnitude <= 1000 then
                toTarget(plr.Character.HumanoidRootPart.Position,game:GetService("Workspace").StartPoint.Position,game:GetService("Workspace").StartPoint.CFrame*CFrame.new(0,2,0))
            end
        elseif Race == "Ghoul" then 
            TrialGhoul()
        elseif Race == "Cyborg" then
            CyborgBypassCFrame = CFrame.new(-20021.8691,10090.4893,-16.37994,-0.976144373,6.71342875e-08,-0.217122361,8.46145412e-08,1,-7.1212007e-08,0.217122361,-8.78849065e-08,-0.976144373)
            if (CyborgBypassCFrame.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 2000 then

                toTarget(plr.Character.HumanoidRootPart.Position,CyborgBypassCFrame.Position,CyborgBypassCFrame)
                wait(3)
            end
        end
    else
        if not TrialDone and not game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible   then 
            local Door = game:GetService("Workspace").Map["Temple of Time"][game.Players.LocalPlayer.Data.Race.Value.."Corridor"].Door.Door.RightDoor.Union
            toTarget(plr.Character.HumanoidRootPart.Position,Door.Position,Door.CFrame)
            if OrionLib.Flags["Detect Players When Turn Race V3 And Auto Turn On Race V3"].Value  and  CheckMultiTeleDoor() then 
                game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
                wait()
                game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
            end
        end
    end
end

spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Trial"].Value then 
                AutoTrials()
            end
        end)
    end
end)
spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Kill Player When complete Trial"].Value then 
                AutoKilPlayer()
            end
        end)
    end
end)
task.spawn(function()
    while task.wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Kill Player When complete Trial"].Value and KillAuraDone and game.Players.LocalPlayer.PlayerGui.Main.Timer.Visible then 
                autoattack()
            end
        end)
    end
end)



function getBlueGear()
    if game.workspace.Map:FindFirstChild("MysticIsland") then
        for i, v in pairs(game.workspace.Map.MysticIsland:GetChildren()) do
            if v:IsA("MeshPart") and v.MeshId == "rbxassetid://10153114969" then --and not v.CanCollide then
                return v
            end
        end
    end
end
function getHighestPoint()
    if not game.workspace.Map:FindFirstChild("MysticIsland") then
        return nil
    end
    for i, v in pairs(game:GetService("Workspace").Map.MysticIsland:GetDescendants()) do
        if v:IsA("MeshPart") then
            if v.MeshId == "rbxassetid://6745037796" then
                return v
            end
        end
    end
end
function CollectBlueGear()
    local BlueGear = getBlueGear()
    if BlueGear and not BlueGear.CanCollide and BlueGear.Transparency ~= 1 then
        toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,getBlueGear().Position,getBlueGear().CFrame)
    elseif BlueGear and BlueGear.Transparency == 1 then
        if (getHighestPoint().CFrame*CFrame.new(0, 211.88, 0).Position-plr.Character.HumanoidRootPart.Position).Magnitude > 10 then 
            toTarget(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position,getHighestPoint().Position,getHighestPoint().CFrame*CFrame.new(0, 211.88, 0))
        else
            workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position,game:GetService("Lighting"):GetMoonDirection() + workspace.CurrentCamera.CFrame.Position)
            wait(.1)
            game:service("VirtualInputManager"):SendKeyEvent(true, "T", false, game)
            wait()
            game:service("VirtualInputManager"):SendKeyEvent(false, "T", false, game)
            wait(1.5)
        end
    end
end
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Get Blue Gear"].Value then 
                CollectBlueGear()
            end
        end)
    end
end) 
local Doorsau = CFrame.new(28576.4688,14935.9512,75.469101,-1,-4.22219593e-08,1.13133396e-08,0,-0.258819044,-0.965925813,4.37113883e-08,-0.965925813,0.258819044)
local Door2 = 0.2

function PullLever()
    if not game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CommF_"):InvokeServer("CheckTempleDoor") then 
        if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and function7() == "Night" then
            local v213 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Check")
            if v213 == 1 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Begin")
            elseif v213 == 2 then
                toTarget(plr.Character.HumanoidRootPart.Position,CFrame.new(2956.78, 2281.85, -7217.63).Position,CFrame.new(2956.78, 2281.85, -7217.63))
                if (CFrame.new(2956.78, 2281.85, -7217.63).Position-plr.Character.HumanoidRootPart.Position).Magnitude < 8 then 
                    local args = {
                        [1] = "RaceV4Progress",
                        [2] = "Teleport"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                end
            elseif v213 == 3 then
                game.ReplicatedStorage.Remotes.CommF_:InvokeServer("RaceV4Progress", "Continue")
            else
                CollectBlueGear()
            end
        elseif game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and function7() ~= "Night" then 
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Waiting  Night",
                Image = "rbxassetid://4483345998",
                Time = 3
            })
            wait(5)
        elseif not game:GetService("Workspace").Map:FindFirstChild("MysticIsland") and OrionLib.Flags["Pull Lever [ Hop ]"].Value then 
            HopServer()
        end
    else
        if game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z > Doorsau.Z + Door2 or game:GetService("Workspace").Map["Temple of Time"].Lever.Lever.CFrame.Z < Doorsau.Z - Door2 then 
            if (plr.Character.HumanoidRootPart.Position-game:GetService("Workspace").Map["Temple of Time"].Lever.Part.Position).Magnitude > 10 then
                toTarget(plr.Character.HumanoidRootPart.Position,game:GetService("Workspace").Map["Temple of Time"].Lever.Part.Position,game:GetService("Workspace").Map["Temple of Time"].Lever.Part.CFrame)
            else
                fireproximityprompt(workspace.Map["Temple of Time"].Lever.Prompt.ProximityPrompt,1)
            end
        else
            OrionLib:MakeNotification({
                Name = "Banana Hub",
                Content = "Pull Lever Complete",
                Image = "rbxassetid://4483345998",
                Time = 2
            })
            TogglePullLever:Set(false)
        end
    end
end

spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Pull Lever"].Value then 
                PullLever()
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Buy Gear"].Value then 
                if string.find(CheckAcientOneStatus(),"Can Buy Gear") then
                    game.ReplicatedStorage.Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
                end
            end
        end)
    end
end)


local Gears = {
    "Alpha",
    "Omega"
}
function DetectGearUp()
    for i,v in next,workspace.Map["Temple of Time"].InnerClock:GetChildren() do 
        if v:IsA("MeshPart") and v:FindFirstChild("Highlight") and v.Highlight.FillTransparency == 1 then 
            return v.Name
        end
    end
end
local NumberGear  = 1
spawn(function()
    while wait() do 
        pcall(function()
            if OrionLib.Flags["Auto Choose Gears"].Value then 
                local v111 = game.ReplicatedStorage.Remotes.CommF_:InvokeServer("TempleClock", "Check")
                if v111 and  v111.HadPoint then
                    if DetectGearUp() then 
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","SpendPoint",DetectGearUp(),"Omega")
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TempleClock","SpendPoint",DetectGearUp(),"Alpha")
                    else
                        getsenv(game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.LocalScript):EaseIn()
                    end
                else
                    if game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.Enabled then 
                        getsenv(game:GetService("Players").LocalPlayer.PlayerGui.TempleGui.LocalScript):EaseOut()
                    end
                end
            end
        end)
    end
end)
spawn(function()
    while wait() do 
        pcall(function()
            for i,v in next,tablestats do 
                if OrionLib.Flags["Stats "..i].Value and game.Players.localPlayer.Data.Points.Value > 0 and game:GetService("Players").LocalPlayer.Data.Stats[i].Level.Value < 2450 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint", i, 9999)
                end
            end
        end)
    end
end)
