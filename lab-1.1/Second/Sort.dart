// Externalizing logic through function references

// arrow functions

void main() {
  var data = [10, 2, 3, 12, 5];

  // ascending order sort
  sort(data, (x, y) => x - y);
  print(data);

  // descending order sort
  sort(data, (x, y) => -(x - y));
  print(data);
}

void sort(List<int> data, int Function(int, int) compare) {
  int n = data.length;
  int temp;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n - i - 1; j++) {
      if (compare(data[j], data[j + 1]) > 0) {
        temp = data[j];
        data[j] = data[j + 1];
        data[j + 1] = temp;
      }
    }
  }
}
