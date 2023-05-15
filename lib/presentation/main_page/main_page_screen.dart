import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/widgets/loading_indicator.dart';
import 'widgets/content.dart';
import 'bloc/main_page_cubit.dart';

class MainPageScreen extends StatelessWidget {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: BlocConsumer<MainPageCubit, MainPageState>(
          listener: (context, state) {
            if (state is MainPageStateFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is MainPageStateLoading) {
              return const LoadingIndicator();
            }
            if (state is MainPageStateSucceed) {
              return Content(models: state.models);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
