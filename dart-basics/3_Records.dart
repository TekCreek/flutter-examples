/**
 * Record - allows multipe heterogeneous objects 
 *          to be aggregated as a single object
 */
void main() {
  var record1 = (10, 20, 'abc');
  print(record1);
  print(record1.$1); // positional access.
  print(record1.$2);
  print(record1.$3);

  // record type annotation with positional fields.
  (String, int) contactRec = ('test', 123);
  print(contactRec);
  print(contactRec.$1);
  print(contactRec.$2);

  // record type annotation with named fields,
  ({int x, int y}) point;
  point = (x: 190, y: 200);
  print(point);

  // mixing both positional fields and named fields,
  // named field should be written after positional fields.
  (int, int, {int x, int y}) rec = (10, 20, x: 30, y: 40);
  print(rec);
  print(rec.$1);
  print(rec.$2);
  print(rec.x);
  print(rec.y);

  // destructuring record values using named types
  var rec1 = (name: 'abc', address: 'Guntur', age: 20);

  // destructures the record pattern to local variables i.e name, address, age
  final (:name, :address, :age) = rec1;
  print(name);
  print(address);
  print(age);

  // defining custom types from records using typedef
  Point3D p = (x: 10, y: 20, z: 30);
  print(p);
}

//typedef creates an alias name for the structural type
typedef Point3D = ({int x, int y, int z});
