abstract class Vehicle {
  double speed;
  final String color;

  Vehicle(this.speed, this.color);

  void drive();
  void stop();

  void checkSpeed(double maxSpeed) {
    if (speed > maxSpeed) {
      print('Предупреждение: скорость превышает максимально допустимую ($maxSpeed км/ч)!');
    }
  }
}

class Car extends Vehicle {
  bool _engineStatus;

  Car(double speed, String color, {bool engineStatus = false})
      : _engineStatus = engineStatus,
        super(speed, color);

  bool get engineStatus => _engineStatus;

  @override
  void drive() {
    if (!_engineStatus) {
      print('Заводим двигатель автомобиля...');
      _engineStatus = true;
    }
    print('Автомобиль цвета $color начал движение со скоростью $speed км/ч');
    checkSpeed(130); // Максимальная (разрешённая) скорость для автомобиля
  }

  @override
  void stop() {
    _engineStatus = false;
    print('Автомобиль цвета $color остановился');
  }
}

class Bicycle extends Vehicle {
  bool engineStatus; // Для велосипеда - "движется" или "не движется"

  Bicycle(double speed, String color, {this.engineStatus = false})
      : super(speed, color);

  @override
  void drive() {
    engineStatus = true;
    print('Велосипед цвета $color начал движение со скоростью $speed км/ч');
    checkSpeed(60); // Максимальная (адекватная) скорость для велосипеда
  }

  @override
  void stop() {
    print('Велосипед цвета $color остановился');
    engineStatus = false;
  }
}

void main() {
  Car car = Car(0, 'зеленый');
  Bicycle bicycle = Bicycle(0, 'красный');

  print('--- Автомобиль ---');
  car.drive();
  car.speed = 150; // Превышаем скорость
  car.drive();
  car.stop();

  print('\n--- Велосипед ---');
  bicycle.drive();
  bicycle.speed = 75; // Превышаем скорость
  bicycle.drive();
  bicycle.stop();
}