// A simple and easy example to understand async await.

void main() {
  // mother
  Future<String> paneerReceived = buy('paneer');
  Future<void> prepareRequiredItems = prepareItems();

  prepareRequiredItems.then(
    (_) => {
      paneerReceived.then((p) {
        print('prepare biryani with the $p');
      }),
    },
  );

  print('Main method is done');
}

Future<void> prepareItems() async {
  print('ready rice');
  await Future.delayed(Duration(milliseconds: 100));
  print('cut onions etc');
}

// you
Future<String> buy(String productName) async {
  print('walk to the store');
  // Simulate the delay
  await Future.delayed(Duration(milliseconds: 100));
  print('order the product');
  print('pay the amount');
  print('return with the $productName');
  return "[$productName]";
}
