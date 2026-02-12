--[[
    DUIF - Dubz UI Framework
    File: cl_fonts.lua
    Purpose: Centralized DUIF font creation with graceful fallback chain.
]]

DUIF = DUIF or {}

local fontFallbacks = {
    "Inter",
    "Poppins",
    "Roboto",
    "Segoe UI",
    "Tahoma",
    "Arial"
}

local monoFallbacks = {
    "JetBrains Mono",
    "Roboto Mono",
    "Consolas",
    "Courier New"
}

local function chooseFont(list)
    -- Garry's Mod cannot reliably probe installed system fonts cross-platform.
    -- Use first preferred family and rely on Source engine fallback if missing.
    return list[1]
end

function DUIF.BuildFonts(scale)
    scale = scale or 1

    local base = chooseFont(fontFallbacks)
    local mono = chooseFont(monoFallbacks)

    surface.CreateFont("DUIF.Title", {
        font = base,
        size = math.floor(30 * scale),
        weight = 800,
        antialias = true,
        extended = true
    })

    surface.CreateFont("DUIF.Header", {
        font = base,
        size = math.floor(22 * scale),
        weight = 700,
        antialias = true,
        extended = true
    })

    surface.CreateFont("DUIF.Body", {
        font = base,
        size = math.floor(17 * scale),
        weight = 520,
        antialias = true,
        extended = true
    })

    surface.CreateFont("DUIF.Small", {
        font = base,
        size = math.floor(14 * scale),
        weight = 460,
        antialias = true,
        extended = true
    })

    surface.CreateFont("DUIF.Mono", {
        font = mono,
        size = math.floor(14 * scale),
        weight = 500,
        antialias = true,
        extended = true
    })
end

DUIF.BuildFonts()

hook.Add("OnScreenSizeChanged", "DUIF.RebuildFonts", function(oldW, oldH)
    DUIF.BuildFonts()
end)
