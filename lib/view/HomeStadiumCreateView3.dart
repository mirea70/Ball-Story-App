import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:ballstory_app/view/HomeStadiumView.dart';
import 'package:ballstory_app/view_model/homestadium/HomeStadiumViewModel.dart';
import 'package:ballstory_app/widget/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/CustomAlert.dart';
import '../widget/CustomButton.dart';

class HomeStadiumCreateView3 extends ConsumerStatefulWidget {
  const HomeStadiumCreateView3({super.key});

  @override
  ConsumerState<HomeStadiumCreateView3> createState() =>
      _HomeStadiumCreateView3State();
}

class _HomeStadiumCreateView3State
    extends ConsumerState<HomeStadiumCreateView3> {
  @override
  Widget build(BuildContext context) {
    final homeStadium = ref.watch(homeStadiumNotifierProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(step: 3, totalStep: 3),
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
                              '최애선수 설정',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.01),
                            Text(
                              '팀에서 가장 좋아하는 나의 최애선수를 골라주세요!',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.015),
                            Container(
                              width: DeviceInfo.size.width * 0.8,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                      DeviceInfo.size.width * 0.03,
                                      DeviceInfo.size.height * 0.01,
                                      0,
                                      DeviceInfo.size.height * 0.01,
                                    ),
                                    child: Text(
                                      'data',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  Expanded(child: SizedBox()),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: DeviceInfo.size.width * 0.03,
                                    ),
                                    child: Icon(Icons.arrow_downward_rounded),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.02),
                            Image.asset(
                              'assets/images/mostlikeplayer_defalt.jpg',
                              width: DeviceInfo.size.width * 0.8,
                              height: DeviceInfo.size.height * 0.35,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.012),
                            Padding(
                              padding: EdgeInsets.only(left: DeviceInfo.size.width * 0.33),
                              child: Text(
                                '폰세',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.03),
                            Container(
                              padding: EdgeInsets.only(right: DeviceInfo.size.width * 0.16),
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
                                                SizedBox(width: DeviceInfo.size.width * 0.015,),
                                                Text(
                                                  '승패 : ',
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                                ),
                                                Text(
                                                  '15승 0패',
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Expanded(child: SizedBox()),
                                          Text(
                                            '●',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(width: DeviceInfo.size.width * 0.015,),
                                          Text(
                                            'ERA : ',
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '2.53',
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                          ),
                                        ]
                                    ),
                                    SizedBox(height: DeviceInfo.size.height * 0.015,),
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
                                                SizedBox(width: DeviceInfo.size.width * 0.015,),
                                                Text(
                                                  'WHIP : ',
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                                ),
                                                Text(
                                                  '1.12',
                                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                          // Expanded(child: SizedBox()),
                                          Text(
                                            '●',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                          SizedBox(width: DeviceInfo.size.width * 0.015,),
                                          Text(
                                            'WAR : ',
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            '4.52',
                                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                                          ),
                                        ]
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        ),
                      ),
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
                                  builder: (context) =>
                                      HomeStadiumView(),
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
                          title: '홈구장 생성',
                          isEnabled: true, // TODO: 홈구장명 중복 체크
                          // viewModel.loginName != '' &&
                          // errorViewModel.getLoginNameError() == null,
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
