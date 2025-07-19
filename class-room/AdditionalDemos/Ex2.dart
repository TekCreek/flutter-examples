import "dart:io";

void main() {
  print("Enter n value");
  String? str = stdin.readLineSync();
  int n = int.parse(str ?? '0');

  print("Enter r value");
  String? str2 = stdin.readLineSync();
  int r = int.parse(str2 ?? '0');

  // find ncr and print the result

  double ncr = factorial(n) / (factorial(r) * factorial(n - r));
  print('ncr value is $ncr');
}

// write a function to find factorial of the given number

int factorial(int n) {
  int result = 1;
  for (int i = 1; i <= n; i++) result = result * i;
  return result;
}
