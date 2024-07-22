import 'dart:ui';

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount) ?? this;
  }
}
