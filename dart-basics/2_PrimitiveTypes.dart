/**
 * Primitive types - 
 *  Numbers (int, double) - num can be either int or double
 *  String
 *  bool 
 *  ...
 *  const - constants can not be modified after initialization
 */
void main() {
  int a = 1;
  print(a);

  double b = 1.2;
  print(b);

  num c = 1; // x can have both int and double values
  c += 2.5;
  print(c);

  var d = 10; // type inferred using value
  print(d);

  var one = int.parse('1');
  print(one);

  String oneAsString = 1.toString();
  print(oneAsString);

  const msPerSecond = 1000;
  // msPerSecond++; // ERROR
  print(msPerSecond);

  String s = 'String interpolation';
  print("value of s is $s");

  // using triple single or double quotes
  var multiLineStr = '''
You can create
multi-line strings like this one.
''';

  print(multiLineStr);

  var rawString = r'In a raw string, not even \n gets special treatment.';
  print(rawString);

  // constant string can only interpolate constants.
  var myVar = 10;
  // const STR = 'The value of myVar is $myVar'; // ERROR: since myVar is not constant
  // print(STR);

  const PI = 3.14;
  const STR1 = 'The value of PI is $PI'; // WORKS
  print(STR1);

  bool flag = true; // can be either true of false
  print(flag);

  var x = 10; // type determined using value is int and it is fixed.
  // x = 20.2; // ERROR: cannot assign double value to a variable of type int.

  dynamic y = 10; // y is int
  print(y.runtimeType); // int
  y = 20.2; // type is changed to double
  print(y.runtimeType); // double
}
