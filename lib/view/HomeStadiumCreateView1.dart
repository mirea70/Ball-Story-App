import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:ballstory_app/view_model/homestadium/HomeStadiumErrorViewModel.dart';
import 'package:ballstory_app/view_model/homestadium/HomeStadiumViewModel.dart';
import 'package:ballstory_app/widget/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/CustomAlert.dart';
import '../widget/CustomButton.dart';
import '../widget/CustomInput.dart';
import 'HomeStadiumCreateView2.dart';

class HomeStadiumCreateView1 extends ConsumerStatefulWidget {
  const HomeStadiumCreateView1({super.key});

  @override
  ConsumerState<HomeStadiumCreateView1> createState() =>
      _HomeStadiumCreateView1State();
}

class _HomeStadiumCreateView1State
    extends ConsumerState<HomeStadiumCreateView1> {
  @override
  Widget build(BuildContext context) {
    final homeStadium = ref.watch(homeStadiumNotifierProvider);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: CustomAppBar(step: 1, totalStep: 3),
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
                              '홈구장명 설정',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.01),
                            Text(
                              '나만의 홈구장에서 이름으로 사용할 홈구장명을 입력해주세요.',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.1),
                            CustomInput(
                              onChangeMethod: (value) => ref
                                  .read(homeStadiumNotifierProvider.notifier)
                                  .setName(value),
                              hintText: '홈구장명을 입력해주세요.',
                              errorText: ref
                                  .read(homeStadiumCreateErrorProvider.notifier)
                                  .getNameErrorMsg(),
                              maxLength: 20,
                              text: homeStadium.name,
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
                                      HomeStadiumCreateView2(),
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
