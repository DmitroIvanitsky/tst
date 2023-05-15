import '../../../domain/models/post.dart';
import '../../../domain/models/user.dart';

class UserViewModel {
  final int albumId;
  final int userId;
  final String name;
  final String url;
  final String thumbnailUrl;
  List<Post> uniquePosts;
  int duplicatePostsCount;

  UserViewModel({
    required this.albumId,
    required this.userId,
    required this.name,
    required this.url,
    required this.thumbnailUrl,
    required this.uniquePosts,
    required this.duplicatePostsCount
  });

  factory UserViewModel.fromUser(User user, List<Post> posts) {
    UserViewModel model = UserViewModel(
        albumId: user.albumId,
        userId: user.userId,
        name: user.name,
        url: user.url,
        thumbnailUrl: user.thumbnailUrl,
        uniquePosts: [],
        duplicatePostsCount: 0
    );

    for (Post p in posts){
      if (p.userId == model.userId){
        if (!model.uniquePosts.contains(p)){
          model.uniquePosts.add( //deep cloning
            Post(userId: p.userId, id: p.id, title: p.title, body: p.body)
          );
        } else {
          model.duplicatePostsCount++;
        }
      }
    }

    return model;
  }
}