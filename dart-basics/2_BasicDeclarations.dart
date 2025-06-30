/**
 * Run: 
*     dart 2_BasicDeclarations.dart
 */
void main() {
  int i = 10;

  var a = 20; // type is obtained from value,
  // once type is fixed it can not be changed.

  // a = "try this string"; // error as a is int

  a = 30; // valid

  double x = 2.2;

  num b = 10.2; // num could be either int or double

  print(i.runtimeType);
  print(a.runtimeType);
  print(x.runtimeType);
  print(b.runtimeType);

  const PI = 3.1417;
  // PI++; // ERROR

  print("Value of PI is ${PI}");

  final ANOTHER_PI = 3.1417;
  // ANOTHER_PI++; // ERROR

  bool flag = true;
  // flag = 1;

  bool? canBeNull = null;
  print("value of canBeNull is ${canBeNull} ");

  print("value is ${canBeNull ?? "MyOwnDefaultValue"}");
}
