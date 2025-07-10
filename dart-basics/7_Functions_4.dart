void main() {
  // During implementation if you are not interested in the value
  // passed to the argument then you can simply ignore that argument
  // with an underscore.
  int Function(int x, int y) func = (x, _) => x + 10;

  print(func(10, 20));
}
