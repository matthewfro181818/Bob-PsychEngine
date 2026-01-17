package states.stages;

import states.stages.objects.*;
import openfl.Lib;
import objects.Note;

class OnslaughtStage extends BaseStage
{
	// If you're moving your stage from PlayState to a stage file,
	// you might have to rename some variables if they're missing, for example: camZooming -> game.camZooming

	private var strumLineNotes:FlxTypedGroup<FlxSprite>;
	private var playerStrums:FlxTypedGroup<FlxSprite>;

	private var curSong:String = "";

    var note:Note;

	var SpinAmount:Float = 0;
	var IsNoteSpinning:Bool = false;
	var windowX:Float = Lib.application.window.x;
	var windowY:Float = Lib.application.window.y;

	override function create()
	{
				var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('bob/scary_sky'));
				bg.updateHitbox();
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				
				var ground:FlxSprite = new FlxSprite(-537, -158).loadGraphic(Paths.image('bob/GlitchedGround'));
				ground.updateHitbox();
				ground.active = false;
				ground.antialiasing = true;
				add(ground);
	}
	
	override function createPost()
	{
		// Use this function to layer things above characters!
	}

	override function update(elapsed:Float)
	{
		if (states.PlayState.SONG.song.toLowerCase() == 'onslaught' && IsNoteSpinning){
			var thisX:Float =  Math.sin(SpinAmount * (SpinAmount / 2)) * 100;
			var thisY:Float =  Math.sin(SpinAmount * (SpinAmount)) * 100;
			var yVal = Std.int(windowY + thisY);
			var xVal = Std.int(windowX + thisX);
			if (!FlxG.save.data.shakingscreen)
				Lib.application.window.move(xVal,yVal);
			for (str in playerStrums){
				str.angle = str.angle + SpinAmount;
				SpinAmount = SpinAmount + 0.0003;
			}
		}
}

	override function destroy()
	{
		// Code here
	}

	
	override function countdownTick(count:Countdown, num:Int)
	{
		switch(count)
		{
			case THREE: //num 0
			case TWO: //num 1
			case ONE: //num 2
			case GO: //num 3
			case START: //num 4
		}
	}

	override function startSong()
	{
		// Code here
	}

	// Steps, Beats and Sections:
	//    curStep, curDecStep
	//    curBeat, curDecBeat
	//    curSection
	override function stepHit()
	{
		// Code here
	}
	override function beatHit()
	{

		if (curSong.toLowerCase() == 'onslaught' && curBeat >= 0 && curBeat < 64 && camZooming && FlxG.camera.zoom < 1.35)
		{
			FlxG.camera.zoom += 0.015;
			camHUD.zoom += 0.03;
		}
		else if (curSong.toLowerCase() == 'onslaught' && curBeat >= 96 && curBeat < 224 && camZooming && FlxG.camera.zoom < 1.35)
		{
			FlxG.camera.zoom += 0.015;
			camHUD.zoom += 0.03;
		}
		else if (curSong.toLowerCase() == 'onslaught' && curBeat >= 240 && curBeat < 352 && camZooming && FlxG.camera.zoom < 1.35)
		{
			FlxG.camera.zoom += 0.015;
			camHUD.zoom += 0.03;
		}
		if (curSong.toLowerCase() == 'onslaught' && curBeat == 96 )
		{
			InvisibleNotes();
		}
		if (curSong.toLowerCase() == 'onslaught' && curBeat == 128 )
		{
			windowX = Lib.application.window.x;
			windowY = Lib.application.window.y;
			IsNoteSpinning = true;
			VisibleNotes();
		}
		if (curSong.toLowerCase() == 'onslaught' && curBeat == 240 )
		{
			InvisibleNotes();
		}
		if (curSong.toLowerCase() == 'onslaught' && curBeat == 352 )
		{
			IsNoteSpinning = false;
			if (!FlxG.save.data.shakingscreen)
				WindowGoBack();
			VisibleNotes();
		}	}
	override function sectionHit()
	{
		// Code here
	}

	// Substates for pausing/resuming tweens and timers
	override function closeSubState()
	{
		if(paused)
		{
			//timer.active = true;
			//tween.active = true;
		}
	}

	function InvisibleNotes()
	{
		FlxG.sound.play(Paths.sound('Meow'));
		for (note in playerStrums)
			{
				note.visible = false;
			}
		for (note in strumLineNotes)
			{
				note.visible = false;
			}
	}
	function VisibleNotes()
	{
		FlxG.sound.play(Paths.sound('woeM'));
		for (note in playerStrums)
			{
				note.visible = true;
			}
		for (note in strumLineNotes)
			{
				note.visible = true;
			}
	}

	override function openSubState(SubState:flixel.FlxSubState)
	{
		if(paused)
		{
			//timer.active = false;
			//tween.active = false;
		}
	}

	// For events
	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float)
	{
		switch(eventName)
		{
			case "My Event":
		}
	}
	override function eventPushed(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events that doesn't need different assets based on its values
		switch(event.event)
		{
			case "My Event":
				//precacheImage('myImage') //preloads images/myImage.png
				//precacheSound('mySound') //preloads sounds/mySound.ogg
				//precacheMusic('myMusic') //preloads music/myMusic.ogg
		}
	}
	override function eventPushedUnique(event:objects.Note.EventNote)
	{
		// used for preloading assets used on events where its values affect what assets should be preloaded
		switch(event.event)
		{
			case "My Event":
				switch(event.value1)
				{
					// If value 1 is "blah blah", it will preload these assets:
					case 'blah blah':
						//precacheImage('myImageOne') //preloads images/myImageOne.png
						//precacheSound('mySoundOne') //preloads sounds/mySoundOne.ogg
						//precacheMusic('myMusicOne') //preloads music/myMusicOne.ogg

					// If value 1 is "coolswag", it will preload these assets:
					case 'coolswag':
						//precacheImage('myImageTwo') //preloads images/myImageTwo.png
						//precacheSound('mySoundTwo') //preloads sounds/mySoundTwo.ogg
						//precacheMusic('myMusicTwo') //preloads music/myMusicTwo.ogg
					
					// If value 1 is not "blah blah" or "coolswag", it will preload these assets:
					default:
						//precacheImage('myImageThree') //preloads images/myImageThree.png
						//precacheSound('mySoundThree') //preloads sounds/mySoundThree.ogg
						//precacheMusic('myMusicThree') //preloads music/myMusicThree.ogg
				}
		}
	}

	// Note Hit/Miss
	override function goodNoteHit(note:Note)
	{
		// Code here
	}

	override function opponentNoteHit(note:Note)
	{
		// Code here
	}

	override function noteMiss(note:Note)
	{
		// Code here
	}

	override function noteMissPress(direction:Int)
	{
		// Code here
	}
}
