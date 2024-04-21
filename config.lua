--[[ ===================================================== ]] --
--[[            MH Greenzone Script by MaDHouSe            ]] --
--[[ ===================================================== ]] --
Config = {}
Config.DebugPoly = false
Config.DisablecControls = true
Config.DisableCollisions = true
Config.DisplayZoneMessage = true
Config.GreezeZoneDisplayName = "~g~GREENZONE~w~" -- display message on screen

Config.AutoAddHunderAndThirst = false -- only for qv and esx

Config.Greenzones = {
    {
        id = 1,
        label = "Achter blokkenpark bank",
        coords = vector4(149.8956, -1076.1023, 30.7729, 0.0),
        length = 50,
        wide = 50,
        radius = 50.0,
        zone = {
            name = 'greenzone1',
            vectors = {
                vector2(93.707336425781, -1081.5031738281),
                vector2(109.86840057373, -1045.8815917969),
                vector2(148.01579284668, -1059.0126953125),
                vector2(151.16691589355, -1063.5948486328),
                vector2(173.31268310547, -1071.7613525391),
                vector2(173.05363464355, -1072.6853027344),
                vector2(174.3592376709, -1073.1420898438),
                vector2(174.02635192871, -1075.3409423828),
                vector2(174.02946472168, -1075.9801025391),
                vector2(174.50643920898, -1076.0681152344),
                vector2(173.11907958984, -1084.2076416016),
                vector2(173.03277587891, -1089.5074462891),
                vector2(166.0503692627, -1089.5043945312),
                vector2(166.01422119141, -1086.8582763672),
                vector2(127.05686187744, -1086.8420410156),
                vector2(126.94152832031, -1089.8355712891),
                vector2(124.11051177979, -1089.8312988281),
                vector2(124.07033538818, -1089.2883300781),
                vector2(114.87495422363, -1089.3100585938),
                vector2(111.89915466309, -1090.6650390625),
                vector2(110.496925354, -1091.3482666016),
                vector2(104.878074646, -1089.3052978516),
                vector2(106.01164245605, -1086.0466308594),
            },
            minZ = 26.192361831665,
            maxZ = 32.192361831665,
        }
    },
}
