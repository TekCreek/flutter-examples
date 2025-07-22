void main() {
  // fn an accept reference to a function which accepts two integers
  // and returns an integer
  int Function(int, int) fn;

  // fn is pointing to add hence fn(10,20) will call add function.
  fn = add;
  print(fn(10, 20));

  // fn is pointing to sub hence fn(10,20) will call sub function.
  fn = sub;
  print(fn(10, 20));

  // Anonymous arrow function
  fn = (x, y) => x * y;
  print(fn(10, 20));
}

int add(int a, int b) {
  return a + b;
}

int sub(int a, int b) {
  return a - b;
}
