package;

import haxe.Timer;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.Assets;
import openfl.display.FPS;
import openfl.display.Sprite;
import openfl.events.*;
import openfl.ui.Keyboard;

import ui.Console;

class Main extends Sprite {
	var console: Console;
	var keys: Array<Bool>;
	var fps: FPS;
	var prevTime: Int;

	public function new() {
		super();
		console = new Console();
		console.update(0);

		#if js
			haxe.Log.trace = function(v: Dynamic, ?i):Void {
				var msg = if (i != null) i.fileName + ":" + i.lineNumber + ": " + v else v;
				console.log(msg);
				untyped __js__("console").log(msg);
			}
		#else
			haxe.Log.trace = function(v: Dynamic, ?i):Void {
				var msg = if (i != null) i.fileName + ":" + i.lineNumber + ": " + v else v;
				console.log(msg);
			}
		#end

		for (i in 0...30) trace(i);

		init();
	}

	public function init() {
		keys = [];
		prevTime = lime.system.System.getTimer();

		var bitmap = new Bitmap(Assets.getBitmapData("assets/openfl.png"));
		bitmap.x = (stage.stageWidth - bitmap.width) / 2;
		bitmap.y = (stage.stageHeight - bitmap.height) / 2;
		addChild(bitmap);

		fps = new FPS();
		addChild(fps);

		addChild(console);

		stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		stage.addEventListener(Event.ENTER_FRAME, update);
	}

	private function keyDown(event: KeyboardEvent):Void {
		if (!keys[event.keyCode] && event.keyCode == Keyboard.BACKQUOTE) {
			console.visible = !console.visible;
		}

		keys[event.keyCode] = true;
	}

	private function keyUp(event: KeyboardEvent):Void {
		keys[event.keyCode] = false;
	}

	private function update(event: Event):Void {
		var currentTime = lime.system.System.getTimer();
		var delta = (currentTime - prevTime) / 1000.0;
		prevTime = currentTime;

		var speed = 50;

		console.update(delta);
	}
}