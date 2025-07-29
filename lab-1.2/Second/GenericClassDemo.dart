/**
 * This is a very simple generic class example which may not be demonstrating
 * the full potential of generic classes. 
 * Refer to List, Map etc implementations for more enhanced usecases of generics.
 **/

class MyData<T> {
  T data;

  MyData(this.data);

  T getData() {
    return data;
  }

  void setData(T data) {
    this.data = data;
  }
}

void main() {
  MyData<int> m1 = MyData(10);
  print(m1.getData());

  MyData<String> m2 = MyData('abc');
  m2.setData('xyz');
  print(m2.getData());
}
