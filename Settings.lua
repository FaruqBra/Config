--[[
    YourHub - Config/Settings.lua
    User-configurable settings yang bisa diubah dari UI.
    Berbeda dari Flags: ini adalah konfigurasi, bukan on/off toggle.
]]

local Settings = {}

-- ============================================================
-- HUB SETTINGS
-- ============================================================
Settings.Hub = {
    ShowWatermark  = true,
    WatermarkText  = "YourHub v1.0",
    NotifEnabled   = true,
    DebugMode      = false,  -- tampilkan debug info
}

-- ============================================================
-- FARM SETTINGS
-- ============================================================
Settings.Farm = {
    Range           = 50,
    TeleportDelay   = 0.3,  -- cooldown antar teleport
    AttackDelay     = 0.1,
    TargetPriority  = "Nearest",  -- "Nearest" | "Furthest" | "Lowest HP"
}

-- ============================================================
-- ROLL SETTINGS
-- ============================================================
Settings.Roll = {
    Delay       = 0.15,
    StopOnRoll  = "",       -- nama slime yang kalau dapat, stop roll
    UseGamepass = false,
}

-- ============================================================
-- ESP SETTINGS
-- ============================================================
Settings.ESP = {
    BoxColor     = Color3.fromRGB(255, 50, 50),
    TextColor    = Color3.fromRGB(255, 255, 255),
    MaxDistance  = 500,
    ShowName     = true,
    ShowDistance = true,
    ShowHP       = false,
}

-- ============================================================
-- FLY SETTINGS
-- ============================================================
Settings.Fly = {
    Speed    = 50,
    MaxSpeed = 200,
}

-- ============================================================
-- UI SETTINGS
-- ============================================================
Settings.UI = {
    Theme = "Dark",  -- "Dark" | "Light" | "Purple"
    Scale = 1.0,     -- UI scale factor
}

return Settings
