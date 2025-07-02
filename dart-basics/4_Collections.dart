/**
 * Collections - 
 *  List - ordered group of objects
 *  Set - unordered group of unique objects
 *  Map - collection of key, value pairs
 */
void main() {
  var list = [1, 2, 3, 1]; // duplicates allowed

  print(list.runtimeType);
  print('length of the list is ${list.length}');
  print('value at index 2 is ${list[2]}'); // accessing element through index

  const constList = [1, 2, 3];
  // constList[2] = 5; // Runtime Error: list is unmodifiable list
  print(constList);

  print("values in the list are ");
  for (var val in constList) {
    print(val);
  }

  // set doesn't add duplicates
  var colorSet = {'red', 'green', 'red'};
  print(colorSet); // only {'red', 'green'}
  colorSet.add('blue'); // addAll can be used to add multiple values
  // i.e. colorSet.addAll(otherCollection)
  print(colorSet); // {'red','green','blue'}
  print('number of colors added so far ${colorSet.length}');

  print("values in the colorSet are ");
  for (var val in colorSet) {
    print(val);
  }

  var stateCapitalMap = {
    'Andhra': 'Amaravati',
    'Telangana': 'Hyderabad',
    'Karnataka': 'Bangalore',
  };
  // print(stateCapitalMap['Andhra']); // value = map[key]

  print("values in the stateCapitalMap are ");
  for (var state in stateCapitalMap.keys) {
    print('${stateCapitalMap[state]} is the capital of ${state}');
  }

  // spread operator
  var list1 = {1, 2, 3, 4};
  var list2 = {...list1, 5, 6, 7};
  print(list2);
}
