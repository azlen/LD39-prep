
import luxe.Input;

import entities.Player;

import entities.Enemy;

import luxe.gifcapture.LuxeGifCapture;
import dialogs.Dialogs; // dialogs for saving gifs

class Main extends luxe.Game {

	var capture : LuxeGifCapture;

	override function ready() {

		new Player();

		new Enemy();

		connect_input();
 		
 		init_gifcapture();		

	} // ready

	override function onkeyup( e:KeyEvent ) {

		if(e.keycode == Key.space) {
			if(capture.state == Paused) {
				capture.record();
				trace('recording: active');
			} else if (capture.state == Recording) {
				capture.commit();
				trace('recording: committed');
			}
		}

		if(e.keycode == Key.escape) {
			Luxe.shutdown();
		}

	} // onkeyup

	override function update(dt:Float) {

	} // update

	function connect_input() {

		// WASD controls

		Luxe.input.bind_key('up', Key.key_w);
		Luxe.input.bind_key('left', Key.key_a);
		Luxe.input.bind_key('down', Key.key_s);
		Luxe.input.bind_key('right', Key.key_d);

	} // connect_input

	function init_gifcapture() {

		capture = new LuxeGifCapture({
			width: Std.int(Luxe.screen.w/2),
			height: Std.int(Luxe.screen.h/2),
			fps: 30, 
			max_time: 10,
			quality: GifQuality.Worst,
			repeat: GifRepeat.Infinite,
			oncomplete: function(_bytes:haxe.io.Bytes) {
				var path = Dialogs.save('Save GIF');
				if(path != '') sys.io.File.saveBytes(path, _bytes);
	    	}
		});

	} // init_gifcapture


} //Main
