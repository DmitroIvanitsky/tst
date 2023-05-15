import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repo/repo.dart';
import '../navigation.dart';
import 'bloc/main_page_cubit.dart';
import 'main_page_screen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainPageCubit(repo: RepositoryProvider.of<Repo>(context), navigation: RepositoryProvider.of<Navigation>(context)),
      child: const MainPageScreen(),
    );
  }
}
