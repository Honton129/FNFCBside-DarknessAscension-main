package states.stages;

class SpookyD3 extends BaseStage
{
	var spookySky:BGSprite;
	var spookyFence:BGSprite;
	var spookyFloor:BGSprite;
	var spookyHouse:BGSprite;

	var vergaChica:BGSprite;
	var losMonetizables:BGSprite;
	var kloudz:BGSprite;

	var textoCuliao:BGSprite;
	var overlayAmpofix:BGSprite;

	override function create()
	{
		spookySky = new BGSprite('sky69', -200, -200, 0.55, 0.55);
		add(spookySky);

		spookyFence = new BGSprite('cercaPeruana', -100, -100, 0.8, 0.8);
		add(spookyFence);

		spookyFloor = new BGSprite('suelo');
		add(spookyFloor);

		spookyHouse = new BGSprite('laCasaDelSemenYPorno', 0, 200, 0.95, 0.95);
		add(spookyHouse);

		vergaChica = new BGSprite('vargi', 1050, 850, 1, 1, ['idle']);
		vergaChica.setGraphicSize(0.65, 0.65);
		add(vergaChica);

		losMonetizables = new BGSprite('dineroDineroAmoElDinero', 450, 675, 1, 1, ['fantasma con mona china']);
		losMonetizables.setGraphicSize(0.9, 0.9);
		add(losMonetizables);

		kloudz = new BGSprite('kloudzBG', 2000, 875, 1, 1, ['idle']);
		kloudz.setGraphicSize(0.8, 0.8);
		add(kloudz);

		textoCuliao = new BGSprite('textoJiji');
		textoCuliao.cameras = [camOverlay];
		textoCuliao.alpha = 0.00001;
		add(textoCuliao);

		overlayAmpofix = new BGSprite('webadaAmpofix');
		overlayAmpofix.cameras = [camOverlay];
		add(overlayAmpofix);
	}
	override function createPost()
	{
		if (PlayState.SONG.song.toLowerCase() == 'chiller')
		{
			camGame.alpha = 0.00001;
			camHUD.alpha = 0.00001;

			game.iconP1.alpha = 0.00001;
			game.iconP2.alpha = 0.00001;
			game.healthBar.alpha = 0.00001;
			game.scoreTxt.alpha = 0.00001;

			spookySky.alpha = 0.00001;
			spookyFence.alpha = 0.00001;
			spookyFloor.alpha = 0.00001;
			spookyHouse.alpha = 0.00001;

			vergaChica.alpha = 0.00001;
			losMonetizables.alpha = 0.00001;
			kloudz.alpha = 0.00001;

			dad.alpha = 0.00001;
			boyfriend.alpha = 0.00001;
			gf.alpha = 0.00001;
		}
	}

	override function countdownTick(count:Countdown, num:Int) everyoneDance();
	override function beatHit()
	{
		everyoneDance();

		if (PlayState.SONG.song.toLowerCase() == 'chiller')
		{
			if (curBeat == 8)
			{
				FlxTween.tween(camGame, {alpha: 1}, 2);
			}

			if (curBeat == 32)
			{
				dad.alpha = 1;
				camHUD.alpha = 1;
			}

			if (curBeat == 49)
			{
				boyfriend.alpha = 1;
				gf.alpha = 1;
			}

			if (curBeat == 64)
			{
				game.iconP1.alpha = 1;
				game.iconP2.alpha = 1;
				game.healthBar.alpha = 1;
				game.scoreTxt.alpha = 1;

				spookySky.alpha = 1;
				spookyFence.alpha = 1;
				spookyFloor.alpha = 1;
				spookyHouse.alpha = 1;
	
				vergaChica.alpha = 1;
				losMonetizables.alpha = 1;
				kloudz.alpha = 1;
			}
		}
	}

	function everyoneDance()
	{
		if (!ClientPrefs.data.lowQuality && curBeat % game.gfSpeed == 0)
		{
			vergaChica.dance(true);
			losMonetizables.dance(true);
			kloudz.dance(true);
		}
	}
}