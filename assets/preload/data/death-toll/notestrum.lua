--[[
 BASE SCRIPT CREDITS:
		- ShadowMario: made a multi-character script (from which I took animation offset)
		- Superpowers04: Helped with optimizing some code
		- MorenoTheCappuccinoChugger: Helped with note syncing (previous version on my youtube channel was off-sync)
		- BombasticTom (that's me!): Did most of the code.

	GONG MECHANIC CREDITS:
		- Laztrix
--]]

animationsList = {}

local defaultstrumy
local noteoffset

local isStrummin = true
local defaultNotePos = {};
function onSongStart()
    for i = 0,7 do
        x = getPropertyFromGroup('strumLineNotes', i, 'x')

        y = getPropertyFromGroup('strumLineNotes', i, 'y')

        table.insert(defaultNotePos, {x, y})
        doTweenY('theEpicTween', 'strum'..directions, notey, 3, 'circInOut')
    end
end

function makeAnimationList()
	animationsList[0] = 'keyArrow' -- idle
	animationsList[1] = 'keyConfirm' -- key confirmed
	animationsList[2] = 'keyPressed' -- key miss
end

offsets = {};

function makeOffsets(object)
	offsets[0] = {x=20, y=500}
	offsets[1] = {x=61, y=59}
	offsets[2] = {x=34, y=34}
end

function onCreatePost()

    notey = 570
	noteoffset = -570
	if not downscroll then
		noteoffset = 50
		notey = 50

	end
    if not middlescroll then
		curnotex = 445 --og is 225
	else
		curnotex = 440
	end
	directions = "space"
	makeAnimationList()
	makeOffsets()

		makeAnimatedLuaSprite('strum'..directions, 'stageTollWTF/Bronzong_Gong_mechanic', curnotex, 2000)
	
		addAnimationByPrefix('strum'..directions, 'keyConfirm', 'spacebar confirm', 24, false)
		addAnimationByPrefix('strum'..directions, 'keyPressed', 'spacebar press', 24, false)
		addAnimationByIndicesLoop('strum'..directions, 'keyArrow', 'spacebar',"0,1,2,3,4", 24)

		setObjectCamera('strum'..directions, 'camHUD', true)
	        setObjectOrder('rating', 10)
                --screenCenter('strum'..directions, 'X')
		scaleObject('strumspace',0.75,0.75)
		
		addLuaSprite('strum'..directions, true)

		playAnimation('strum'..directions, 0, true)	
end

function playAnimation(character, animId, forced) -- thank you shadowmario :evil:
	-- 0 = keyArrow
	-- 1 = keyConfirm
	-- 2 = keyPressed
	animName = animationsList[animId]

	playAnim(character, animName, forced); -- this part is easily broke if you use objectPlayAnim (I have no idea why its like this)	
end
local coverup = true
local allowedtouch = false
local bfcover = false
local gfcover = false

fr = 0
function onUpdate(elapsed)
fr = fr + elapsed
gurg = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/240))
gurg1 = ((getPropertyFromClass('Conductor', 'songPosition') / 1000)*(bpm/350))
songPos = getSongPosition()
local currentBeat = (songPos/4000)*(curBpm/70)
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
		if not botPlay then
		playAnimation('strum'..directions, 2, false)
		end
	end
end
local iscoverup = false
function onUpdatePost()
	if getProperty("cup.animation.curAnim.name") == 'cupBell' then
		if getProperty("cup.animation.curAnim.finished") then
			playAnim('cup','cupIdle',true)
		end
	end
	if getProperty("strumspace.animation.curAnim.name") == 'keyPressed' then
		if getProperty("strumspace.animation.curAnim.finished") then
			playAnimation('strum'..directions, 0, true)
		end
	end
	if getProperty("strumspace.animation.curAnim.name") == 'keyConfirm' then
		if getProperty("strumspace.animation.curAnim.finished") then
			playAnimation('strum'..directions, 0, true)
		end
	end
	
	for i=0, getProperty('notes.length')-1 do
		if getPropertyFromGroup('notes', i, 'noteType') == 'bell' then
			if not isStrummin then
				return
			end

			noteX = getPropertyFromGroup('notes', i, 'x');
			noteY = getPropertyFromGroup('notes', i, 'y');
			if not botPlay then
			    if getPropertyFromGroup('notes',i,'isSustainNote') then	
			        setPropertyFromGroup('notes', i, 'ignoreNote', true)
			    end
		    else
				if getPropertyFromGroup('notes',i,'isSustainNote') then	
					setPropertyFromGroup('notes', i, 'offset.x', -70)	
			    end
			    setPropertyFromGroup('notes', i, 'ignoreNote', true)
			end

			hitbox = 50;
			
			noteData = getPropertyFromGroup('notes', i, 'noteData');
			
			strumY = getProperty('strum'..directions..'.y')	

			noteX = getProperty('strum'..directions..'.x')
			if downscroll then
				noteY = (noteY - strumY - noteoffset - offsets[0].x)
			else
				noteY = (noteY + noteoffset + offsets[0].x)
			end

		
    
			setPropertyFromGroup('notes', i, 'x', noteX+15)
			setPropertyFromGroup('notes', i, 'y', noteY)
            if math.abs(noteY - strumY) <= hitbox then
				if botPlay then
					playAnimation('strum'..directions, 1, true)
					removeFromGroup('notes', i)
				end
				triggerEvent('Screen Shake','0.2,0.002','')
				playAnim('cup','cupBell',true)
				if keyboardPressed("SPACE") and not botPlay then
					playAnimation('strum'..directions, 1, true)
					removeFromGroup('notes', i)
				else

				end

			end
			
		
			
		end
	end

end

function noteMiss(id,noteData,noteType,isSustainNote)
	if noteType == 'bell' then
		if not isSustainNote then
		setProperty('health',getProperty('health')-0.4)
		end
	end
end