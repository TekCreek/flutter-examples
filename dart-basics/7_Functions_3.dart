void main() {
  // Passing functions as arguments
  var list = [10, 20, 30, 40, 50];

  var doubledList = list.map((x) => x * 2).toList();
  print(doubledList);

  var filteredList = list.where((x) => x > 20).toList();
  print(filteredList);

  var filteredAndDoubledList = list
      .where((x) => x > 20)
      .map((x) => x * 2)
      .toList();
  print(filteredAndDoubledList);

  // reduce throws ERROR if the list is empty, in such case use the fold.
  // for reduce to work list should have atleast one value.
  var filteredAndDoubledListSum = list
      .where((x) => x > 20)
      .map((x) => x * 2)
      .reduce((x, y) => x + y);
  print(filteredAndDoubledListSum);

  // fold( initial, (previous, current) => expression )

  List<int> emptyList = [];
  var filteredAndDoubledListSum1 = emptyList
      .where((x) => x > 20)
      .map((x) => x * 2)
      .fold(0, (x, y) => x + y);
  print(filteredAndDoubledListSum1);
}
