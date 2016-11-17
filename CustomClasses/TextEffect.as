/*
var myTextEffect:TextEffect = new TextEffect(target:MovieClip, inputTextStr:String, effect:String,startLocX:String, startLocY:String, formatEffect:TextFormat);
*/
import mx.transitions.Tween;
import mx.transitions.easing.*;
class TextEffect {
	var letterCount:Number = 0;
	var startLocX:Number;
	var startLocY:Number;
	var nextX:Number;
	var inputTextStr:String;
	var intMakeLetters:Number;
	var target:MovieClip;
	var effect:String;
	var formatEffect:TextFormat;
	//
	function TextEffect(target, inputTextStr, effect, startLocX, startLocY, formatEffect) {
		this.inputTextStr = inputTextStr;
		this.startLocX = startLocX;
		this.startLocY = startLocY;
		this.nextX = this.startLocX;
		this.target = target;
		this.effect = effect;
		this.formatEffect = formatEffect;
		init();
	}
	function init() {
		this.intMakeLetters = setInterval(this, "makeALetter", 100);
	}
	function makeALetter() {
		var newName:String = "letter"+letterCount;
		var newDepth:Number = this.target.getNextHighestDepth();
		//var newLetter = this.target.attachMovie("letter", newName, newDepth);
		var newLetter = this.target.createEmptyMovieClip(newName, newDepth);
		newLetter.createTextField("txtLetter", 1, 0, 0, 50, 50);
		newLetter.txtLetter.setNewTextFormat(this.formatEffect);
		newLetter.txtLetter.text = inputTextStr.charAt(this.letterCount);
		newLetter.txtLetter.autoSize = true;
		newLetter._x = this.nextX;
		newLetter._y = 150;
		this.nextX += newLetter._width;
		if(this.effect == "spin"){
		var reverseTween:Tween = new Tween(newLetter, "_yscale", Regular.easeInOut, -100, 100, 2, true);
		reverseTween.stop();
		var newLetterTween:Tween = new Tween(newLetter, "_yscale", Regular.easeInOut, 100, -100, 2, true);
		newLetterTween.onMotionFinished = function(){
			//this.yoyo();
			reverseTween.resume();
		}
		} else if (this.effect == "pop"){
			var popXTween:Tween = new Tween(newLetter, "_xscale", Bounce.easeOut, 0, 100, 1, true);
			var popYTween:Tween = new Tween(newLetter, "_yscale", Bounce.easeOut, 0, 100, 1, true);
		}
		this.letterCount += 1;
		if (this.letterCount>=this.inputTextStr.length) {
			clearInterval(this.intMakeLetters);
		}
	}
}