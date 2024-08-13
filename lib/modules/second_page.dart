import 'package:flutter/material.dart';
import 'package:web_deep_link/core/navigation/app_navigator.dart';
import 'package:web_deep_link/core/navigation/app_page_route.dart';
import 'package:web_deep_link/modules/third_screen.dart';

class SecondPageRoute extends AppPageRoute<String> {
  @override
  Widget buildPage(BuildContext context, String arguments) {
    return SecondPageWidget(
      firstScreenValue: arguments,
    );
  }

  @override
  String get routePath => '/second-page';
}

class SecondPageWidget extends StatefulWidget {
  const SecondPageWidget({
    required this.firstScreenValue,
    super.key,
  });

  final String firstScreenValue;

  @override
  State<SecondPageWidget> createState() => _SecondPageWidgetState();
}

class _SecondPageWidgetState extends State<SecondPageWidget> {
  late DateTime someValue;

  @override
  void initState() {
    someValue = DateTime.now();
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
              'Second screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Current value: ${someValue.day} / ${someValue.month} / ${someValue.year}',
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: const Text('Update date'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                AppNavigator.pushNamed(
                  '/third-page',
                  arguments: ThirdScreenArguments(
                    firstScreenValue: widget.firstScreenValue,
                    secondScreenValue: someValue,
                  ),
                );
              },
              child: const Text('Go to third screen'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        someValue = picked;
      });
    }
  }
}
