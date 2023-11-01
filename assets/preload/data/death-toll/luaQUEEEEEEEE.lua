function onCreate()
   setProperty('gf.flipX', false)
   setProperty('gf.alpha', 0)
end


fr = 0
function onUpdate(elapsed)
    songPos = getSongPosition()
	local currentBeat = (songPos/4000)*(curBpm/60)
    fr = fr + elapsed
    if mustHitSection then
        setProperty('defaultCamZoom',0.85)
    else
        setProperty('defaultCamZoom',0.95)
    end
    if curBeat >= 325 and curBeat <= 9999 then
        doTweenY('contr', 'ContractBF', 490 + (math.cos((currentBeat) + 0) * 20), 1)
    end
end

function onStepHit()
        if curStep == 1280 then
           setProperty('dad.flipX', false)
        end
        if curStep == 1296 then
           setProperty('dad.flipX', true)
        end
	if curStep == 1424 then
		setProperty('gf.alpha',0.1)
		setProperty('boyfriend.alpha',0.9)
	end
	if curStep == 1472 then
		setProperty('gf.alpha',0.2)
		setProperty('boyfriend.alpha',0.8)
	end
	if curStep == 1536 then
		setProperty('boyfriend.alpha',0.7)
		setProperty('gf.alpha',0.3)
	end
	if curStep == 1556 then
		setProperty('boyfriend.alpha',0.5)
		setProperty('gf.alpha',0.2)
	end
	if curStep >= 1568 and curStep <= 1806 then

		setProperty('boyfriend.alpha', 0.9 - 0.5 * math.cos((gurg1) * math.pi))

		setProperty('gf.alpha', 1 - 0.8 * math.cos((gurg) * math.pi))

	end
end