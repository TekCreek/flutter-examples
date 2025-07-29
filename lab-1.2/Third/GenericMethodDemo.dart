T add<T extends num>(T a, T b) {
  return (a + b) as T;
}

void main() {
  print(add(10, 20));
  print(add(10, 29.3));
}
