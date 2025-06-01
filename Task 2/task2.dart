import 'dart:math';

abstract class Shape {
  double area();
  double perimeter();
}

class Circle extends Shape {
  final double radius;

  Circle(this.radius);

  @override
  double area() => pi * radius * radius;

  @override
  double perimeter() => 2 * pi * radius;
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle(this.width, this.height);

  @override
  double area() => width * height;

  @override
  double perimeter() => 2 * (width + height);
}

class Triangle extends Shape {
  final double sideA;
  final double sideB;
  final double sideC;

  Triangle(this.sideA, this.sideB, this.sideC);

  @override
  double area() {
    final p = perimeter() / 2;
    return sqrt(p * (p - sideA) * (p - sideB) * (p - sideC));
  }

  @override
  double perimeter() => sideA + sideB + sideC;
}

void main() {
  final List<Shape> shapes = [
    Circle(6),
    Rectangle(3, 6),
    Triangle(3, 4, 5),
  ];

  for (final shape in shapes) {
    print('Фигура: ${shape.runtimeType}');
    print('  Площадь: ${shape.area()}');
    print('  Периметр: ${shape.perimeter()}');
    print('-------');
  }
}