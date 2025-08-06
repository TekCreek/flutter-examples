class Cup {
  String? content;

  Cup() {
    content = 'water';
  }

  Cup.coffee() {
    content = 'coffee';
  }

  Cup.tea() {
    content = 'tea';
  }

  void drink() {
    print("drink the $content");
  }

  void clean() {
    print('clean the cup');
    content = null;
  }
}

void main() {
  Cup c1 = new Cup();
  c1.drink();

  Cup c2 = Cup.coffee();
  c2.drink();

  Cup c3 = Cup.tea();
  c3.drink();
}
