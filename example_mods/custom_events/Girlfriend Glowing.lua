-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'Girlfriend Glowing' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
			setProperty('gf.alpha', 0.1);
		else
			doTweenAlpha('gfFadeEventTween', 'gf', 1, 1, 'linear');
		end
		--debugPrint('Event triggered: ', name, duration, targetAlpha);
	end
end