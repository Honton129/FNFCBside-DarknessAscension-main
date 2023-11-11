function onCreate()
    --[The Muxi "Overlay" / Filter]--
    makeLuaSprite('filter', 'overlay', 0, 0);
    setScrollFactor('filter', 1.0, 1.0);
    setBlendMode('filter', 'add');
    setProperty('filter.alpha', 0.15)
    setObjectCamera('filter', 'camHUD')
    addLuaSprite('filter', true);
end