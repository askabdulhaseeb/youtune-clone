import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cores/widgets/youtube_logo.dart';
import '../widgets/signin_with_google.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const YoutubeLogo(size: 32),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: FittedBox(
                child: Text(
                  'Welcome To Youtube',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),
            SigninWithGoogleWidget(),
          ],
        ),
      ),
    );
  }
}
