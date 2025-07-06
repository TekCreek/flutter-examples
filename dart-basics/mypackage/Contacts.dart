/**
 * Classes - 
 *   Identifiers which start with underscore(_) are visible 
 *   only with in this module.
 */

class Contacts {
  List<String> _names = [];

  // here names is exposed as a property
  List<String> get names => [..._names];

  set names(List<String> names) => _names = [...names];

  void display() {
    print(_names);
  }
}
