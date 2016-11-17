class TextAnim {
	var letterCount:Number = 0;
	var startLocX:Number;
	var startLocY:Number;
	var nextX:Number;
	var inputTextStr:String;
	var intMakeLetters:Number;
	var target:MovieClip;
	//
	function TextAnim(target, inputTextStr, startLocX, startLocY) {
		this.inputTextStr = inputTextStr;
		this.startLocX = startLocX;
		this.startLocY = startLocY;
		this.nextX = this.startLocX;
		this.target = target;
		init();
	}
	function init() {
		this.intMakeLetters = setInterval(this, "makeALetter", 100);
	}
	function makeALetter() {
		var newName:String = "letter"+letterCount;
		var newDepth:Number = this.target.getNextHighestDepth();
		var newLetter = this.target.attachMovie("anim letter", newName, newDepth);
		newLetter.mcLetter.txtLetter.text = inputTextStr.charAt(this.letterCount);
		newLetter.mcLetter.txtLetter.autoSize = true;
		newLetter._x = this.nextX;
		newLetter._y = 150;
		this.nextX += newLetter._width;
		this.letterCount += 1;
		if (this.letterCount>=this.inputTextStr.length) {
			clearInterval(this.intMakeLetters);
		}
	}
}
