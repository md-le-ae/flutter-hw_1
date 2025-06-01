class BankAccount {
  final String _accountNumber;
  double _balance;

  BankAccount(this._accountNumber, this._balance);

  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError('Сумма должна быть положительной');
    }
    _balance += amount;
    print('Счёт $_accountNumber пополнен на $amount. Новый баланс: $_balance');
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw ArgumentError('Сумма должна быть положительной');
    }
    if (amount > _balance) {
      throw Exception('Недостаточно средств на счёте $_accountNumber');
    }
    _balance -= amount;
    print('Со счёта $_accountNumber снято $amount. Остаток: $_balance');
  }

  double getBalance() => _balance;

  String get accountNumber => _accountNumber;
}

void main() {
  try {
    final account = BankAccount('123456789', 1000.0);

    print('Счёт: ${account.accountNumber}');
    print('Начальный баланс: ${account.getBalance()}');

    account.deposit(500.0); // Успешно
    account.withdraw(200.0); // Успешно
    account.withdraw(2000.0); // Ошибка: недостаточно средств
    account.withdraw(-1000.0); // Ошибка: отрицательная сумма
    account.deposit(-100.0); // Ошибка: отрицательная сумма
  } catch (e) {
    print('Ошибка: $e');
  }
}
