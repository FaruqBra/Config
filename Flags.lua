--[[
    YourHub - Config/Flags.lua

    SINGLE SOURCE OF TRUTH untuk feature state.
    UI HANYA mengubah nilai di sini.
    Features HANYA membaca nilai dari sini.

    Pattern:
    - UI: toggle → Flags.AutoFarm = true
    - Feature: if Flags.AutoFarm then ... end
]]

local Flags = {}

-- ============================================================
-- UNIVERSAL FEATURES
-- ============================================================
Flags.ESP              = false
Flags.ESP_ShowMobs     = true
Flags.ESP_ShowDrops    = true
Flags.ESP_ShowPlayers  = false
Flags.ESP_MaxDistance  = 500

Flags.Fly              = false
Flags.FlySpeed         = 50

Flags.NoClip           = false

Flags.Teleport         = false  -- TP ke target aktif

-- ============================================================
-- SLIME RNG — FARMING
-- ============================================================
Flags.AutoFarm         = false
Flags.AutoFarm_Range   = 50    -- stud radius
Flags.AutoFarm_UseTP   = true  -- teleport ke mob atau tidak

-- ============================================================
-- SLIME RNG — ROLLING
-- ============================================================
Flags.AutoRoll         = false
Flags.AutoRoll_Delay   = 0.15  -- detik antar roll

-- ============================================================
-- SLIME RNG — POTION
-- ============================================================
Flags.AutoPotion         = false
Flags.AutoPotion_MinHP   = 50   -- persen HP minimal sebelum pakai potion

-- ============================================================
-- SLIME RNG — CRAFT
-- ============================================================
Flags.AutoCraft          = false
Flags.AutoCraft_Target   = "Crafty"  -- nama slime target

-- ============================================================
-- SLIME RNG — UPGRADE
-- ============================================================
Flags.AutoUpgrade        = false
Flags.AutoUpgrade_Target = "Damage"  -- stat yang di-upgrade

-- ============================================================
-- SLIME RNG — PET
-- ============================================================
Flags.AutoEquipBestPet   = false

-- ============================================================
-- SLIME RNG — ZONE
-- ============================================================
Flags.AutoBuyZone        = false
Flags.AutoTeleportZone   = false
Flags.AutoTeleportZone_Target = 1  -- zone number target

-- ============================================================
-- RESET ALL FLAGS
-- ============================================================
function Flags.ResetAll()
    Flags.ESP              = false
    Flags.Fly              = false
    Flags.NoClip           = false
    Flags.Teleport         = false
    Flags.AutoFarm         = false
    Flags.AutoRoll         = false
    Flags.AutoPotion       = false
    Flags.AutoCraft        = false
    Flags.AutoUpgrade      = false
    Flags.AutoEquipBestPet = false
    Flags.AutoBuyZone      = false
    Flags.AutoTeleportZone = false
    print("[Flags] ✓ Semua flags direset.")
end

-- ============================================================
-- CALLBACK SYSTEM (opsional, untuk UI sync)
-- ============================================================
local _callbacks = {}

function Flags.OnChange(flagName, callback)
    if not _callbacks[flagName] then
        _callbacks[flagName] = {}
    end
    table.insert(_callbacks[flagName], callback)
end

function Flags.Set(flagName, value)
    Flags[flagName] = value
    -- Trigger callbacks
    if _callbacks[flagName] then
        for _, cb in ipairs(_callbacks[flagName]) do
            pcall(cb, value)
        end
    end
end

return Flags
