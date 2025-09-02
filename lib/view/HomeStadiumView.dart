import 'package:ballstory_app/common/CommonConfig.dart';
import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:ballstory_app/model/Athlete.dart';
import 'package:ballstory_app/model/HomeStadium.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/HomeStadiumResponse.dart';
import '../repository/HomeStadiumRepository.dart';
import '../widget/CustomAlert.dart';

class HomeStadiumView extends ConsumerStatefulWidget {
  final int stadiumId;

  const HomeStadiumView({super.key, required this.stadiumId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomeStadiumViewState();
  }
}

class _HomeStadiumViewState extends ConsumerState<HomeStadiumView> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ref.read(homaStadiumRepositoryProvider).findOne(widget.stadiumId),
      builder: (BuildContext context, AsyncSnapshot<HomeStadiumResponse> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    _CustomHeader(stadium: snapshot.data!,),
                    _ReviewCard(), // Todo: 스토리 등록, 목록 조회 화면 구현 후 리펙토링
                    const SizedBox(height: 16),
                    _FavoritePlayer(athlete: snapshot.data!.favoriteAthlete,),
                    const SizedBox(height: 8),
                    // 우선 보류
                    // _SongPlayer(),
                  ],
                ),
              ),
              bottomNavigationBar: _BottomBar(),
              // floatingActionButtonLocation:
              //     FloatingActionButtonLocation.miniCenterFloat,
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {},
              //   backgroundColor: Colors.pink[100],
              //   child: Icon(Icons.add, size: 30, color: Colors.black),
              // ),
            );
          }
          else {
            return CustomAlert(
              title: snapshot.error.toString(),
            );
          }
        }
        else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}

// 상단 Header
class _CustomHeader extends StatelessWidget {
  final HomeStadiumResponse stadium;

  const _CustomHeader({required this.stadium});

  @override
  Widget build(BuildContext context) {
    switch (stadium.team) {
      case Team.LG: CommonConfig.mainLogo = CommonConfig.lgLogo;
      break;
      case Team.HANWHA: CommonConfig.mainLogo = CommonConfig.hanhwaLogo;
      break;
      case Team.SAMSUNG: CommonConfig.mainLogo = CommonConfig.samsungLogo;
      break;
      case Team.LOTTE: CommonConfig.mainLogo = CommonConfig.lotteLogo;
      break;
      case Team.KT: CommonConfig.mainLogo = CommonConfig.ktLogo;
      break;
      case Team.KIA: CommonConfig.mainLogo = CommonConfig.kiaLogo;
      break;
      case Team.NC: CommonConfig.mainLogo = CommonConfig.ncLogo;
      break;
      case Team.KIWOOM: CommonConfig.mainLogo = CommonConfig.kioomLogo;
      break;
      case Team.DOOSAN: CommonConfig.mainLogo = CommonConfig.doosanLogo;
      break;
      case Team.SSG: CommonConfig.mainLogo = CommonConfig.ssgLogo;
      break;
    }

    return Container(
      height: 50,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 60,
              child: Container(
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(CommonConfig.mainLogo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Text(stadium.name ?? '', style: TextStyle(fontSize: 25)),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(Icons.edit, size: 30),
          ),
        ],
      ),
    );
  }
}

// 카드 영역
class _ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // TODO : 홈구장에서 가지고있는 스토리 중 최신 스토리 메인 이미지로 적용해야함
            Image.asset('assets/images/story_default_image.jpg'),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "⚾ 일반 리뷰",
                      style: TextStyle(fontSize: 12, color: Colors.green[800]),
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "스토리를 등록하고 홈구장을 꾸며보세요!\n"
                    "꾸며낸 홈구장은 다른 팬들과 함께 공유 쌉가능!!",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 플레이어 정보
class _FavoritePlayer extends StatelessWidget {
  final Athlete athlete;
  const _FavoritePlayer({required this.athlete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: CommonConfig.mainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.white),
                      Icon(Icons.star, color: Colors.white),
                      Icon(Icons.star, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '최애 선수',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(width: 10),
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.white),
                      Icon(Icons.star, color: Colors.white),
                      Icon(Icons.star, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  athlete.imageUrl == null
                  ? Image.asset(
                    '/assets/images/athlete_default.jpg',
                    width: 150,
                    height: 150,
                  )
                  :
                  Image.network(
                    athlete.imageUrl!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.fill,
                    // 로딩/에러 처리
                    loadingBuilder: (ctx, child, progress) =>
                    progress == null ? child : const CircularProgressIndicator(),
                    errorBuilder: (ctx, err, stack) => const Icon(Icons.broken_image),
                  ),
                  SizedBox(height: 5),
                  Text(athlete.name, style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(width: DeviceInfo.size.width * 0.04,),
              athlete.type == AthleteType.PITCHER
              ? _PitcherInfo(athlete: athlete)
              : _HitterInfo(athlete: athlete)
            ],
          ),
          SizedBox(height: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // decoration: BoxDecoration(
                //   color: CommonConfig.mainColor,
                //   borderRadius: BorderRadius.circular(10),
                // ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 6, 5, 10),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/win_badge.png',
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(width: 7),
                      Text(
                        '승요율',
                        style: TextStyle(
                          color: CommonConfig.mainColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              WinRateBarSingle(percent: 68),
            ],
          ),
        ],
      ),
    );
  }
}

class WinRateBarSingle extends StatelessWidget {
  final double percent; // 0 ~ 100

  const WinRateBarSingle({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.grey[300], // 전체 바 배경
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          // 퍼센트 채워진 부분
          FractionallySizedBox(
            widthFactor: percent / 100, // 0.0 ~ 1.0
            child: Container(
              decoration: BoxDecoration(
                color: CommonConfig.mainColor,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          // 퍼센트 텍스트
          Center(
            child: Text(
              '${percent.toStringAsFixed(1)}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 음악 플레이어 바
class _SongPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.yellow[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.play_arrow),
          const SizedBox(width: 12),
          Icon(Icons.list),
          const SizedBox(width: 12),
          Icon(Icons.fast_rewind),
          const SizedBox(width: 12),
          Icon(Icons.fast_forward),
          const SizedBox(width: 16),
          const Expanded(
            child: Text(
              '이대호 화이팅',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// 하단 네비게이션
class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(icon: Icon(Icons.home), onPressed: () {}),
          Container(
            width: 70,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: CommonConfig.mainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: Icon(Icons.add, size: 35, color: Colors.white),
              onPressed: () {},
            ),
          ),
          IconButton(icon: Icon(Icons.person), onPressed: () {}),
        ],
      ),
    );
  }
}

class _PitcherInfo extends StatelessWidget {
  final Athlete athlete;

  const _PitcherInfo({required this.athlete});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '승패 : ${athlete.win}승 ${athlete.loose}패',
            style: TextStyle(fontSize: 20),
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
          ),
          // SizedBox(height: 5),
          Text('구원 : ${athlete.hold}홀드 ${athlete.save}세이브', style: TextStyle(fontSize: 20)),
          // SizedBox(height: 5),
          Text('ERA : ${athlete.era}', style: TextStyle(fontSize: 20)),
          // SizedBox(height: 5),
          Text('WHIP : ${athlete.whip}', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

class _HitterInfo extends StatelessWidget {
  final Athlete athlete;

  const _HitterInfo({required this.athlete});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '타율 : ${athlete.hitAvg == null ? 0.000 : athlete.hitAvg!.toStringAsFixed(3)}',
            style: TextStyle(fontSize: 20),
            textHeightBehavior: TextHeightBehavior(
              applyHeightToFirstAscent: false,
              applyHeightToLastDescent: false,
            ),
          ),
          // SizedBox(height: 5),
          Text('안타 : ${athlete.hitCount}', style: TextStyle(fontSize: 20)),
          // SizedBox(height: 5),
          Text('홈런 : ${athlete.homeRunCount}', style: TextStyle(fontSize: 20)),
          // SizedBox(height: 5),
          Text('타점 : ${athlete.rbi}', style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}

