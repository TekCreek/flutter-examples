/**
 * Functions - 
 *  Dart is a true object-oriented language, 
 *  so even functions are objects and have a type, Function. 
 *  This means that functions can be assigned to variables 
 *  or passed as arguments to other functions
 */
import "dart:io";

void main() {
  stdout.write('Enter any number');
  String? input = stdin.readLineSync();
  int n = int.parse(input ?? '0');

  bool isEvenResult = isEven(n);
  print('isEvenResult is ${isEvenResult}');

  bool isEvenSingleLineResult = isEvenSingleLine(n);
  print('isEvenSingleLineResult is ${isEvenSingleLineResult}');
}

bool isEven(int n) {
  return n % 2 == 0;
}

/**
 *    The => expr syntax is a shorthand for { return expr; }. 
 *    The => notation is sometimes referred to as arrow syntax.
 **/
bool isEvenSingleLine(int n) => n % 2 == 0;
