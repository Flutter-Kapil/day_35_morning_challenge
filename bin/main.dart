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
dynamic StackCalc(String stack) {
  List stackList = stack.split(' ').toList();
  List returnStack = [];
  // int indexOfFirstOp = stackList.firstWhere();
  for (int i = 0; i < stackList.length; i++) {
    String element = stackList[i];
    if (isInteger(element)) {
      returnStack.add(int.parse(element));
    } else {
      if (element == '+') {
        int result = returnStack.removeLast() + returnStack.removeLast();
        returnStack.add(result);
      } else if (element == '-') {
        int result = returnStack.removeLast() - returnStack.removeLast();
        returnStack.add(result);
      } else if (element == '*') {
        int result = returnStack.removeLast() * returnStack.removeLast();
        returnStack.add(result);
      } else if (element == '/') {
        int result = returnStack.removeLast() ~/ returnStack.removeLast();
        returnStack.add(result);
      }
    }
  }
  // if (indexOfFirstOp == -1) {
  //   return 0;
  // }
  print(returnStack);
  return returnStack.last;
}

int firstOperatorIndex(List stackList) {
  List x = [];
  print(x);
  if (stackList.contains('*')) {
    stackList.indexOf('*');
    return 0;
  } else if (stackList.contains('+')) {
    return stackList.indexOf('+');
  } else if (stackList.contains('-')) {
    return stackList.indexOf('-');
  } else if (stackList.contains('/')) {
    return stackList.indexOf('/');
  } else {
    return -1;
  }
}

bool isOperator(String x) {
  if (x == '/') {
    return true;
  } else if (x == '*') {
    return true;
  } else if (x == '+') {
    return true;
  } else if (x == '-') {
    return true;
  } else {
    return false;
  }
}

bool isInteger(String x) {
  if (x == '1') {
    return true;
  } else if (x == '2') {
    return true;
  } else if (x == '3') {
    return true;
  } else if (x == '4') {
    return true;
  } else if (x == '5') {
    return true;
  } else if (x == '6') {
    return true;
  } else if (x == '7') {
    return true;
  } else if (x == '8') {
    return true;
  } else if (x == '9') {
    return true;
  } else if (x == '0') {
    return true;
  } else {
    return false;
  }
}

main() {
  print(StackCalc("5 6 +"));
  // List stackList = ['5', '6', '+'];
  // String x ='+';
  // int y =+;
}
