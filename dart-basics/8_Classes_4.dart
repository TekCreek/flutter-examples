// Directly obtained from documentation

class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  // value is null if launchDate is null else its year value.
  int? get launchYear => launchDate?.year;

  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);

  @override
  void describe() {
    super.describe();
    print("With an altitude ${this.altitude}");
  }
}

void main() {
  Spacecraft s1 = Spacecraft('a', DateTime(1994, 12, 12));
  s1.describe();
  print('Launch year for s1 ${s1.launchYear}');

  Spacecraft s2 = Spacecraft.unlaunched('b');
  s2.describe();
  print('Launch year for s2 ${s2.launchYear}');

  Orbiter o1 = Orbiter('Mangalyaan', DateTime(2013, 11, 05), 248.4);
  o1.describe();
}
