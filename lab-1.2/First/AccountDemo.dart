import 'banking/Account.dart';

void main() {
  Account acc1 = Account(1, 1000);
  acc1.deposit(2000);
  acc1.withdraw(1000);
  acc1.display();

  Account acc2 = Account.open(2, 2000);
  acc2.withdraw(3000);
  acc2.display();
}
