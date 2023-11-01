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
end