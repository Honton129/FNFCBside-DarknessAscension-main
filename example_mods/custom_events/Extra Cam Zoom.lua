function onSongStart()
    ogCam = getProperty('defaultCamZoom')
    return Function_Continue
end
function onEvent(n,v1,v2)
    if n == "Extra Cam Zoom" then
        if v1 == '0' then
            setProperty("defaultCamZoom",ogCam)
        else
            setProperty("defaultCamZoom",getProperty('defaultCamZoom')+v1)
        end
    end
end
