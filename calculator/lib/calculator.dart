class Calculator{

  static String textValue = "";
  static int num1 = 0;
  static int num2 = 0;
  static String opSymbol = "";

  void addText(String value){
    textValue += value;
  }

  void addOpSymbol(String symbol){
    opSymbol = symbol;

    //store first value
    num1 = int.parse(textValue);

    textValue += " " + opSymbol + " ";
  }

  void reset(){
    textValue = "";
    opSymbol = "";
  }

  //return the operator that was selected
  String getOpSymbol(){
    return opSymbol;
  }

  String getText(){
    return textValue;
  }

  void submit(){

    var total = 0;
    
    //store the second num
    var textList = textValue.split(' ');

    num2 = int.parse(textList[2]);

    //perform operator selected
    switch(textList[1]){

      case '+':
        total = num1 + num2;
        break;
      case '-':
        total = num1 - num2;
        break;
      case '*':
        total = num1 * num2;
        break;
      case "/":
        total = (num1 / num2).round();
        break;
    }

    textValue = total.toString();
  }

}