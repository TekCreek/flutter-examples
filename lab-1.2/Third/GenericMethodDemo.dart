T add<T extends num>(T a, T b) {
  return (a + b) as T;
}

void main() {
  print(add(10, 20));
  print(add(10, 29.3));
}


/**
 Note: For reference 

 The following function demonstrates usage of a generic function template for 
 search operation, it helps develop the search function for any given type, unlike
 the earlier version of the function i.e. bool search(List<int> data, int searchEle.....)
 which limits the usage to only integer types, the generic search function can be applicable
 for any given type. 

 bool search<Type>(List<Type> data, Type searchEle, 
                  bool Function(Type, Type) compare) {
  for (var ele in data) {
    if (compare(ele, searchEle)) {
      return true;
    }
  }
  return true;
}

*/