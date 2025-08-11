class Person {
  String name;
  int age;

  Person({required this.name, required this.age});

  void display() {
    print("name : $name, age : $age");
  }
}

void main() {
  Person p1 = Person(name: "a", age: 20);
  p1.display();
}
