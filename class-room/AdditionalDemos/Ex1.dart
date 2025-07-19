import "dart:io";

void main() {
  print("Enter some number");
  String? str = stdin.readLineSync();
  int n = int.parse(str ?? '0');

  // check if the given number is even or not using
  // a function

  bool result = isEven(n);
  if (result) {
    print('Yes given number is even');
  } else {
    print('it is not even');
  }
}

bool isEven(int n) {
  if (n % 2 == 0)
    return true;
  else
    return false;
}

/*

       
       product buy(productName, qty,  money) {
            walk to the store
            ask for the product
            take the product
            pay the money
            return with the product
       }

*/
