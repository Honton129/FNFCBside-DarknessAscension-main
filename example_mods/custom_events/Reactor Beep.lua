
function onEvent(n,v1,v2)
	if n == "Reactor Beep" then
		cameraFlash('camGame', 'b30000',0.4 , true)
		triggerEvent('Add Camera Zoom','0.015','0.03')
	end
end

