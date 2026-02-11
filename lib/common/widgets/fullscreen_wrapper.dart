import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FullscreenWrapper extends StatelessWidget {
  final Widget child;

  const FullscreenWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  void _enableFullscreen() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
      overlays: [], // Hides both status and navigation bars
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _enableFullscreen,
      child: child,
    );
  }
}