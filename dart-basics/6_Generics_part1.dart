/**
 * Generics - For type safety, better generated code, reduce code duplicaton.
 * 
 */
void main() {
  var ageList = <int>[]; // empty List of integers i.e. List<int>
  ageList.addAll([10, 20, 30]);
  // ageList.add('invalid value'); // ERROR can not insert string to an integer list.
  print(ageList);

  Set<String> names = Set<String>();
  names.add('abc');
  names.add('xyz');
  // names.add(30); // ERROR: can not add int value to set of strings
  print(names);

  Map<String, String> stdCode = {};
  stdCode['Guntur'] = '0863';
  stdCode['Vijayawada'] = '0866';
  print(stdCode);
}
