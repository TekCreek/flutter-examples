import "dart:io";

double div(double a, double b) {
  if (b == 0) {
    throw Exception('second argument can not be zero');
  }
  return a / b;
}

void main() {
  try {
    print("Enter first value");
    String? input1 = stdin.readLineSync();
    double a = double.parse(input1 ?? "0");

    print("Enter second value");
    String? input2 = stdin.readLineSync();
    double b = double.parse(input2 ?? "0");

    double c = div(a, b);
    print("Result is $c");
  } on FormatException catch (e) {
    print('Invalid input value $e');
  } on Exception catch (e) {
    print(e.toString());
  } finally {
    print('I run irrespective of exception');
  }
}
