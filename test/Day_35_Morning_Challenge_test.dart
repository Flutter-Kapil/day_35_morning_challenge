import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case', (){
expect(StackCalc(""),0);
expect(StackCalc("5 6 +"),11);
expect(StackCalc("3 DUP +"), 6);
expect(StackCalc("6 5 5 7 * - /"), 5);
  });
}
