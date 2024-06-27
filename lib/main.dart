import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cores/screens/error_page.dart';
import 'cores/screens/loader.dart';
import 'features/auth/repository/auth_services.dart';
import 'features/auth/screens/login_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: 'YouTube Clone',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: StreamBuilder<User?>(
          stream: ref.watch(authServiceProvider).authStateChanges(),
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(body: Loader());
            } else if (snapshot.hasError) {
              return const ErrorPage();
            } else if (snapshot.hasData) {
              return Scaffold(
                body: Center(
                  child: GestureDetector(
                    onTap: () async =>
                        await ref.read(authServiceProvider).signOut(),
                    child: const Text('Click here to Logout'),
                  ),
                ),
              );
            }
            return const LoginScreen();
          },
        ));
  }
}