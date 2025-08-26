import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:ballstory_app/model/HomeStadium.dart';
import 'package:ballstory_app/view_model/homestadium/HomeStadiumViewModel.dart';
import 'package:ballstory_app/widget/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/CustomAlert.dart';
import '../widget/CustomButton.dart';
import 'HomeStadiumCreateView3.dart';

class HomeStadiumCreateView2 extends ConsumerStatefulWidget {
  const HomeStadiumCreateView2({super.key});

  @override
  ConsumerState<HomeStadiumCreateView2> createState() =>
      _HomeStadiumCreateView2State();
}

class _HomeStadiumCreateView2State
    extends ConsumerState<HomeStadiumCreateView2> {
  @override
  Widget build(BuildContext context) {
    final homeStadium = ref.watch(homeStadiumNotifierProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(step: 2, totalStep: 3),
        body: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: DeviceInfo.size.width * 0.05,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '응원팀 설정',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.01),
                            Text(
                              '응원하는 구단을 골라주세요!',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.03),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_doosan.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        '두산',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.DOOSAN,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: DeviceInfo.size.height * 0.02,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_lotte.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        '롯데',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.LOTTE,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: DeviceInfo.size.height * 0.02,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_samsung.jpg',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        '삼성',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.SAMSUNG,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: DeviceInfo.size.height * 0.02,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_kioom.jpg',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        '키움',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.KIWOOM,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: DeviceInfo.size.height * 0.02,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_hanhwa.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        '한화',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.HANWHA,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: DeviceInfo.size.height * 0.02,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_kia.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        '기아',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.KIA,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: DeviceInfo.size.height * 0.02,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_kt.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        'KT',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.KT,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: DeviceInfo.size.height * 0.02,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_lg.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        'LG',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.LG,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: DeviceInfo.size.height * 0.02,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_nc.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        'NC',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.NC,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: DeviceInfo.size.height * 0.02,),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_ssg.png',
                                      width: 70,
                                      height: 70,
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.03),
                                      child: Text(
                                        'SSG',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Padding(
                                      padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.04),
                                      child: Radio(
                                        value: Team.SSG,
                                        groupValue: homeStadium.team,
                                        onChanged: (Team? value) {
                                          if(value != null) {
                                            ref.read(homeStadiumNotifierProvider.notifier,).setTeam(value);
                                          }
                                        },
                                        activeColor: Colors.pinkAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: DeviceInfo.size.height * 0.04,),
                      Expanded(child: SizedBox()),
                      Center(
                        child: CustomButton(
                          onTapMethod: () async {
                            final validateResult = await ref
                                .read(homeStadiumNotifierProvider.notifier)
                                .validateDuplicatedName();
                            validateResult.when(
                              data: (_) => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeStadiumCreateView3(),
                                ),
                              ),
                              error: (error, stackTrace) => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  List<String> errorArr = '$error'.split('||');
                                  return CustomAlert(
                                    title: errorArr[0],
                                    content: errorArr[1],
                                  );
                                },
                              ),
                              loading: () => CircularProgressIndicator(),
                            );
                          },
                          title: '다음',
                          isEnabled: homeStadium.team != null,
                        ),
                      ),
                      SizedBox(
                        height:
                            DeviceInfo.padding.bottom +
                            DeviceInfo.size.height * 0.03,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
