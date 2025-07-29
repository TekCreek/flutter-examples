class Account {
  // fields or methods prefixed with underscore(_) are visible with in the package.
  int _accountNo = 0;
  double _balance = 0;

  // Constructor
  Account(int acno, double bal) {
    _openAccount(acno, bal);
  }

  // Named constructor
  Account.open(int acno, double bal) {
    _openAccount(acno, bal);
  }

  // visibility restricted to package.
  void _openAccount(acno, bal) {
    if (acno > 0 && bal > 0) {
      this._accountNo = acno;
      this._balance = bal;
    } else {
      throw Exception("Invalid account details");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && (_balance - amount) > 0) {
      _balance -= amount;
    } else {
      throw Exception("Invalid amount or insufficient balance");
    }
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    } else {
      throw Exception("Invalid amount");
    }
  }

  void display() {
    print('Account details');
    print('Account number: $_accountNo');
    print('Balance: $_balance');
  }
}
