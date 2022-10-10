local HideScreen = false
local ForceNoclip = true  
local player = game.Players.LocalPlayer
local character = player.Character
local ContextActionService = game:GetService("ContextActionService")
local vu = game:GetService("VirtualUser")
local FREEZE_ACTION = "freezeMovement"
loadstring(game:HttpGet('https://raw.githubusercontent.com/LSUDEV/LSU-Public/main/Utils/print.lua'))()
local version = 1

--// Init AC-BYPASS \\--
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

local OldNameCall 
OldNameCall = hookmetamethod(game, "__namecall", function(...) 
    local Self, Args = (...), ({select(2, ...)})
    if getnamecallmethod() == "Kick" and Self == player then 
        return
    end
    return OldNameCall(...)
end)

local ItemList = {
    ["SwollTree"] = game:GetService("Workspace"):FindFirstChild("Swoll Tree").Trunk,
    ["CoalNode"] = game:GetService("Workspace"):FindFirstChild("Coal Node")["Small Rock"],
}
local OldItemPos = game:GetService("Workspace")["Swoll Tree"].Trunk.Position
function TP(cframe)
    if HideScreen then
    game.RunService:Set3dRenderingEnabled(false)
    end
    ContextActionService:BindAction(FREEZE_ACTION,function() return Enum.ContextActionResult.Sink end,false,unpack(Enum.PlayerActions:GetEnumItems()))
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1098, -115, -426)
    ContextActionService:UnbindAction(FREEZE_ACTION)
    game.Players.LocalPlayer.Character.Humanoid.Jump = true
    wait(0.5)
    game.Players.LocalPlayer.Character.Humanoid.Jump = false
    firetouchinterest(game:GetService("Workspace").TpBack.TopOfWhiteAntArea, game:GetService("Workspace"):FindFirstChild(tostring(game.Players.LocalPlayer.Name)).HumanoidRootPart, 1)
    firetouchinterest(game:GetService("Workspace").TpBack.TopOfWhiteAntArea, game:GetService("Workspace"):FindFirstChild(tostring(game.Players.LocalPlayer.Name)).HumanoidRootPart, 1)
    character.HumanoidRootPart.CFrame = cframe
    if ForceNoclip then
    game:GetService("Workspace")["Swoll Tree"].Trunk.Position = game.Players.LocalPlayer.Character.UpperTorso.Position
    wait(0.1)
    game:GetService("Workspace")["Swoll Tree"].Trunk.Position = OldItemPos
    end
    if HideScreen then
        game.RunService:Set3dRenderingEnabled(true)
    end
end