void main() {
  int iAmNotNullable;
  // iAmNotNullable = null; // ERROR
  iAmNotNullable = 10;
  print(iAmNotNullable);

  int? iAmNullable;
  iAmNullable = null;
  print(iAmNullable);

  // int specialValue = iAmNullable == null ? -1 : iAmNullable;
  // OR
  int specialValue = iAmNullable ?? -1;
  print(specialValue);

  // null aware expression
  int? absentValue = null;
  int? presentValue = 3;
  var items = [
    1,
    ?absentValue,
    presentValue,
    absentValue,
    5,
  ]; // [1, 3, null, 5]
  print(items);

  // null aware spread operator
  List<int>? list1 = null;
  // List<int>? list1 = [5, 6];
  List<int> list2 = [10, ...?list1, 20];
  print(list2);
}
