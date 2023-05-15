import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'data/logging_service.dart';
import 'data/network/api_client_impl.dart';
import 'resources/app_theme.dart';
import 'data/repo/local_repo.dart';
import 'data/repo/network_repo.dart';
import 'data/repo/repo_impl.dart';
import 'domain/repo/repo.dart';
import 'presentation/main_page/main_page.dart';
import 'presentation/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  LocalRepo _localRepo = LocalRepo();

  Repo _repo = RepoImpl(
    NetworkRepo(
      ApiClientImpl(
        loggingService: LoggingService(
          _localRepo,
          isLoggingEnabled: true
        )
      )
    ),
    _localRepo
  );

  runApp(
    EasyLocalization(
      supportedLocales: [
        const Locale('en'),
        const Locale('ar'),
      ],
      path: 'assets/languages',
      fallbackLocale: const Locale('en'),
      child: App(
        repo: _repo,
      )
    )
  );
}


class App extends StatelessWidget {
  App({required this.repo});

  final Repo repo;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.theme,
        localizationsDelegates:context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider<Repo>(create: (context) => repo),
            RepositoryProvider<Navigation>(create: (context) => Navigation()),
          ],
          child: MainPage(),
        )
    );
  }
}
