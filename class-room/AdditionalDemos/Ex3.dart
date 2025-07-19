// A simple and easy example to understand async await.

// Note - Not 100% accurate example

void main() async {
  // mother
  Future<String> paneerReceived = buy('paneer');

  paneerReceived.then((p) {
    print('prepare biryani with the $p');
  });

  print('ready rice');
  print('cut onions etc');
}

// you
Future<String> buy(String productName) async {
  // Simulate the delay
  await Future.delayed(Duration(milliseconds: 100));

  print('walk to the store');
  print('order the product');
  print('pay the amount');

  return "[$productName]";
}
