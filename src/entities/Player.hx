package entities;

import luxe.Sprite;

import components.Movement;
import components.PlayerController;
import components.MovementParticles;

import luxe.Color;
import luxe.Vector;

class Player extends Sprite {

	override public function new(){

		// initialize player
		super({
			name: 'player',
			pos: Luxe.screen.mid,
			color: new Color().rgb(0xf94b04),
			size: new Vector(32, 64)
		});

		// attach player controller
		add(new Movement()); // handles movement
		add(new PlayerController()); // handles input

		// attach movement particles component
		add(new MovementParticles());

	}

	override function init(){
		


	}//init

	override function update(dt:Float){


	}//update

}//Player
