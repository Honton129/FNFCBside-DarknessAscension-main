function onStartCountdown()
	setProperty('boyfriend.color', getColorFromHex('000000'))
	setProperty('dad.color', getColorFromHex('000000'))
	setProperty('gf.color', getColorFromHex('000000'))
         setProperty('iconP1.visible', false)
         setProperty('iconP2.visible', false)
         setProperty('healthBar.visible', false)
         setProperty('healthBarBG.visible', false)
         setProperty('scoreTxt.visible', false)
		 setProperty('vargy.visible', false)
		 setProperty('cielo.visible', false)
		 setProperty('bg.visible', false)
		 setProperty('casa.visible', false)
		 setProperty('camHUD.visible', false)

end

function onCreate()
    makeLuaSprite('bgspec', '', -600, -600);
	makeGraphic('bgspec', 10, 10, 'FFFFFF')
	scaleObject('bgspec', 384, 384)
	addLuaSprite('bgspec', false)
	setScrollFactor('bgspec', 0.63, 1);

	makeLuaSprite('bgspec2', '', -600, -600);
	makeGraphic('bgspec2', 10, 10, '000000')
	scaleObject('bgspec2', 384, 384)
	addLuaSprite('bgspec2', true)
	setScrollFactor('bgspec2', 0.63, 1);
end

function onStepHit()
	if curStep == 1 then
		setProperty('dad.visible', 0)
		setProperty('boyfriend.visible', 0)
		setProperty('gf.visible', 0)
	end
	if curStep == 2 then
		doTweenAlpha('negrosfuerap','bgspec2', 0, 1, linear)
	end
	if curStep == 128 then
		setProperty('dad.visible', 1)
		setProperty('camHUD.visible', 1)
		cameraFlash('hud', 'FFFFFF', 0.7, true)
	end
	if curStep == 196 then
		setProperty('boyfriend.visible', 1)
		setProperty('gf.visible', 1)
		cameraFlash('hud', 'FFFFFF', 0.7, true)
	end
	if curStep == 240 then
		setProperty('defaultCamZoom', 1)
	end
	if curStep == 637 then
		setProperty('defaultCamZoom', 0.8)
	end

	if curStep == 768 then
		setProperty('defaultCamZoom', 0.65)
	end
	if curStep == 256 then
		setProperty('defaultCamZoom', 0.65)
		setProperty('iconP1.visible', true)
         setProperty('iconP2.visible', true)
         setProperty('healthBar.visible', true)
         setProperty('healthBarBG.visible', true)
         setProperty('scoreTxt.visible', true)
		 setProperty('vargy.visible', true)
		 setProperty('cielo.visible', true)
		 setProperty('bg.visible', true)
		 setProperty('casa.visible', true)
		 setProperty('bgspec.visible', false)
		 cameraFlash('hud', 'FFFFFF', 0.7, true)
		 setProperty('dad.color', getColorFromHex('FFFFFF'))
		 setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		 setProperty('gf.color', getColorFromHex('FFFFFF'))
	end
	if curStep == 1408 then
		 cameraFlash('hud', 'FFFFFF', 0.7, true)
		 setProperty('iconP1.visible', false)
         setProperty('iconP2.visible', false)
         setProperty('healthBar.visible', false)
         setProperty('healthBarBG.visible', false)
         setProperty('scoreTxt.visible', false)
		 setProperty('casa.visible', false)
		 setProperty('camHUD.visible', false)
                 setProperty('camGame.visible',false)
		 end
		 if curStep == 1408 then
			cameraFlash('hud', 'FFFFFF', 0.7, true)
		 end
		 if curStep == 1152 then
			cameraFlash('hud', '000000', 0.7, true)
		 end
end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('dad.curCharacter') == 'spooky3' and getProperty('health') > 0.4 then
        setProperty('health', health- 0.020);
    end

end
