import 'dart:ui';

extension ColorExtension on Color {
  // https://stackoverflow.com/questions/58360989/programmatically-lighten-or-darken-a-hex-color-in-dart#:~:text=Color%20accurate%20solution%20with%20no%20plugin
  Color darken(int percent) {
    assert(1 <= percent && percent <= 100);
    final f = 1 - percent / 100;
    return Color.fromARGB(alpha, (red * f).round(), (green * f).round(), (blue * f).round());
  }
}
