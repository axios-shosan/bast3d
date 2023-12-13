import 'package:flutter/material.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.lightDark1,
    required this.lightDark2,
    required this.lightDark3,
    required this.lightDark4,
    required this.lightDark5,
  });
  final Color? lightDark1;
  final Color? lightDark2;
  final Color? lightDark3;
  final Color? lightDark4;
  final Color? lightDark5;
  @override
  CustomColors copyWith({
    Color? lightDark1,
    Color? lightDark2,
    Color? lightDark3,
    Color? lightDark4,
    Color? lightDark5,
  }) {
    return CustomColors(
      lightDark1: lightDark1 ?? this.lightDark1,
      lightDark2: lightDark2 ?? this.lightDark2,
      lightDark3: lightDark3 ?? this.lightDark3,
      lightDark4: lightDark4 ?? this.lightDark4,
      lightDark5: lightDark5 ?? this.lightDark5,
    );
  }  // Controls how the properties change on theme changes
  @override

  // Controls how it displays when the instance is being passed
  // to the `print()` method.
  @override
  String toString() => 'CustomColors('
      'lightDark1: $lightDark1, lightDark2: $lightDark2, lightDark3: $lightDark3, lightDark4: $lightDark4, lightDark5: $lightDark5'
      ')';  // the light theme
  static const light = CustomColors(
    lightDark1: Color(0xff212121),
    lightDark2: Color(0xff282828),
    lightDark3: Color(0xff414141),
    lightDark4: Color(0xff5E5E5E),
    lightDark5: Color(0xff7A7A7A),
  );  // the dark theme
  static const dark = CustomColors(
    lightDark1: Color(0xff212121),
    lightDark2: Color(0xff282828),
    lightDark3: Color(0xff414141),
    lightDark4: Color(0xff5E5E5E),
    lightDark5: Color(0xff7A7A7A),
  );

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      lightDark1: Color.lerp(lightDark1, other.lightDark1, t),
      lightDark2: Color.lerp(lightDark2, other.lightDark2, t),
      lightDark3: Color.lerp(lightDark3, other.lightDark3, t),
      lightDark4: Color.lerp(lightDark4, other.lightDark4, t),
      lightDark5: Color.lerp(lightDark5, other.lightDark5, t),
    );
  }
}

class ThemeConfig {
  static const Color blue =  Color(0xff00A4FF);
  static const Color black =  Color(0xff000000);
  static const Color white = Color(0xffffffff);
  static const Color grey = Color(0xffA3A3A3);

  static ThemeData get theme => ThemeData(
    brightness: Brightness.light,
    primaryColor: black ,
    scaffoldBackgroundColor: black,
    appBarTheme: const AppBarTheme(
      elevation: 5,
      backgroundColor: black,
      titleTextStyle: TextStyle(color: white, fontSize: 24),
        shape: Border(bottom: BorderSide(color: white))
    ),
    colorScheme: const ColorScheme(
      background: Color(0xfff4f4f4),
      onBackground: black,
      brightness: Brightness.light,
      primary: black,
      onPrimary: white,
      secondary:  blue,
      onSecondary: white,
      tertiary: grey,
      //TODO: onTertiary can change, It depends on the UI
      onTertiary: black,
      error: Color(0xffFF7474),
      onError: Colors.white,
      surface: black,
      onSurface: white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
              const TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 20.0, fontFamily: "Hind")
          ),
          backgroundColor: MaterialStateProperty.all(
            blue,
          ),
        )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: black,
      unselectedItemColor: grey,
      selectedItemColor: blue,
      type : BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: blue),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: white),
      selectedIconTheme: IconThemeData(size: 25, color: blue),
      unselectedIconTheme: IconThemeData(size: 25, color: white),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: white,
      outlineBorder: BorderSide(width: 1.0, color: blue),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(fontSize: 16.0, fontFamily: "Hind", color: white),
    ),

  );
}