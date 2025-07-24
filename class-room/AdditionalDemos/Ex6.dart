void main() {
  List<int> data = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  // List<int> newCollection = [];
  // for (var ele in data) {
  //   if (ele % 2 == 0) {
  //     newCollection.add(ele * ele);
  //   }
  // }
  // print(newCollection);

  List<int> newCollection = data
      .where((x) => x % 2 == 0)
      .map((x) => x * x)
      .toList();

  print(newCollection);
}
