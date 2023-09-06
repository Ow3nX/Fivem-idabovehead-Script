Config = {}

-- Key to toggle the display of ID numbers
Config.ToggleKey = 168 -- F7 (You can change this to any other key, find key codes online)

-- Font settings
Config.Font = 0 -- Use 0 for default font, you can change this if you have custom fonts
Config.FontSize = 0.3 -- Adjust the font size as needed

-- Text color
Config.TextColor = { r = 255, g = 255, b = 255, a = 255 } -- White color

-- Enable or disable ID numbers by default
Config.DefaultEnabled = true

-- Display format (you can customize this to display more information)
Config.DisplayFormat = 'ID: %d'

-- Distance at which ID numbers are visible
Config.MaxDistance = 50.0 -- Adjust as needed

-- Update interval in milliseconds (lower values may impact performance)
Config.UpdateInterval = 500 -- 0.5 seconds

-- Anti-spam delay in milliseconds (prevents rapid toggling)
Config.AntiSpamDelay = 1000 -- 1 second

-- Do not edit below this line
Config.Enabled = Config.DefaultEnabled