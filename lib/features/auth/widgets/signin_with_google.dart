import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/app_images.dart';
import '../repository/auth_services.dart';

class SigninWithGoogleWidget extends ConsumerWidget {
  const SigninWithGoogleWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async => await ref.read(authServiceProvider).signInWithGoogle(ref),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              AppImages.googleLogo,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 8),
            const Text(
              'Sign in with Google',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
