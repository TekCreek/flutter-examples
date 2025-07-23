void main() {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<int> newList = list.where((x) => x % 2 == 0)
                          .map((x) => x * 2)
                          .toList();
  print(newList);
}
