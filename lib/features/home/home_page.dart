import 'package:flutter/material.dart';

import '../../cores/widgets/youtube_logo.dart';
import '../../utilities/app_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const YoutubeLogo(),
        actions: <Widget>[
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppImages.search, height: 24),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppImages.notification, height: 24),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppImages.cast, height: 24),
            ),
          ),
        ],
      ),
    );
  }
}
