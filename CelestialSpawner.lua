-- // Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- // Create the Window
local Window = Rayfield:CreateWindow({
    Name = "Celestial Spawner",
    LoadingTitle = "Celestial Hub",
    LoadingSubtitle = "by Grow A Garden",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = true,
    KeySettings = {
        Title = "Celestial Spawner",
        Subtitle = "Key Verification",
        Note = "Enter the correct key to continue.",
        SaveKey = false,
        Key = "CELESTIALONTOP"
    }
})

-- // Pets Tab 🐕
local PetsTab = Window:CreateTab("🐕 Pet Spawner")

local PetName = ""
local PetWeight = ""

PetsTab:CreateInput({
    Name = "Pet Name",
    PlaceholderText = "Enter Pet Name Here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        PetName = Text
    end,
})

PetsTab:CreateInput({
    Name = "Pet Weight",
    PlaceholderText = "Enter Pet Weight Here (Number)",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        PetWeight = Text
    end,
})

PetsTab:CreateButton({
    Name = "Spawn ✅",
    Callback = function()
        if PetName ~= "" and PetWeight ~= "" then
            game:GetService("ReplicatedStorage"):WaitForChild("GivePetRE"):FireServer(PetName, PetWeight)
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Please fill out both Pet Name and Pet Weight.",
                Duration = 3
            })
        end
    end,
})

-- // Weather Tab 🌈
local WeatherTab = Window:CreateTab("🌈 Weather Spawner")

local WeatherName = ""

WeatherTab:CreateInput({
    Name = "Weather Name",
    PlaceholderText = "Enter Weather Name Here",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        WeatherName = Text
    end,
})

WeatherTab:CreateButton({
    Name = "Spawn ✅",
    Callback = function()
        if WeatherName ~= "" then
            game:GetService("ReplicatedStorage"):WaitForChild("StartWeatherEvent"):FireServer(WeatherName)
        else
            Rayfield:Notify({
                Title = "Error",
                Content = "Please enter a Weather Name.",
                Duration = 3
            })
        end
    end,
})
