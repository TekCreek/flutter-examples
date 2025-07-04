import 'Contacts.dart';

void main() {
  Contacts contacts = Contacts();
  // contacts._names.add('a'); // ERROR: _names is not visible
  // print(contacts._names);

  contacts.names = ['a', 'b'];
  contacts.names.add('c');
  contacts.display();
}
