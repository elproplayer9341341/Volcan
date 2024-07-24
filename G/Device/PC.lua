local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Evade v1.8",
    SubTitle = "by Volcan",
    TabWidth = 160,
    Size = UDim2.fromOffset(380, 460),
    Acrylic = false, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "Script loaded",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



    Tabs.Main:AddParagraph({
        Title = "Farm",
        Content = "Farm Options"
    })
  
    local Toggle = Tabs.Main:AddToggle("MyToggle1", {Title = "Auto Farm Event", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
      while Options.MyToggle1.Value == true do
wait()
        local ti = game.Workspace["Game"].Effects.Tickets
        for i,v in pairs(ti:GetChildren())
game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v:WaitForChild("HumanoidRootPart").CFrame
          Fluent:Notify({
        Title = "Farm",
        Content = "Ticket Collected",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })
      end
      end
    end)

   Tabs.Main:AddParagraph({
        Title = "Player",
        Content = "Player Options"
    })

    local Toggle = Tabs.Main:AddToggle("MyToggle2", {Title = "Inf Respawns", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
      while Options.MyToggle2.Value == true do
wait()
   game.ReplicatedStorage.Events.Respawn:FireServer()
      end
    end)
