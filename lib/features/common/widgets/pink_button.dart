import 'package:flutter/material.dart';

class PinkButton extends StatelessWidget {
  final Widget child;
  const PinkButton({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: const Color(0xffFEA6F6),
            borderRadius: BorderRadius.circular(20),
            border: const Border(
              top: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              left: BorderSide(
                color: Colors.black,
                width: 2,
              ),
              right: BorderSide(
                color: Colors.black,
                width: 4,
              ),
              bottom: BorderSide(
                color: Colors.black,
                width: 4,
              ),
            ),
          ),
          child: child),
    );
  }
}
