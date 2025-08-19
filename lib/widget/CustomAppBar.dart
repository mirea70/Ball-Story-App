import 'package:ballstory_app/common/CommonConfig.dart';
import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:flutter/material.dart';
import '../view_model/BaseViewModel.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.resetViewModel,
    required this.step,
    required this.totalStep,
    this.onPressed,
  });

  final BaseViewModel? resetViewModel;
  final int step;
  final int totalStep;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: DeviceInfo.padding.top),
          Row(
            children: [
              Container(
                color: Colors.pinkAccent,
                height: 6,
                width: DeviceInfo.size.width / totalStep * step,
              ),
              Container(
                color: Color(0xffE8E8E8),
                height: 6,
                width: DeviceInfo.size.width / totalStep * (totalStep - step),
              ),
            ],
          ),
          SizedBox(height: DeviceInfo.size.height * 0.01),
          Padding(
            padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.02),
            child: IconButton(
              onPressed: onPressed != null
                  ? onPressed
                  : () {
                      if (resetViewModel != null) resetViewModel!.reset();
                      Navigator.pop(context);
                    },
              icon: Icon(Icons.arrow_back),
            ),
          ),
          SizedBox(height: DeviceInfo.size.height * 0.05),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceInfo.size.height * 0.1);
}
