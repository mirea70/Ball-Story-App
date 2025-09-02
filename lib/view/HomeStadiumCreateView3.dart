import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:ballstory_app/model/Athlete.dart';
import 'package:ballstory_app/view/HomeStadiumView.dart';
import 'package:ballstory_app/view_model/athlete/AthleteViewModel.dart';
import 'package:ballstory_app/view_model/homestadium/HomeStadiumViewModel.dart';
import 'package:ballstory_app/widget/CustomAppBar.dart';
import 'package:ballstory_app/widget/HitterInfo.dart';
import 'package:ballstory_app/widget/PitcherInfo.dart';
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
  bool _expanded = false;
  Athlete? _selected;

  @override
  Widget build(BuildContext context) {
    final homeStadium = ref.watch(homeStadiumNotifierProvider);
    final athletes = ref.watch(athleteAsyncNotifierProvider);

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
                            GestureDetector(
                              onTap: () {
                                setState(() => _expanded = !_expanded);
                              },
                              child: Container(
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
                                        _selected == null
                                            ? '선수를 선택해주세요.'
                                            : _selected!.name,
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
                            ),
                            AnimatedSize(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              child: !_expanded
                                  ? const SizedBox.shrink()
                                  : Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Container(
                                        width: DeviceInfo.size.width * 0.8,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.black12,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: athletes.when(
                                          data: (items) => _buildTable(items, DeviceInfo.size.width * 0.8),
                                          error: (e, _) => SizedBox(
                                            height: 160,
                                            child: Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text('불러오기 실패: $e'),
                                                  const SizedBox(height: 8),
                                                  OutlinedButton(
                                                    onPressed: () {},
                                                    child: const Text('다시 시도'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          loading: () => const SizedBox(
                                            height: 160,
                                            child: Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.02),
                            (_selected == null || _selected!.imageUrl == null)
                            ?
                            Image.asset(
                              'assets/images/athlete_default.jpg',
                              width: DeviceInfo.size.width * 0.8,
                              height: DeviceInfo.size.height * 0.35,
                              fit: BoxFit.fill,
                            )
                            : Image.network(
                              _selected!.imageUrl!,
                              width: DeviceInfo.size.width * 0.8,
                              height: DeviceInfo.size.height * 0.35,
                              fit: BoxFit.fill,
                              // 로딩/에러 처리
                              loadingBuilder: (ctx, child, progress) =>
                              progress == null ? child : const CircularProgressIndicator(),
                              errorBuilder: (ctx, err, stack) => const Icon(Icons.broken_image),
                              // TODO: 성능(리사이즈 캐시)
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.012),
                            Padding(
                              padding: EdgeInsets.only(
                                left: DeviceInfo.size.width * 0.33,
                              ),
                              child: Text(
                                _selected?.name ?? '선수명',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: DeviceInfo.size.height * 0.03),
                            _selected == null
                            ? PitcherInfo(
                                win: 0,
                                loose: 0,
                                hold: 0,
                                save: 0,
                                era: 0.00,
                                whip: 0.0
                            )
                            : _selected!.type == AthleteType.PITCHER
                            ? PitcherInfo(
                                win: _selected?.win ?? 0,
                                loose: _selected?.loose ?? 0,
                                hold: _selected?.hold ??0,
                                save: _selected?.save ?? 0,
                                era: _selected?.era ?? 0.00,
                                whip: _selected?.whip ?? 0.0
                            ) :
                            Hitterinfo(
                                hitAvg: _selected?.hitAvg ?? 0.000,
                                hitCount: _selected?.hitCount ?? 0,
                                homeRunCount: _selected?.homeRunCount ?? 0,
                                rbi: _selected?.rbi ?? 0
                            )
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: DeviceInfo.size.height * 0.05),
                          child: CustomButton(
                            onTapMethod: () async {
                              final registerResult = await ref.read(homeStadiumNotifierProvider.notifier).register();
                              registerResult.when(
                                data: (int stadiumId) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeStadiumView(stadiumId: stadiumId,), // Todo: 회원가입/로그인 구현후 현재 로그인 중인 계정의 ID로 변경
                                    ),
                                  );
                                },
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
                            isEnabled: _selected != null,
                          ),
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

  Widget _buildTable(List<Athlete> items, double parentWidth) {
    return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: parentWidth),
            child: DataTable(
              showCheckboxColumn: false,
              columns: const [
                DataColumn(label: Text('포지션')),
                DataColumn(label: Text('이름')),
              ],
              rows: items.map((a) {
                return DataRow(
                  onSelectChanged: (_) {
                    setState(() {
                      _selected = a;
                      _expanded = false; // 선택 후 닫기 (원치 않으면 제거)
                    });
                    // 필요 시 외부 상태에도 반영:
                    ref.read(homeStadiumNotifierProvider.notifier).setFavoriteAthleteCode(a.code);
                  },
                  cells: [
                    DataCell(Text(a.type.label)),
                    DataCell(Text(a.name)),
                  ],
                );
              }).toList(),
            ),
          ),
        );
  }
}
