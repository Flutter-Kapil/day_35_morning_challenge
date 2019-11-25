// A stack machine processes instructions by pushing and popping values to an
// internal stack. A simple example of this is a calculator.
//
//  The argument passed to run(instructions) will always be a string containing a series of instructions.
//  The instruction set of the calculator will be this:
//
//  +: Pop the last 2 values from the stack, add them, and push the result onto the stack.
//  -: Pop the last 2 values from the stack, subtract the lower one from the
//     topmost one, and push the result.
//  *: Pop the last 2 values, multiply, and push the result.
//  /: Pop the last 2 values, divide the topmost one by the lower one, and push the result.
//  DUP: Duplicate (not double) the top value on the stack.
//  POP: Pop the last value from the stack and discard it.
//  PSH: Performed whenever a number appears as an instruction. Push the number to the stack.
//  Any other instruction (for example, a letter) should result in the value
//  "Invalid instruction: [instruction]"

/// Examples
//  StackCalc("") ➞ 0
//  StackCalc("5 6 +") ➞ 11
//  StackCalc("3 DUP +") ➞ 6
//  StackCalc("6 5 5 7 * - /") ➞ 5
//  StackCalc("x y +") ➞ Invalid instruction: x
dynamic stackCalc(String stack) {
  if (stack.isEmpty) {
    return 0;
  }
  try{
    List stackList = stack.split(' ').toList();
  List returnStack = [];
  // int indexOfFirstOp = stackList.firstWhere();
  for (int i = 0; i < stackList.length; i++) {
    String element = stackList[i];
    if (isInteger(element)) {
      returnStack.add(int.parse(element));
    } else {
      // print(returnStack.length);
      // if(returnStack.length<2){
      //   return ArgumentError;
      // }
      if(returnStack.isEmpty){
        throw Error();
      }
      if (element == 'POP' ) {
        returnStack.removeAt(returnStack.length - 1);
      } else if (element == 'DUP' ) {
        int result = returnStack.last;
        returnStack.add(result);
      } else if (element == '+' && returnStack.length >= 2) {
        int result = returnStack.removeLast() + returnStack.removeLast();
        returnStack.add(result);
      } else if (element == '-' && returnStack.length >= 2) {
        int result = returnStack.removeLast() - returnStack.removeLast();
        returnStack.add(result);
      } else if (element == '*' && returnStack.length >= 2) {
        int result = returnStack.removeLast() * returnStack.removeLast();
        returnStack.add(result);
      } else if (element == '/' && returnStack.length >= 2) {
        int last = returnStack.removeLast();
        int secondLast = returnStack.removeLast();
        if(secondLast==0){
          return ArgumentError('Invalid Input: divide by zero');
        }
        int result = last ~/ secondLast;
        returnStack.add(result);
      } else if (returnStack.length == 1) {
        throw ArgumentError('Invalid input');
      }
    }
  }
  return returnStack.last;
  }catch(e){
    print('debug statement ,error:$e');
    return('Invalid Input');
  }
}


bool isInteger(String s) {
  return int.tryParse(s) != null;
}
//https://stackoverflow.com/questions/24085385/checking-if-string-is-numeric-in-dart

main() {
  // print(stackCalc("1 5 6 6 + - /"));
  // print(stackCalc("3 DUP +"));
  // print(stackCalc("3 +"));
  // print(stackCalc("1 5 6 POP +"));
  // print(stackCalc("6 5 5 7 POP - +"));
  // print(stackCalc("0 5 5 7 POP - /"));
  // print(stackCalc("6 5 0 7 POP - /"));//since we are using ~/ instead of / output will be zero
  // print(stackCalc("2 1 POP +"));
  print(stackCalc("+ - 1 2 +"));
  // List x=[];
  // x.removeLast();
  // print(x);
}
