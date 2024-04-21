--[[ ===================================================== ]] --
--[[            MH Greenzone Script by MaDHouSe            ]] --
--[[ ===================================================== ]] --
local zones = {}
local isInGreenZone = false

local function DestroyZones()
    for k, zone in pairs(zones) do
        if zone ~= nil then zone:destroy() end
    end
    zones = {}
end

local function CreateGreenZones()
    for k, v in pairs(Config.Greenzones) do
        zones["zone_" .. v.id] = {}
        zones[#zones + 1] = PolyZone:Create({table.unpack(v.zone.vectors)}, {
            name = v.zone.name, 
            minZ = v.zone.minZ, 
            maxZ = v.zone.maxZ,
        })
        zones["zone_" .. v.id].zonecombo = ComboZone:Create(zones, { 
            name = "ZonesCombo", 
            debugPoly = Config.DebugPoly 
        })
        zones["zone_" .. v.id].zonecombo:onPlayerInOut(function(isPointInside)
            if isPointInside then
                isInGreenZone = true
            else
                isInGreenZone = false
            end
        end)
    end
end

--- Draw Txt
---@param x number
---@param y number
---@param width number
---@param height number
---@param scale number
---@param text string
---@param r number
---@param g number
---@param b number
---@param a number
local function DrawTxt(x, y, width, height, scale, text, r, g, b, a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width / 2, y - height / 2 + 0.005)
end

local function DisableControls()
    local ped = PlayerPedId()
    SetPlayerCanDoDriveBy(ped, false)  -- Disable DriveBy
    DisableControlAction(2, 37, true)  -- Disable Weaponwheel
    DisablePlayerFiring(ped, true)     -- Disable firing 
    DisableControlAction(0, 45, true)  -- Disable reloading
    DisableControlAction(0, 24, true)  -- Disable attacking
    DisableControlAction(0, 263, true) -- Disable melee attack 1
    DisableControlAction(0, 140, true) -- Disable light melee attack (r)
    DisableControlAction(0, 142, true) -- Disable left mouse button (pistol whack etc)
    DisableControlAction(0, 264, true) -- Disable melee
    DisableControlAction(0, 257, true) -- Disable melee
    DisableControlAction(0, 141, true) -- Disable melee
    DisableControlAction(0, 143, true) -- Disable melee
    DisableControlAction(0, 24, true)  -- Attack
    DisableControlAction(0, 257, true) -- Attack 2
    DisableControlAction(0, 25, true)  -- Aim
end

local function NoCollisions()
    for k, player in pairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        SetEntityNoCollisionEntity(GetPlayerPed(-1), GetVehiclePedIsIn(ped, false), true)
        SetEntityNoCollisionEntity(GetVehiclePedIsIn(ped, false), GetVehiclePedIsIn(GetPlayerPed(-1), false), true)
    end
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        CreateGreenZones()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        DestroyZones()
    end
end)

AddEventHandler('playerSpawned', function()
    CreateGreenZones()
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        if isInGreenZone then
            sleep = 1
            if Config.DisableCollisions then
                NoCollisions()
            end
            if Config.DisablecControls then 
                DisableControls() 
            end
            if Config.DisplayZoneMessage then 
                DrawTxt(0.94, 1.45, 1.0, 1.0, 0.6, Config.GreezeZoneDisplayName, 255, 255, 255, 255)
            end
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do
        local sleep = 10000
        if isInGreenZone then
            if Config.AutoAttHunderAndThirst then
                if GetResourceState("es_extended") ~= 'missing' then
                    TriggerEvent('esx_status:add', "hunger", 100.0)
                    TriggerEvent('esx_status:add', "thirst", 100.0)
                elseif GetResourceState("qb-core") ~= 'missing' then
                    TriggerServerEvent('consumables:server:addHunger', 100)
                    TriggerServerEvent('consumables:server:addThirst', 100)
                end
            end
        end
        Citizen.Wait(sleep)
    end
end)
