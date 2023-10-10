package;
import flixel.*;
import flixel.addons.transition.FlxTransitionSprite.GraphicTransTileDiamond;
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.transition.TransitionData;
import Shaders.PulseEffect;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.math.FlxPoint;
import lime.app.Application;

class WarningState extends MusicBeatState
{
	var bg:FlxSprite = new FlxSprite();

	public var curbg:FlxSprite;

	public function new() 
	{
		super();
	}
	override function create() 
	{
		super.create();
		
		bg.loadGraphic(Paths.image("warningBG", "shared"));
		var testshader:Shaders.GlitchEffect = new Shaders.GlitchEffect();
		testshader.waveAmplitude = 0.1;
		testshader.waveFrequency = 5;
		testshader.waveSpeed = 2;
		curbg = bg;
		bg.shader = testshader.shader;
		add(bg);

		var txt:FlxText = new FlxText(0, 0, FlxG.width, "Hello there, \n thanks for playing ZCS V1! This mod contains Eyesores, wavy bgs and flashing lights. \n If your too sensitive, i suggest you to turn off on options. \n If you notice any bug issues, you can contact on our discord server. \n Thank you for reading and have fun!", 32);
		txt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		txt.borderSize = 2.5;
		txt.screenCenter();
		add(txt);
	}
	
	override function update(elapsed:Float) {
		if (curbg != null)
			{
				if (curbg.active)
				{
					var shad = cast(curbg.shader, Shaders.GlitchShader);
					shad.uTime.value[0] += elapsed;
				}
			}
		super.update(elapsed);
		
		if (controls.ACCEPT){
			FlxG.sound.play(Paths.sound('scrollMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
		if (controls.BACK)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new TitleState());
		}
	}
}
