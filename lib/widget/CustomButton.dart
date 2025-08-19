import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTapMethod,
    required this.title,
    this.isEnabled = false,
    this.color = Colors.pinkAccent,
    this.textColor = Colors.white,
  });

  final VoidCallback onTapMethod;
  final String title;
  final bool isEnabled;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DeviceInfo.size.width * 0.9,
      height: DeviceInfo.size.height * 0.06,
      child: ElevatedButton(
        onPressed: isEnabled ? onTapMethod : null,
        style: ElevatedButton.styleFrom(elevation: 5.0, backgroundColor: color),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
