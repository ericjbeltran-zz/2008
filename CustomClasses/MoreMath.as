class MoreMath {
	private var min:Number;
	private var max:Number;
	private var rounding:Boolean;
	private var range:Number;
	private var resultUnrounded:Number;
	private var resultRandom:Number;
	static function newRandom(min:Number, max:Number, rounding:Boolean) {
		var range = max-min;
		var resultUnRounded = Math.random()*range;
		if (rounding) {
			var resultRandom = Math.round(resultUnRounded);
		} else {
			resultRandom = resultUnRounded;
		}
		resultRandom += min;
		return resultRandom;
	}
}
