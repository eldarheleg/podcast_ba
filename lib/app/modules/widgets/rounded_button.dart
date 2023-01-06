import 'package:flutter/material.dart';
import 'package:podcast_ba/app/common/colors.dart';

SizedBox roundedButtonStyle(double height, double width, double size, String title, Color back, Color front, TextStyle style) {
    return SizedBox(
          height: height,
          width: width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: back,
              foregroundColor: front,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(size))
            ),
            onPressed:() {
            
          }, child: Text(title, style: style,)),
        );
  }