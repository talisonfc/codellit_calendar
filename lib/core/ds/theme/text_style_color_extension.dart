import 'package:flutter/material.dart';
import 'custom_color_schema.dart';

extension TextStyleColorExtension on TextStyle {
  TextStyle get transparent {
    return copyWith(color: Colors.transparent);
  }

  TextStyle get onPrimary {
    return copyWith(color: CustomColorSchema.onPrimary);
  }

  TextStyle get onSecondary {
    return copyWith(color: CustomColorSchema.onSecondary);
  }

  TextStyle get surface {
    return copyWith(color: CustomColorSchema.surface);
  }

  TextStyle get onSurface {
    return copyWith(color: CustomColorSchema.onSurface);
  }

  TextStyle get onBackground {
    return copyWith(color: CustomColorSchema.onBackground);
  }

  TextStyle get error {
    return copyWith(color: CustomColorSchema.error);
  }

  TextStyle get onError {
    return copyWith(color: CustomColorSchema.onError);
  }

  TextStyle get tertiary {
    return copyWith(color: CustomColorSchema.tertiary);
  }

  TextStyle get hint {
    return copyWith(color: CustomColorSchema.tertiary.withOpacity(.8));
  }
}

extension TextStyleFamilyExtension on TextStyle {
  TextStyle get openSans {
    return copyWith(fontFamily: 'Open Sans');
  }

  TextStyle get lato {
    return copyWith(fontFamily: 'Lato');
  }

  TextStyle get inter {
    return copyWith(fontFamily: 'Inter');
  }
}

extension TextStyleWeightExtension on TextStyle {
  TextStyle get light {
    return copyWith(fontWeight: FontWeight.w300);
  }

  TextStyle get regular {
    return copyWith(fontWeight: FontWeight.w400);
  }

  TextStyle get medium {
    return copyWith(fontWeight: FontWeight.w500);
  }

  TextStyle get semiBold {
    return copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle get bold {
    return copyWith(fontWeight: FontWeight.w700);
  }

  TextStyle get extraBold {
    return copyWith(fontWeight: FontWeight.w800);
  }

  TextStyle get black {
    return copyWith(fontWeight: FontWeight.w900);
  }
}
