dynamic class SomethingNew{
	var friendlyWelcome:String = "Hi there :)";
	public var introduction:String = "I'm something NEW!";
	private var secret:String = "don't tell anyone";
	public var message1:String;
	private var _message2:String;
	public var stageWidth:Number;
	function SomethingNew(message2:String){
		message1 = "one small step for man...";
		trace(this.message1 + "** this is from the class**");
		stageWidth = Stage.width;
		trace(this.stageWidth);
		setMessage2(message2);
		//trace(this.message2);
	}
	function setMessage2(message2){
		this._message2 = message2;
	}
	function getMessage2(){
		return this._message2;
	}
	function quote(quote1:String){
		trace(quote1);
	}
}