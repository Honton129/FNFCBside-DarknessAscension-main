
function onEvent(n, v1, v2)
	if n == 'Camera Twist' then
		camTwist = true

		local actualV1 = v1
		local actualV2 = v2

		if v1 == "" then
			actualV1 = 0
		end

		if v2 == "" then
			actualV2 = 0
		end

		local _intensity = tonumber(actualV1)
		local _intensity2 = tonumber(actualV2)

		camTwistIntensity = _intensity
		camTwistIntensity2 = _intensity2

		if (_intensity2 == 0) then
			camTwist = false;
			doTweenAngle('hudTwist', 'camHUD', 0, 1, "sineinout")
			doTweenAngle('gameTwist', 'camHUD', 0, 1, "sineinout")
		end

		gameScrollY = getProperty('camGame.scroll.y')
	end
end

camTwist = false

camTwistIntensity = 0
camTwistIntensity2 = 3

camTwistSpeed = 4
twistAmount = 1
gameScrollY = 0

function onStepHit()
	if camTwist == true then
		if curStep % camTwistSpeed == 0 then
			doTweenY('hudTwist2', 'camHUD', -6 * camTwistIntensity2, stepCrochet * 0.002, "circout")
			doTweenY('gameScrollTwist', 'camGame.scroll', gameScrollY + 12, stepCrochet * 0.002, "sinein")
		elseif curStep % camTwistSpeed == camTwistSpeed/2 then
			doTweenY('hudTwist2', 'camHUD', 0, stepCrochet * 0.002, "sinein")
			doTweenY('gameScrollTwist', 'camGame.scroll', gameScrollY, stepCrochet * 0.002, "sinein")
		end
	end
end

function onBeatHit()
	if camTwist == true then
	
		local twistShit = 1

		if (curBeat % 2 == 0) then
			twistShit = twistAmount;
		else
			twistShit = -twistAmount;
		end
		
		local cams = {'camGame', 'camHUD'}

		for i = 1,#cams do
			setProperty(cams[i]..'.angle', twistShit * camTwistIntensity2)
			doTweenAngle(cams[i]..'angletwist', cams[i], twistShit * camTwistIntensity, stepCrochet * 0.001, 'circout')
			doTweenX(cams[i]..'twist', cams[i], -twistShit * camTwistIntensity, stepCrochet * 0.001, 'linear')
		end
	end
end