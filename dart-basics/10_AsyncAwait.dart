Future<int> search(List<int> list, int searchEle) async {
  for (int i = 0; i < list.length; i++) {
    // Simulate a delay at each element
    await Future.delayed(Duration(milliseconds: 100));

    print('searching');
    if (list[i] == searchEle) {
      return i;
    }
  }
  return -1;
}

void main() async {
  List<int> list = [10, 20, 30, 40, 50];
  int searchEle = 40;

  // Model 1 : for parallelism
  Future<int> future = search(list, searchEle);
  future.then(
    (index) => {
      if (index == -1)
        print("$searchEle not found")
      else
        print('$searchEle found at index $index'),
    },
  );

  // Model 2: wait for search to complete
  // Here we are blocking main and waiting for search to complete
  // int index = await search(list, searchEle);
  // if (index == -1)
  //   print("$searchEle not found");
  // else
  //   print('$searchEle found at index $index');

  print("some other work in main");
}
