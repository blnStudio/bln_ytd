local dict = "bln_tutorial_dict" -- dictionary name
local textureName = "phonograph" -- texture name

-- Request the texture dictionary
CreateThread(function()
    RequestStreamedTextureDict(dict, false)
    while not HasStreamedTextureDictLoaded(dict) do
        Wait(100)
    end
end)

-- Draw sprite in the middle of the screen
CreateThread(function()
    while true do
        Wait(0)

        if HasStreamedTextureDictLoaded(dict) then
            local centerX = 0.5
            local centerY = 0.5

            -- Draw sprite (adjust size as needed)
            local spriteWidth = 0.1   -- 10% of screen width
            local spriteHeight = 0.17 -- 10% of screen height

            DrawSprite(
                dict,
                textureName,
                centerX,      -- X position (normalized 0.0-1.0)
                centerY,      -- Y position (normalized 0.0-1.0)
                spriteWidth,  -- Width (normalized)
                spriteHeight, -- Height (normalized)
                0.0,          -- Rotation
                255,          -- Red
                255,          -- Green
                255,          -- Blue
                255           -- Alpha
            )
        end
    end
end)
