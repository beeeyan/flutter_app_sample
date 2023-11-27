import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PullDownPage extends StatelessWidget {
  const PullDownPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'プルダウン',
            ),
            Gap(20),
            Text(
              'プルダウン',
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
