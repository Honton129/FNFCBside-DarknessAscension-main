local camTwistIntensity = 0
local camTwistIntensity2 = 0
function onEvent(n,v1,v2)
	if n == "Camera Twist" then
		camTwistIntensity = tonumber(v1)
		camTwistIntensity2 = tonumber(v2)
	end
end

function onBeatHit()

	if curBeat % 2 == 0 then
		twistShit = 1
	else
		twistShit = -1
	end
	setProperty('camHUD.angle',twistShit * camTwistIntensity2)
	setProperty('camGame.angle',twistShit * camTwistIntensity2)

	doTweenX('camHBopX','camHUD',-twistShit * camTwistIntensity, stepCrochet * 0.001,'linear')
	doTweenX('camGBopX','camGame',-twistShit * camTwistIntensity, stepCrochet * 0.001,'linear')
	doTweenAngle('camHBopAngle','camHUD',twistShit * camTwistIntensity, stepCrochet * 0.002,'circOut')
	doTweenAngle('camGBopAngle','camGame',twistShit * camTwistIntensity, stepCrochet * 0.002,'circOut')

	if curBeat % 4 == 0 then
		doTweenY('camHBopY','camHUD',-6 * camTwistIntensity2 ,stepCrochet * 0.002,'circOut')
		doTweenY('camGBopY','camGame.scroll',12,stepCrochet * 0.002,'sineIn')
	end
	if curBeat % 4 == 2 then
		doTweenY('camHBopY','camHUD',0,stepCrochet * 0.002,'sineIn')
		doTweenY('camGBopY','camGame.scroll',0,stepCrochet * 0.002,'sineIn')
	end
end