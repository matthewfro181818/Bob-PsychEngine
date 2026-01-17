package states.stages;

import states.stages.objects.*;

class RonStage extends BaseStage
{
	// If you're moving your stage from PlayState to a stage file,
	// you might have to rename some variables if they're missing, for example: camZooming -> game.camZooming

	override function create()
	{
				var bg:FlxSprite = new FlxSprite(-100,10).loadGraphic(Paths.image('bob/happyRon_sky'));
				bg.updateHitbox();
				bg.scale.x = 1.2;
				bg.scale.y = 1.2;
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				
				var ground:FlxSprite = new FlxSprite(-537, -250).loadGraphic(Paths.image('bob/happyRon_ground'));
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
		// Code here
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

		if (curBeat == 2 && curSong == 'Ron')
		{
			var bruh:FlxSprite = new FlxSprite();
			bruh.loadGraphic(Paths.image('bob/longbob'));
			bruh.antialiasing = true;
			bruh.active = false;
			bruh.scrollFactor.set();
			bruh.screenCenter();
			add(bruh);
			FlxTween.tween(bruh, {alpha: 0},1, {
				ease: FlxEase.cubeInOut,
				onComplete: function(twn:FlxTween)
				{
					bruh.destroy();
				}
			});
		}
		if (songName == 'Ron')
		{
			if (curBeat == 7)
			{
				FlxTween.tween(FlxG.camera, {zoom: 1.5}, 0.4, {ease: FlxEase.expoOut,});
				dad.playAnim('cheer', true);
			}
			else if (curBeat == 119)
			{
				FlxTween.tween(FlxG.camera, {zoom: 1.5}, 0.4, {ease: FlxEase.expoOut,});
				dad.playAnim('cheer', true);
			}
			else if (curBeat == 215)
			{
				FlxG.camera.follow(dad, LOCKON, 0.04 * (30 / (cast (Lib.current.getChildAt(0), Main)).getFPS()));
				FlxTween.tween(FlxG.camera, {zoom: 1.5}, 0.4, {ease: FlxEase.expoOut,});
				dad.playAnim('cheer', true);
			}
			else
			{
				FlxG.camera.follow(camFollow, LOCKON, 0.04 * (30 / (cast (Lib.current.getChildAt(0), Main)).getFPS()));
			}
		}
		if (curSong.toLowerCase() == 'little-man' && curBeat == 1397 )
		{
			dad = 'pizza';
		}
		if (curSong.toLowerCase() == 'little-man' && curBeat == 1497 )
		{
			dad = 'little-man';
		}
		if (curSong.toLowerCase() == 'little-man' && curBeat == 1844 )
		{
			dad = 'tankman';
			dad.x -= 124;
			dad.y -= 644;
			dad.y += 268;
			dad.x -= 27;
		}
	}
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
