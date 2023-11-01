function onCreate()
	-- le overlay test
	makeLuaSprite('filter', 'overlay', 0, 0);
	setScrollFactor('filter', 1.0, 1.0);
	setBlendMode('filter', 'add');
	setProperty('filter.alpha', tonumber(0.13))
        setObjectCamera('filter', 'camHUD')

	addLuaSprite('filter', true);
end