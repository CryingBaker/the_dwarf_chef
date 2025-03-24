import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sizes.dart';
import '../utils/extensions/context.dart';

/// [Decorations] contains frequently used local styles.
class Decorations {
  static InputDecoration inputDecoration = InputDecoration(
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(BorderRadiusSizes.sm)),
    border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(BorderRadiusSizes.sm)),
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );

  static ButtonStyle priActionTextBTNStyle = secActionBTNStyle.copyWith(
      foregroundColor: WidgetStateProperty.all(Colors.white));

  static ButtonStyle secActionBTNStyle = ButtonStyle(
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(BorderRadiusSizes.sm))),
      textStyle: WidgetStateProperty.all(
          GoogleFonts.poppins(fontWeight: FontWeight.w600, letterSpacing: 1)));

  static ButtonStyle roundBTNStyle = ButtonStyle(
    shape: WidgetStateProperty.all(const CircleBorder()),
    padding: WidgetStateProperty.all(const EdgeInsets.all(PaddingSizes.md)),
    foregroundColor: WidgetStateProperty.all(Colors.white),
  );

  static ButtonStyle chipButtonStyle(BuildContext context, String? isSelected) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
        isSelected == null ? Colors.transparent : context.primaryColor,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
              width: 2,
              color: isSelected == null
                  ? const Color.fromARGB(1, 224, 225, 235)
                  : Colors.white),
        ),
      ),
    );
  }
}
