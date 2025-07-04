/**
 * Classes
 *   Every object is an instance of a class, all except Null descend from Object.
 */
class Point {
  int x;
  int y;

  // constructor

  // Point(p, q) : x = p, y = q;
  Point(this.x, this.y);

  // named constructor
  Point.from(Map m) : x = m['x'], y = m['y'];

  void display() {
    print('($x, $y)');
  }
}

void main() {
  Point p = Point(10, 20); // new is optional
  p.display();

  Point q = Point.from({'x': 20, 'y': 30});
  q.display();

  p.x = 100; //  setter and getter for fields are auto generated
  print(p.x); // getter
}
