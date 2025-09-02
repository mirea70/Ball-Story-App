import 'package:ballstory_app/common/DeviceInfo.dart';
import 'package:ballstory_app/view/HomeStadiumCreateView1.dart';
import 'package:ballstory_app/view/HomeStadiumView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: BallStoryApp()));
}

class BallStoryApp extends StatelessWidget {
  const BallStoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    DeviceInfo.init(context);

    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: HomeRedirector(),
    );
  }
}

class HomeRedirector extends ConsumerWidget {
  const HomeRedirector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHomeStadium = ref.watch(homeStadiumExistsProvider);

    return asyncHomeStadium.when(
      data: (exists) {
        if (exists) {
          return const HomeStadiumView(stadiumId: 4,);
        } else {
          return HomeStadiumCreateView1();
        }
      },
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('에러 발생: $e'))),
    );
  }
}

final homeStadiumExistsProvider = FutureProvider<bool>((ref) async {
  final hasHomeStadium = await false; // TODO: API, DB 등에서 확인
  return hasHomeStadium;
});
