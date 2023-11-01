function onStartCountdown()
   setProperty('camHUD.alpha', 0.00001)
end

function onBeatHit()
   if curBeat == 15 then
       setProperty('camHUD.alpha', 1)
   end
end
