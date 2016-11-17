class TypeThis{
	private var typeStr:String;
	private var targetText:TextField;
	private var letterNum:Number;
	private var intID:Number;
	function TypeThis(typeStr, targetText){
		this.typeStr = typeStr;
		this.targetText = targetText;
		this.letterNum = 1;
		init();
	}
	private function init(){
		this.intID = setInterval(this,"typer", 20);
	}
	private function typer(){
		this.targetText.text = this.typeStr.substr(0,this.letterNum)
		if(this.letterNum < this.typeStr.length){
		this.letterNum +=1;
		}else{
			clearInterval(this.intID);
		}
	}
}