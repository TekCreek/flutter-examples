// Externalizing logic through function references

// arrow functions

void main() {
  var data = [10, 20, 30, 40, 50];
  var searchEle = 35;

  bool Function(int, int) eqComparison = (x, y) => x == y;
  bool Function(int, int) neqComparison = (x, y) => x != y;

  if (search(data, searchEle, eqComparison) == true) {
    print('found an element in the list which is equal to given searchEle');
  } else {
    print(
      'did not find an element in the list which is equal to given searchEle',
    );
  }

  if (search(data, searchEle, neqComparison) == true) {
    print(
      'found an element in the list which is not equal to given search ele',
    );
  } else {
    print(
      'did not find an element in the list which is not equal to given search ele',
    );
  }
}

bool search(List<int> list, int searchEle, bool Function(int, int) cmp) {
  for (var ele in list) {
    if (cmp(ele, searchEle) == true) {
      return true;
    }
  }
  return false;
}
