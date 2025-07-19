void main() async {
  // mother
  Future<String> product = buy('paneer');
  product.then((p) {
    print('prepare biryani with the $p');
  });
  print('ready rice');
  print('cut onions etc');
}

// you
Future<String> buy(String productName) async {
  await Future.delayed(Duration(milliseconds: 100));
  print('walk to the store');
  print('order the product');
  print('pay the amount');
  return "[$productName]";
}
