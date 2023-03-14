import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

class ThemeBuilder extends StatelessWidget {
  final Widget Function(ThemeData lightTheme, ThemeData darkTheme) builder;

  const ThemeBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        final defaultTheme = ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue, brightness: Brightness.dark),
        );

        final lightTheme = lightColorScheme != null
            ? ThemeData.from(
                colorScheme: lightColorScheme,
                useMaterial3: true,
              )
            : defaultTheme;

        final darkTheme = darkColorScheme != null
            ? ThemeData.from(
                colorScheme: darkColorScheme,
                useMaterial3: true,
              )
            : defaultTheme;

        return builder(lightTheme, darkTheme);
      },
    );
  }
}
