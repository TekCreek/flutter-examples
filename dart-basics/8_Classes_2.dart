/**
 * Classes - 
 *   const to support immutability.
 *   To support constant objects we need constant constructor and final fields.
 */

class Point {
  final int x;
  final int y;
  // int z;   // ERROR: non final fields are not allowed when using const
  // constructor.

  const Point(this.x, this.y);

  void display() {
    print('($x, $y)');
  }
}

void main() {
  Point p = Point(10, 20);
  // p.x = 12; // ERROR not supported since x is final.
  p.display();

  Point q = const Point(30, 40);
  q.display();
}
