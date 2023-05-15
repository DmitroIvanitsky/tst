import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/post.dart';
import '../viewModel/user_view_model.dart';
import '../../../domain/models/user.dart';
import '../../../domain/repo/repo.dart';
import '../../navigation.dart';

part 'main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  final Repo repo;
  final Navigation navigation;

  MainPageCubit({required this.repo, required this.navigation}) : super(MainPageStateInitial()) {
    init();
  }


  List<UserViewModel> _mapViewModels (List<User> users, List <Post> posts) {
    List<UserViewModel> userVMs = [];
    for (User user in users){
      userVMs.add(
        UserViewModel.fromUser(user, posts)
      );
    }
    return userVMs;
  }


  Future<void> init() async {
    emit(MainPageStateLoading());
    try {
      print('start');
      List<Post> posts = await repo.fetchPosts();
      List<User> users = await repo.fetchUsers();

      emit(
        MainPageStateSucceed(
          models: _mapViewModels(users, posts)
        )
      );
    } catch (error) {
      emit(MainPageStateFailed(error: error.toString()));
    }
  }
}
