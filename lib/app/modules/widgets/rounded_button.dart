// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:podcast_ba/app/common/colors.dart';

SizedBox roundedButtonStyle(double height, double width, double size, String title, Color back, Color front, TextStyle style, Function()? roundedButtonFunction) {
    return SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: back,
              foregroundColor: front,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size))
            ),
            onPressed: roundedButtonFunction, child: Text(title, style: style,)),
        );
  }

