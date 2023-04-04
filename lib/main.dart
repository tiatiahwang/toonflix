import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Colors.red,
          ),
        ),
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFF4EDDB),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showTitle ? const MyLargeTitle() : const Text('nothing to see'),
            IconButton(
              onPressed: toggleTitle,
              icon: const Icon(Icons.remove_red_eye_rounded),
            )
          ],
        )),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({
    super.key,
  });

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  @override
  void initState() {
    // 부모 요소에 의존하는 데이터를 초기화해야 하는 경우나 API 불러올때 사용
    // 항!상! build 메서드보다 먼저 호출되어야 함
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    // 위젯이 스크린에서 제거될 때 호출되는 메서드(화면에서 사라질 때)
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    // BuildContext: 상위 요소 데이터에 접근할 수 있게 해줌
    print('build');
    return Text(
      'My Large Title',
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(context).textTheme.titleLarge?.color,
      ),
    );
  }
}
