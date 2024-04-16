package states.stages;

class Highway extends BaseStage
{
	var city:BGSprite;
	var thePole:BGSprite;
	var street:BGSprite;
	var skyBG:BGSprite;
	var sign:BGSprite;
	var limo:BGSprite;

	override function create()
	{
		skyBG = new BGSprite('street/sky', -300, -500, 0.1, 0.1);
		skyBG.setGraphicSize(Std.int(skyBG.width * 1.2));
		skyBG.updateHitbox();
		add(skyBG);

		city = new BGSprite('street/city', -500, -100, 0.4, 0.4);
		add(city);

		sign = new BGSprite('street/sign', -100, -100, 0.6, 0.6);
		add(sign);

		thePole = new BGSprite('street/pole', 0, -50, 0.8, 0.8);
		add(thePole);

		street = new BGSprite('street/street', -450, 800, 0.95, 0.95);
		street.setGraphicSize(Std.int(street.width * 1.2));
		street.updateHitbox();
		add(street);

		limo = new BGSprite('street/limoStand', -120, -285, 1, 1);
		add(limo);
	}
}