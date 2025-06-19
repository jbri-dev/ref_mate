import 'package:flutter/material.dart';

class AppShadows {
  static final BoxShadow navigationBar = BoxShadow(
    color: Colors.black.withValues(alpha: 0.13),
    blurRadius: 14,
    offset: const Offset(0, 4),
  );
}
