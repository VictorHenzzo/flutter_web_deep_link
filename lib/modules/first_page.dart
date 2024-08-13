import 'package:flutter/material.dart';
import 'package:web_deep_link/core/navigation/app_navigator.dart';
import 'package:web_deep_link/core/navigation/app_page_route.dart';

class FirstPageRoute extends AppPageRoute {
  @override
  Widget buildPage(BuildContext context, Object? arguments) {
    return const FirstPageWidget();
  }

  @override
  String get routePath => '/first-page';
}

class FirstPageWidget extends StatefulWidget {
  const FirstPageWidget({super.key});

  @override
  State<FirstPageWidget> createState() => _FirstPageWidgetState();
}

class _FirstPageWidgetState extends State<FirstPageWidget> {
  late String someValue;

  @override
  void initState() {
    someValue = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'First screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Current value: $someValue',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    someValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AppNavigator.pushNamed('/second-page', arguments: someValue);
              },
              child: const Text('Go to second screen'),
            ),
          ],
        ),
      ),
    );
  }
}
