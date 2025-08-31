import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:flutter/material.dart';

class Hitterinfo extends StatelessWidget {
  final double hitAvg;
  final int hitCount;
  final int homeRunCount;
  final int rbi;

  const Hitterinfo({super.key,
    required this.hitAvg, required this.hitCount, required this.homeRunCount, required this.rbi});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: DeviceInfo.size.width * 0.16,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: DeviceInfo.size.width * 0.5,
                child: Row(
                  children: [
                    Text(
                      '●',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      width:
                      DeviceInfo.size.width * 0.015,
                    ),
                    Text(
                      '타율 : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      hitAvg.toStringAsFixed(3),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(child: SizedBox()),
              Text('●', style: TextStyle(fontSize: 14)),
              SizedBox(
                width: DeviceInfo.size.width * 0.015,
              ),
              Text(
                '안타 : ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$hitCount',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(
            height: DeviceInfo.size.height * 0.015,
          ),
          Row(
            children: [
              SizedBox(
                width: DeviceInfo.size.width * 0.5,
                child: Row(
                  children: [
                    Text(
                      '●',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      width:
                      DeviceInfo.size.width * 0.015,
                    ),
                    Text(
                      '홈런 : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$homeRunCount',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(child: SizedBox()),
              Text('●', style: TextStyle(fontSize: 14)),
              SizedBox(
                width: DeviceInfo.size.width * 0.015,
              ),
              Text(
                '타점 : ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '$rbi',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
