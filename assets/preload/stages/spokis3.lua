function onCreate()
	-- background shit
	makeLuaSprite('cielo', 'poto69/cielo', -200, -200);
        setScrollFactor('cielo', 0.75, 0.75);
	addLuaSprite('cielo', false);

	makeLuaSprite('cerca', 'poto69/cerca', -100, -100);
        setScrollFactor('cerca', 0.9, 0.9);
	addLuaSprite('cerca', false);

	makeLuaSprite('suelo', 'poto69/suelo', 0, 0);
	addLuaSprite('suelo', false);

	makeLuaSprite('casa', 'poto69/casas', 0, 200);
        setScrollFactor('casa', 0.95, 0.95);
	addLuaSprite('casa', false);

	makeLuaSprite('overlay', 'poto69/webadaAmpofix', 0, 0);
	addLuaSprite('overlay', false);
        setObjectCamera('overlay', 'hud')

	makeAnimatedLuaSprite('vargy', 'poto69/vargy', 1050, 850);
	addAnimationByPrefix('vargy', 'idle', 'idle', 24, true);
        scaleObject('vargy', 0.65, 0.65);
	addLuaSprite('vargy', false);

	makeAnimatedLuaSprite('money', 'poto69/losMonetizables', 450, 675);
	addAnimationByPrefix('money', 'idle', 'fantasma con mona china', 24, true);
        scaleObject('money', 0.9, 0.9);
	addLuaSprite('money', false);

	makeAnimatedLuaSprite('kloudz', 'poto69/kloudz_bg', 2000, 875);
	addAnimationByPrefix('kloudz', 'idle', 'idle instance ', 24, false);
        scaleObject('kloudz', 0.8, 0.8);
	addLuaSprite('kloudz', false);

	makeLuaSprite('textojiji', 'poto69/textojiji', 0, 0);
        setObjectCamera('textojiji', 'other');
        setScrollFactor('textojiji', 0.1, 0.1)
        setProperty('textojiji.alpha', 0)
	addLuaSprite('textojiji', true);
end

function onBeatHit()
	if curBeat % 1 == 0 then
		objectPlayAnimation('vargy', 'idle', true);
                objectPlayAnimation('kloudz', 'idle', true);
		objectPlayAnimation('money', 'idle', true);
	end
end

function onCountdownTick(counter)
	if counter % 1 == 0 then
		objectPlayAnimation('vargy', 'idle', true);
                objectPlayAnimation('kloudz', 'idle', true);
		objectPlayAnimation('money', 'idle', true);
	end
end