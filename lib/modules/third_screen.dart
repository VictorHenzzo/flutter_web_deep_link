import 'package:flutter/material.dart';
import 'package:web_deep_link/core/navigation/app_navigator.dart';
import 'package:web_deep_link/core/navigation/app_page_route.dart';

class ThirdScreenArguments {
  ThirdScreenArguments({
    required this.firstScreenValue,
    required this.secondScreenValue,
  });

  final String firstScreenValue;
  final DateTime secondScreenValue;
}

class ThirdPageRoute extends AppPageRoute<ThirdScreenArguments> {
  @override
  Widget buildPage(BuildContext context, ThirdScreenArguments arguments) {
    return ThirdPageWidget(
      arguments: arguments,
    );
  }

  @override
  String get routePath => '/third-page';
}

class ThirdPageWidget extends StatelessWidget {
  const ThirdPageWidget({
    required this.arguments,
    super.key,
  });

  final ThirdScreenArguments arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Third screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'First screen argument: ${arguments.firstScreenValue}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 5),
            Text(
              'Second screen argument: ${arguments.secondScreenValue.day} / ${arguments.secondScreenValue.month} / ${arguments.secondScreenValue.year}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AppNavigator.pop();
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
