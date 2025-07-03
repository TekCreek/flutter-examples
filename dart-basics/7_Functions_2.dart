/**
 * Functions - 
 */
void main() {
  int x = add(10, 20);
  print('value of x is $x');

  int y = addWithNullParameters(10, null);
  print('value of y is $y');

  int z1 = addWithOptionalPositionalParameter(10, 20);
  print('value of z1 is $z1');

  int z2 = addWithOptionalPositionalParameterWithDefault(10, 20);
  print('value of z1 is $z2');

  int p = addWithNamedParameters(b: 10);
  print('value of p is $p');

  int q = addWithRequiredNamedParameters(b: 10, c: null);
  print('value of q is $q');

  // You can store function reference in a variable and call it.

  int Function(int, int) myAdd = add;
  int r = myAdd(10, 30);
  print('value of r is $r');

  // anonymous function definition
  int Function(int, int) myAnonAdd = (a, b) {
    return a + b;
  };

  int s = myAnonAdd(10, 20);
  print("value of s is $s");

  // anonymous function definition using arrow
  int Function(int, int) myAnonAddWithArrow = (a, b) => a + b;

  int t = myAnonAddWithArrow(10, 20);
  print("value of t is $t");

  // Optional to understand the below one.
  var add1 = (a, b, c) => a + b + c; // parameters are dynamic
  print(add1(10, 20, 30));
  print(add1('abc', 'xyz', 'pqr'));
  // print(add1(true, false, false)); // ERROR boolean doesn't support + operation
  print(add1([1], [2], [1, 3, 4]));
  // print(add1({1}, {2}, {1, 3, 4})); // ERROR: set doesn't support + operation
  // print(add1({'a': 1}, {'b': 2}, {'c': 3})); // ERROR: Map doesn't support + operation
}

/**
 * In the below two definitions a and b are positional parameters and are 
 * required. 
 * In case of add(int, int) both are required and not nullable.
 * In case of add(int?, int?) both are required but are nullable.
 */
int add(int a, int b) {
  return a + b;
}

int addWithNullParameters(int? a, int? b) {
  return (a ?? 0) + (b ?? 0);
}

/**
 * [] makes parameter optional.
 * Here third parameter c is optional. Hence it should be either nullable or
 * give a default value. First example it is nullable, in the second example
 * it has a default value.
 */
int addWithOptionalPositionalParameter(int a, int b, [int? c]) {
  return a + b + (c ?? 0);
}

int addWithOptionalPositionalParameterWithDefault(int a, int b, [int c = 0]) {
  return a + b + c;
}

/**
 * {} for named parameters, they should be referred with name during the call.
 * e.g. addWithNamedParameters(a: 10, b: 20)
 * or   addWithNamedParameters(b: 10, a: 20)
 * They are optional by default and null is the default value. 
 * Hence they should be nullable or should be given default value. 
 * In the below example a is nullable and b has a default value.
 * 
 * Named parameters are optional with implicit default value as null, hence 
 * ? is needed unless explicity stated as required.
 */
int addWithNamedParameters({int? a, int b = 0}) {
  return (a ?? 0) + b;
}

/**
 * required forces the parameter value to be passed.
 */
int addWithRequiredNamedParameters({int? a, required int b, required int? c}) {
  return (a ?? 0) + b + (c ?? 0);
}
