package;

import Conductor;
import flixel.FlxG;
import flixel.FlxState;
import flixel.sound.FlxSound;
import flixel.util.FlxColor;
class PlayState extends FlxState
{
	var songTest:FlxSound;
	var lastBeat:Float = 1;
	var curBeat:Int = 1;
	override public function create()
	{
		trace(curBeat);
		Conductor.bpm = 90;
		Conductor.crotchet = 60 / Conductor.bpm *1000;

		songTest = new FlxSound();
		songTest.loadEmbedded("assets/music/testSong90.ogg", false);
		songTest.play();
		add(songTest);

		FlxG.camera.flash(FlxColor.WHITE, 0.5);
		super.create();
	}

	private function beatHit() {
		if (Conductor.songPosition > lastBeat + Conductor.crotchet) {
			lastBeat += Conductor.crotchet;
			curBeat += 1;
			// trace(curBeat);

			if ((curBeat - 1) %  4 == 0) {
				trace('4 Beats');
				FlxG.camera.flash(FlxColor.WHITE, 0.5);
			}
			// FlxG.camera.flash(FlxColor.WHITE, 0.1);
		}
	}

	override public function update(elapsed:Float)
	{
		Conductor.songPosition = songTest.time;
		beatHit();
		// trace(Conductor.songPosition);

		
		super.update(elapsed);
	}
}
