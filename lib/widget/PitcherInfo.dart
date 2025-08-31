import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:flutter/material.dart';

class PitcherInfo extends StatelessWidget {
  final int win;
  final int loose;
  final int hold;
  final int save;
  final double era;
  final double whip;

  const PitcherInfo({super.key,
    required this.win, required this.loose, required this.hold, required this.save,
    required this.era, required this.whip,
  });

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
                width: DeviceInfo.size.width * 0.45,
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
                      '승패 : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$win승 $loose패',
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
                '$hold홀드 $save세이브',
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
                width: DeviceInfo.size.width * 0.45,
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
                      'ERA : ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      era.toStringAsFixed(2),
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
                'WHIP : ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                whip.toStringAsFixed(1),
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
