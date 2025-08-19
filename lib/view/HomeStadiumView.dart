import 'dart:io';

import 'package:ballstory_app/common/CommonConfig.dart';
import 'package:flutter/material.dart';

class HomeStadiumView extends StatelessWidget {
  const HomeStadiumView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _CustomHeader(),
            _ReviewCard(),
            const SizedBox(height: 16),
            _FavoritePlayer(),
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
}

// 상단 Header
class _CustomHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          Text('홈구장명', style: TextStyle(fontSize: 25)),
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
// TODO: 선수 타입 별로 노출되는 선수성적이 달라짐 (투수, 타자)
// TODO: 선수 데이터에 따라 이미지, 성적 동적으로 노출하도록 구현 필요
class _FavoritePlayer extends StatelessWidget {
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
                  Image.asset(
                    'assets/images/mostlikeplayer_defalt.jpg',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(height: 5),
                  Text('폰세', style: TextStyle(fontSize: 20)),
                ],
              ),
              SizedBox(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '승패 : 12승 0패',
                      style: TextStyle(fontSize: 20),
                      textHeightBehavior: TextHeightBehavior(
                        applyHeightToFirstAscent: false,
                        applyHeightToLastDescent: false,
                      ),
                    ),
                    // SizedBox(height: 5),
                    Text('ERA : 1.96', style: TextStyle(fontSize: 20)),
                    // SizedBox(height: 5),
                    Text('WAR : 5.32', style: TextStyle(fontSize: 20)),
                    // SizedBox(height: 5),
                    Text('WHIP : 0.65', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
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
