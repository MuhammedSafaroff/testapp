import 'package:flutter/material.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: 0.7,
        child: const CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(
            Colors.black,
          ),
        ),
      ),
    );
  }
}
