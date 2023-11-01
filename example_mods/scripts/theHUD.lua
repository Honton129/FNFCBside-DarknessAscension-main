--BEFORE ENTER HERE I JUST WANNA SAY THAT THIS IS A LUA THAT MIXES OTHER LUAS FOR SAVE LOADING TIMES!!

--[CREDITS DOWN HERE! ! !]--

--Mixed Lua by Honton129
--The Muxi "Overlay" / Filter Lua made by Honton129 with the assets of Muxi
--Song Credits Text Lua Originaly made by omotashi, legole0, Piggyfriend1792 and DEAD SKULLXX on GameBanana
--Particles Lua Originaly made by IDK
--Boopy Icons! (Dave and Bambi Icon Animation) Lua Originaly made by Abra David On GameBanana And Modified by Honton129
--Vcr Shader Was took from a shader pack made by deleted_name687 on GameBanana
--Chromatic Abberation Shader Lua was made by VargyBoy and the frag file was took from Vs. Impostor V4 and Modified by Honton129
--Cool Health Bar Lua Was Originaly made by RALTYRO for the Mic'd Up HUD Lua

--[Song Credits Configuration]--
local songdata = {
--yes i used the pico week bc i didnt wanna interfere with the old version
    ['Tutorial'] = {
    'Tutorial', -- Song Name [1]
    'Rozebud', -- Composer [2]
    '4', --  Length for onscreen [3]
    'Check The Credits!', -- Artist [4]
    'Cval', -- Charter [5]
    },

    ['Fight-Or-Flight'] = {
        'Fight-Or-Flight',
        'FurretGiovana',
        '4',
        'Check The Credits!',
        'SMG2',
    },

    ['Showdown'] = {
        'Showdown',
        'FurretGiovana',
        '4',
        'Check The Credits!',
        'Honton129',
    },

    ['Fallen-Soldier'] = {
        'Fallen Soldier',
        'FurretGiovana',
        '4',
        'Check The Credits!',
        'SMG2 & Benkamyn',
    },

    ['corrupt-spookeez'] = {
        'Corrupt Spookeez',
        'FurretGiovana',
        '4',
        'Check The Credits!',
        'SMG2 & Benkamyn',
    },

    ['corrupt-south'] = {
        'Corrupt South',
        'FurretGiovana',
        '4',
        'Check The Credits!',
        'SMG2 & Honton129',
    },

    ['Chiller'] = {
        'Chiller',
        'Strike, Benkamyn & FurretGiovana',
        '4',
        'Check The Credits!',
        'Strike',
    },

    ['Matricidal'] = {
        'Matricidal',
        'FurretGiovana',
        '4',
        'Check The Credits!',
        'SMG2',
    },

    ['Bullet-Past'] = {
        'Bullet Past',
        'Strike',
        '4',
        'Check The Credits!',
        'SMG2',
    },

    ['Test'] = {
        'Test',
        'Kawaii Sprite',
        '4',
        'Check The Credits!',
        'NinjaMuffin99',
    },

    ['fading-to-black'] = {
        'Fading To Black',
        'Strike',
        '4',
        'Check The Credits!',
        'Strike',
    },

    ['chiller-remix'] = {
        'Chiller Remix',
        'Poga',
        '4',
        'Check The Credits!',
        'SMG2',
    },

    ['sal-de-mi-casa'] = {
        'Sal de mi Casa',
        'Poga',
        '4',
        'Check The Credits!',
        'SMG2',
    },

    ['Remix-10-DS'] = {
        'Remix 10',
        'Masami Yone',
        '4',
        'Check The Credits!',
        'Honton129',
    },

    ['Death-Toll'] = {
        'Death Toll',
        'punkett',
        '4',
        'Check The Credits!',
        'Unknown',
    },
    
-- Replace this data with your songs and the song composer. 
-- The song name in the [] MUST be the same song in the JSON file
-- The Next two are just string values, have fun :3
}

--[Shaders Stuff]--
local shaderName = "vcr with no glitch"
local shaderName2 = "chromabber"

--[Song Credits Lua Shits]--
local offsetX = 10
local offsetY = 500
local objWidth = 500

function ifExists(table, valuecheck) -- This stupid function stops your game from throwing up errors when you play a main week song thats not in the Song Data Folder
    if table[valuecheck] then
        return true
    else
        return false
    end
end

function onCreate()
      --[Shaders Setup]--
      shaderCoordFix() -- initialize a fix for textureCoord when resizing game window

      makeLuaSprite(shaderName)
      makeLuaSprite(shaderName2)

      makeLuaSprite("chromAmountObject")

      runHaxeCode([[
          var shaderName = "]] .. shaderName .. [[";
	    var shaderName2 = "]] .. shaderName2 .. [[";
        
          game.initLuaShader(shaderName);
          game.initLuaShader(shaderName2);
        
          var shader0 = game.createRuntimeShader(shaderName);
	    var shader1 = game.createRuntimeShader(shaderName2);

          game.camGame.setFilters([new ShaderFilter(shader0), new ShaderFilter(shader1)]);
          game.getLuaObject(shaderName).shader = shader0;
          game.getLuaObject(shaderName2).shader = shader1;
       return;
    ]])

      --Song Credits Text Assets
	makeLuaSprite('JukeBoxTag', 'empty', -305-IntroTagWidth, 15)
	makeGraphic('JukeBoxTag', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	makeLuaSprite('JukeBox', 'empty', -305-IntroTagWidth, 15)
	makeGraphic('JukeBox', 300, 100, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	makeLuaText('JukeBoxText', 'Now Playing:', 400, -305-IntroTagWidth, 30)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	makeLuaText('JukeBoxSubText', songName, 400, -305-IntroTagWidth, 60)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')

      --[Cool Health Bar Prechache]--
      precacheImage("enginestuff/coolhealthborder")

	--[The Muxi "Overlay" / Filter]--
	makeLuaSprite('filter', 'overlay', 0, 0);
	setScrollFactor('filter', 1.0, 1.0);
	setBlendMode('filter', 'add');
	setProperty('filter.alpha', tonumber(0.13))
      setObjectCamera('filter', 'camHUD')
	addLuaSprite('filter', true);
end

--[Shader Functions]
function onUpdate(elapsed)
    setShaderFloat(shaderName, "iTime", os.clock())
    setShaderFloat(shaderName2, "amount", 0.3)
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
            return;
        ]])
        if (temp) then temp() end
    end
end

--[Icon Boopy!!]--
local turnvalue = 20
function onBeatHit()
    turnvalue = 20
if curBeat % 2 == 0 then
    turnvalue = -20
end
    setProperty('iconP2.angle',-turnvalue)
    setProperty('iconP1.angle',turnvalue)

    doTweenAngle('iconTween1','iconP1',0,crochet/1000,'circOut')
    doTweenAngle('iconTween2','iconP2',0,crochet/1000,'circOut')
end

function onCreatePost()
    --[Song Credits Lua Assets]--
    --This creates all the placeholder shit B) ((THIS PART ON THE ORIGINAL SCRIPT WAS MADE BY PIGGY))
    luaDebugMode = true

    makeLuaSprite('creditBox', 'empty', 0 - objWidth, offsetY)
    makeGraphic('creditBox', objWidth, 150, '000000')
    setObjectCamera('creditBox', 'other')
    setProperty("creditBox.alpha", 0.7)
    addLuaSprite('creditBox', true)

    makeLuaText('creditTitle', 'PlaceholderTitle', objWidth, offsetX - objWidth, offsetY+0)
    setTextSize('creditTitle', 45)
    setTextAlignment('creditTitle', 'left')
    setObjectCamera('creditTitle', 'other')
    addLuaText("creditTitle",true)

    makeLuaText('creditComposer', 'PlaceholderComposer', objWidth, offsetX - objWidth, offsetY+45)
    setTextSize('creditComposer', 30)
    setTextAlignment('creditComposer', 'left')
    setObjectCamera('creditComposer', 'other')
    addLuaText("creditComposer",true)

    makeLuaText('creditArtist', 'PlaceholderArtist', objWidth, offsetX - objWidth, offsetY+80)
    setTextSize('creditArtist', 30)
    setTextAlignment('creditArtist', 'left')
    setObjectCamera('creditArtist', 'other')
    addLuaText("creditArtist",true)

    makeLuaText('creditCharter', 'PlaceholderCharter', objWidth, offsetX - objWidth, offsetY+115)
    setTextSize('creditCharter', 30)
    setTextAlignment('creditCharter', 'left')
    setObjectCamera('creditCharter', 'other')
    addLuaText("creditCharter",true)

    -- If you dont NOT want the art and charter credits (or a mix of two), the value used in the old version is:
    -- offsetY+25 for creditTitle
    -- offsetY+80 for the other credit (be it Composer, Charting, or Art)

    --[Icon Boopy Create Post]--
      setObjectOrder('iconP1',getObjectOrder('iconP2'))

    --[Cool Health Bar Assets]--
    loadGraphic("healthBarBG", "enginestuff/coolhealthborder")
    setProperty("healthBarBG.yAdd", -27)
    setProperty("healthBarBG.xAdd", -54)
    setObjectCamera("healthBarBG", "hud")

    setProperty('scoreTxt.visible', false) --bye bye score for now
end

--[Particles Lua]--
function onStepHit()
    Particle()
end

f = 1
function Particle()
    songPos = getSongPosition()
    currentBeat = (songPos/500)
    f = f + 1
    sus = math.random(2, 1500)
    sus2 = math.random(2, 1500)
    makeLuaSprite('part' .. f, 'particles', math.random(500, 2000), 1600)
    doTweenY(sus, 'part' .. f, -900*math.tan((currentBeat+1*0.1)*math.pi), 6)
    doTweenX(sus2, 'part' .. f, -900*math.sin((currentBeat+1*0.1)*math.pi), 6)
    scaleObject('part' .. f, 0.5, 0.5);
      
    addLuaSprite('part' .. f, true)
  
    if f >= 50 then
       f = 1
    end
end

--[Song Credits Text Function]--
function onSongStart()

 songExists = ifExists(songdata, songName) -- Checks to see if song exists

 if songExists == true then
    local curSongTable = songdata[songName]
    setTextString('creditTitle', curSongTable[1]) -- Sets the actual things
    setTextString('creditComposer', "Song: "..curSongTable[2])
    setTextString('creditCharter', "Charting: "..curSongTable[5])

    --Tweens--
    doTweenX("creditBoxTween", "creditBox", getProperty("creditBox.x") + objWidth, 1, "expoOut")
    doTweenX("creditTitleTween", "creditTitle", getProperty("creditTitle.x") + objWidth, 1, "expoOut")
    doTweenX("creditComposerTween", "creditComposer", getProperty("creditComposer.x") + objWidth, 1, "expoOut")
    doTweenX("creditCharterTween", "creditCharter", getProperty("creditCharter.x") + objWidth, 1, "expoOut")
    runTimer("creditDisplay",curSongTable[3],1)
    else
    end
end

function onTimerCompleted(timerName)

    if timerName == "creditDisplay" then
        doTweenX("creditBoxTween", "creditBox", getProperty("creditBox.x") - objWidth, 0.5, "sineIn")
        doTweenX("creditTitleTween", "creditTitle", getProperty("creditTitle.x") - objWidth, 0.5, "sineIn")
        doTweenX("creditComposerTween", "creditComposer", getProperty("creditComposer.x") - objWidth, 0.5, "sineIn")
        doTweenX("creditCharterTween", "creditCharter", getProperty("creditCharter.x") - objWidth, 0.5, "sineIn")
    end

end