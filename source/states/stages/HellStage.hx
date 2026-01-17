package states.stages;

import states.stages.objects.*;
import cutscenes.DialogueBox;

class HellStage extends BaseStage
{
	// If you're moving your stage from PlayState to a stage file,
	// you might have to rename some variables if they're missing, for example: camZooming -> game.camZooming

	var dialogue:Array<String> = ['blah blah blah', 'coolswag'];
	private var camHUD:FlxCamera;
	private var camGame:FlxCamera;

	private var camFollow:FlxObject;

	private static var prevCamFollow:FlxObject;

	override function create()
	{
				if (FlxG.save.data.happybob)
				{
					var bg:FlxSprite = new FlxSprite( -100).loadGraphic(Paths.image('bob/happy/hell'));
				bg.updateHitbox();
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				
				var thingidk:FlxSprite = new FlxSprite( -271).loadGraphic(Paths.image('bob/happy/middlething'));
				thingidk.updateHitbox();
				thingidk.active = false;
				thingidk.antialiasing = true;
				thingidk.scrollFactor.set(0.3, 0.3);
				add(thingidk);
				
				var dead:FlxSprite = new FlxSprite( -60, 50).loadGraphic(Paths.image('bob/happy/theydead'));
				dead.updateHitbox();
				dead.active = false;
				dead.antialiasing = true;
				dead.scrollFactor.set(0.8, 0.8);
				add(dead);

				var ground:FlxSprite = new FlxSprite(-537, -158).loadGraphic(Paths.image('bob/happy/ground'));
				ground.updateHitbox();
				ground.active = false;
				ground.antialiasing = true;
				add(ground);
				
				bobmadshake = new FlxSprite( -198, -118).loadGraphic(Paths.image('bob/happy/bobscreen'));
				bobmadshake.scrollFactor.set(0, 0);
				bobmadshake.visible = false;
				}
				else
				{
					var bg:FlxSprite = new FlxSprite( -100).loadGraphic(Paths.image('bob/hell'));
				bg.updateHitbox();
				bg.active = false;
				bg.antialiasing = true;
				bg.scrollFactor.set(0.1, 0.1);
				add(bg);
				
				var thingidk:FlxSprite = new FlxSprite( -271).loadGraphic(Paths.image('bob/middlething'));
				thingidk.updateHitbox();
				thingidk.active = false;
				thingidk.antialiasing = true;
				thingidk.scrollFactor.set(0.3, 0.3);
				add(thingidk);
				
				var dead:FlxSprite = new FlxSprite( -60, 50).loadGraphic(Paths.image('bob/theydead'));
				dead.updateHitbox();
				dead.active = false;
				dead.antialiasing = true;
				dead.scrollFactor.set(0.8, 0.8);
				add(dead);

				var ground:FlxSprite = new FlxSprite(-537, -158).loadGraphic(Paths.image('bob/ground'));
				ground.updateHitbox();
				ground.active = false;
				ground.antialiasing = true;
				add(ground);
				
				bobmadshake = new FlxSprite( -198, -118).loadGraphic(Paths.image('bob/bobscreen'));
				bobmadshake.scrollFactor.set(0, 0);
				bobmadshake.visible = false;
				}
				
				bobsound = new FlxSound().loadEmbedded(Paths.sound('bobscreen'));

		if (isStoryMode)
		{
			switch (curSong.toLowerCase())
			{
				case "winter-horrorland":
					var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), FlxColor.BLACK);
					add(blackScreen);
					blackScreen.scrollFactor.set();
					camHUD.visible = false;

					new FlxTimer().start(0.1, function(tmr:FlxTimer)
					{
						remove(blackScreen);
						FlxG.sound.play(Paths.sound('Lights_Turn_On'));
						camFollow.y = -2050;
						camFollow.x += 200;
						FlxG.camera.focusOn(camFollow.getPosition());
						FlxG.camera.zoom = 1.5;

						new FlxTimer().start(0.8, function(tmr:FlxTimer)
						{
							camHUD.visible = true;
							remove(blackScreen);
							FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom}, 2.5, {
								ease: FlxEase.quadInOut,
								onComplete: function(twn:FlxTween)
								{
									startCountdown();
								}
							});
						});
					});
				case 'senpai':
					schoolIntro(doof);
				case 'roses':
					FlxG.sound.play(Paths.sound('ANGRY'));
					schoolIntro(doof);
				case 'thorns':
					schoolIntro(doof);
				case 'sunshine':
					schoolIntro(doof);
				case 'withered':
					schoolIntro(doof);
				case 'onslaught':
					var blackScreen:FlxSprite = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 2), Std.int(FlxG.height * 2), FlxColor.BLACK);
					add(blackScreen);
					blackScreen.scrollFactor.set();
					camHUD.visible = false;

					new FlxTimer().start(0.1, function(tmr:FlxTimer)
					{
						remove(blackScreen);
						FlxG.sound.play(Paths.sound('Bob_Appear'));
						camFollow.x = dad.getMidpoint().x;
						camFollow.y = dad.getMidpoint().y;
						FlxG.camera.focusOn(camFollow.getPosition());
						FlxG.camera.zoom = 1.5;

						new FlxTimer().start(0.8, function(tmr:FlxTimer)
						{
							camHUD.visible = true;
							remove(blackScreen);
							FlxTween.tween(FlxG.camera, {zoom: defaultCamZoom}, 2.5, {
								ease: FlxEase.quadInOut,
								onComplete: function(twn:FlxTween)
								{
									var lol:DialogueBox = new DialogueBox(false, dialogue);
									lol.scrollFactor.set();
									lol.finishThing = startCountdown;
									add(lol);
									lol.cameras = [camHUD];
								}
							});
						});
					});
				case 'trouble':
					ONSLAUGHTIntro(doof);
				case 'run':
					schoolIntro(doof);
				case 'ron':
					RonIntro(doof);
				default:
					startCountdown();
			}
		}
		else
		{
			switch (curSong.toLowerCase())
			{
				default:
					startCountdown();
			}
		}
	}
	
	function schoolIntro(?dialogueBox:DialogueBox):Void
	{
		var black:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, FlxColor.BLACK);
		black.scrollFactor.set();
		add(black);

		var red:FlxSprite = new FlxSprite(-100, -100).makeGraphic(FlxG.width * 2, FlxG.height * 2, 0xFFff1b31);
		red.scrollFactor.set();

		var senpaiEvil:FlxSprite = new FlxSprite();
		senpaiEvil.frames = Paths.getSparrowAtlas('weeb/senpaiCrazy');
		senpaiEvil.animation.addByPrefix('idle', 'Senpai Pre Explosion', 24, false);
		senpaiEvil.setGraphicSize(Std.int(senpaiEvil.width * 6));
		senpaiEvil.scrollFactor.set();
		senpaiEvil.updateHitbox();
		senpaiEvil.screenCenter();
		//bob :)
			
			var bg:FlxSprite = new FlxSprite( -100);
			bg.frames = Paths.getSparrowAtlas('bob/cutscene/sky');
			bg.animation.addByPrefix('shake', 'sky shake', 24, false);
			bg.updateHitbox();
			bg.antialiasing = true;
			bg.scrollFactor.set(0.1, 0.1);
				
			var ground:FlxSprite = new FlxSprite(-537, -158);
			ground.frames = Paths.getSparrowAtlas('bob/cutscene/ground');
			ground.animation.addByPrefix('shake', 'ground shake', 24, false);
			ground.updateHitbox();
			ground.antialiasing = true;
			
			var bobCut:FlxSprite = new FlxSprite(126, 361);
			bobCut.frames = Paths.getSparrowAtlas('bob/cutscene/BobCutscene');
			bobCut.animation.addByPrefix('start', 'bob mad', 24, false);
			bobCut.updateHitbox();
			bobCut.antialiasing = true;
			
			var bfCut:FlxSprite = new FlxSprite(770, 450);
			bfCut.frames = Paths.getSparrowAtlas('BOYFRIEND');
			bfCut.animation.addByPrefix('idle', 'BF idle dance', 24, true);
			bfCut.updateHitbox();
			bfCut.antialiasing = true;
			
			var gfCut:FlxSprite = new FlxSprite(400, 130);
			gfCut.frames = Paths.getSparrowAtlas('GF_assets');
			gfCut.animation.addByIndices('idle', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
			gfCut.updateHitbox();
			gfCut.antialiasing = true;
			
			screenBudget = new FlxSprite(0, 0).loadGraphic(Paths.image('bob/cutscene/screen'));
			screenBudget.screenCenter();
			screenBudget.antialiasing = true;
			screenBudget.scrollFactor.set(0, 0);
			
				
		//not bob :(
		if (SONG.song.toLowerCase() == 'roses' || SONG.song.toLowerCase() == 'thorns' || SONG.song.toLowerCase() == 'run')
		{
			remove(black);

			if (SONG.song.toLowerCase() == 'thorns')
			{
				add(red);
			}
			if (SONG.song.toLowerCase() == 'run')
			{
				camHUD.visible = false;
				add(bg);
				add(ground);
				add(gfCut);
				add(bobCut);
				add(bfCut);
				bfCut.animation.play('idle');
				gfCut.animation.play('idle');
			}
		}

	function RonIntro(?dialogueBox:DialogueBox) 
	{
		states.PlayState.boyfriend.visible = false;
		states.PlayState.gf.visible = false;
		states.PlayState.dad.visible = false;
		FlxG.camera.follow(camFollow, LOCKON, 0.04 * (30 / (cast (Lib.current.getChildAt(0), Main)).getFPS()));
		//camFollow.y = boyfriend.getMidpoint().y;
		camFollow.x = states.PlayState.boyfriend.getMidpoint().x;
		FlxG.camera.fade(FlxColor.BLACK, 1, true, function()
		{
			new FlxTimer().start(0.5, function(swagTimer:FlxTimer)
			{  
				states.PlayState.boyfriend.visible = true;
				states.PlayState.gf.visible = true;
				FlxG.sound.play(Paths.sound('pop'));
				new FlxTimer().start(1, function(swagTimer:FlxTimer)
				{  
					add(dialogueBox);
				});
			});
		});
	}
	function RonIntro2():Void
		{
			FlxG.camera.follow(camFollow, LOCKON, 0.04 * (30 / (cast (Lib.current.getChildAt(0), Main)).getFPS()));
			FlxG.sound.music.fadeIn(1, 0.5, 0);
			//camFollow.y = boyfriend.getMidpoint().y;
			camFollow.x = states.PlayState.dad.getMidpoint().x;
			camFollow.y = states.PlayState.dad.getMidpoint().y;
			new FlxTimer().start(1, function(swagTimer:FlxTimer)
			{  
				states.PlayState.dad.visible = true;
				FlxG.sound.play(Paths.sound('Ron_Appear'));
				new FlxTimer().start(1, function(swagTimer:FlxTimer)
				{
					FlxG.sound.playMusic(Paths.music('Ron_Dialog'), 0.5);
					dialogue = Paths.txt('ron/ronAfterDialogue');
					var lol:DialogueBox = new DialogueBox(false, dialogue);
					lol.scrollFactor.set();
					lol.finishThing = startCountdown;
					add(lol);
					lol.cameras = [camHUD];
				});
			});
		}
	function ONSLAUGHTIntro(?dialogueBox:DialogueBox):Void
	{
		/*
		var RONDIESIHATERON:FlxSprite = new FlxSprite(600, 400);
		RONDIESIHATERON.frames = Paths.getSparrowAtlas('bob/cutscene/IHATERON');
		RONDIESIHATERON.animation.addByPrefix('idle', 'RonDied', 24,false);
		RONDIESIHATERON.animation.play('idle');
		RONDIESIHATERON.scrollFactor.set();
		RONDIESIHATERON.updateHitbox();
		RONDIESIHATERON.screenCenter();
		RONDIESIHATERON.scale.x = 1.12;
		RONDIESIHATERON.scale.y = 1.12;
		add(RONDIESIHATERON);
		FlxG.sound.play(Paths.sound('IHATERON'), 1, false, null, true, function()
			{
				remove(RONDIESIHATERON);
				FlxG.camera.fade(FlxColor.BLACK, 1, true, function()
					{
						camHUD.visible = true;
						add(dialogueBox);
					}, true);
			});
		*/
		
		camHUD.visible = false;

		FlxG.camera.fade(FlxColor.BLACK, 1, true, function()
			{
				camHUD.visible = true;
				add(dialogueBox);
			}, true);
		
		// TSG TODO!!! MOVE THAT TO A FUCKING UHHHH ENDSONG SHIT OK?
	}
	function bobSpookyIntro() 
		{
			camHUD.visible = false;
			FlxG.camera.fade(FlxColor.BLACK, 0.2, true);
			var bobTransforms:FlxSprite = new FlxSprite(600, 400);
			bobTransforms.frames = Paths.getSparrowAtlas('bob/cutscene/bobSpooky');
			bobTransforms.animation.addByPrefix('idle', 'BobTransforms', 24,false);
			bobTransforms.animation.play('idle');
			bobTransforms.scrollFactor.set();
			bobTransforms.updateHitbox();
			bobTransforms.screenCenter();
			bobTransforms.scale.x = 1.2;
			bobTransforms.scale.y = 1.2;
			add(bobTransforms);
			FlxG.sound.play(Paths.sound('bobSpooky'), 1, false, null, true, function()
				{
					remove(bobTransforms);
					FlxG.camera.fade(FlxColor.BLACK, 0.5, true, function()
					{
						camHUD.visible = true;
						startCountdown();
					}, true);
				});
		}

	var doof:DialogueBox = null;
	function initDoof()
	{
		var file:String = Paths.txt('run/DumbDialogPhloxMade'); //Checks for vanilla/Senpai dialogue
		#if MODS_ALLOWED
		if (!FileSystem.exists(file))
		#else
		if (!OpenFlAssets.exists(file))
		#end
		{
			file = Paths.txt('run/DumbDialogPhloxMade');
		}

		#if MODS_ALLOWED
		if (!FileSystem.exists(file))
		#else
		if (!OpenFlAssets.exists(file))
		#end
		{
			startCountdown();
			return;
		}

		doof = new DialogueBox(false, CoolUtil.coolTextFile(file));
		doof.cameras = [camHUD];
		doof.scrollFactor.set();
		doof.finishThing = startCountdown;
		doof.nextDialogueThing = PlayState.instance.startNextDialogue;
		doof.skipDialogueThing = PlayState.instance.skipDialogue;
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
		// Code here
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
