--[[
Grow A Garden Hub - Rayfield Version
Copyright (c) 2025 YourName

All Rights Reserved.

This software is for personal use only. No part of this script may be
copied, distributed, shared, or modified by anyone other than the
author. Unauthorized use, redistribution, or commercial use is strictly
prohibited.
]]


-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()

-- Create main window
local Window = Rayfield:CreateWindow({
	Name = "Grow A Garden Hub",
	LoadingTitle = "Loading...",
	LoadingSubtitle = "Please wait",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "GrowAGardenHubConfig"
	},
	KeySystem = false, -- set true if you want a key system
	KeySettings = {
		Title = "Key System",
		Subtitle = "Enter Key",
		FileName = "GrowAGardenHubKey",
		SaveKey = true
	}
})

-- ===== Pet Giver Tab =====
local PetTab = Window:CreateTab("Pet Giver", 4483362458)
local PetSection = PetTab:CreateSection("Pet Controls")

local PetNameBox = PetSection:CreateTextBox({
	Name = "Pet Name",
	PlaceholderText = "Enter Pet Name",
	Callback = function(txt)
		-- stores value for button
		PetNameBox.TextValue = txt
	end
})

local PetWeightBox = PetSection:CreateTextBox({
	Name = "Pet Weight",
	PlaceholderText = "Enter Weight",
	Callback = function(txt)
		PetWeightBox.TextValue = txt
	end
})

PetSection:CreateButton({
	Name = "Give Pet",
	Callback = function()
		local petName = PetNameBox.TextValue or ""
		local weight = tonumber(PetWeightBox.TextValue)
		if petName ~= "" and weight then
			game:GetService("ReplicatedStorage").GivePetRE:FireServer(petName, weight)
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "Invalid Pet Name or Weight!",
				Duration = 2,
				Image = 4483362458
			})
		end
	end
})

-- ===== Weather Spawner Tab =====
local WeatherTab = Window:CreateTab("Weather Spawner", 4483362458)
local WeatherSection = WeatherTab:CreateSection("Weather Controls")

local WeatherNameBox = WeatherSection:CreateTextBox({
	Name = "Weather Name",
	PlaceholderText = "Enter Weather Name",
	Callback = function(txt)
		WeatherNameBox.TextValue = txt
	end
})

WeatherSection:CreateButton({
	Name = "Start Weather",
	Callback = function()
		local weatherName = WeatherNameBox.TextValue or ""
		if weatherName ~= "" then
			game:GetService("ReplicatedStorage").StartWeatherEvent:FireServer(weatherName)
		else
			Rayfield:Notify({
				Title = "Error",
				Content = "Invalid Weather Name!",
				Duration = 2,
				Image = 4483362458
			})
		end
	end
})

-- ===== Extra: Toggle Window (Rayfield has built-in toggle) =====
Rayfield:Notify({
	Title = "Loaded",
	Content = "Grow A Garden Hub Loaded Successfully!",
	Duration = 2,
	Image = 4483362458
})
