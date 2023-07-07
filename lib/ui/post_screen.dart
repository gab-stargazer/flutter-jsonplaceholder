import 'package:flutter/material.dart';
import 'package:json_placeholder_album/di/module.dart';
import 'package:json_placeholder_album/domain/usecases/post_usecases.dart';
import 'package:json_placeholder_album/ui/comment_screen.dart';

import '../domain/model/post.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostUseCases useCases = getIt.get();

    void navigateToCommentsScreen(Post post) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CommentScreen(post: post)));
    }

    return Scaffold(
        appBar: AppBar(
          title: const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.chat_bubble_outline_outlined),
              SizedBox(width: 8),
              Text('Post Screen', style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        body: FutureBuilder<List<Post>>(
            future: useCases.getPost(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Column(
                    children: [
                      Text('Error: ${snapshot.error}'),
                      const FilledButton(onPressed: null, child: Text('Retry'))
                    ],
                  ),
                );
              } else if (snapshot.hasData) {
                return ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final post = snapshot.data![index];
                      return ListTile(
                          onTap: () => navigateToCommentsScreen(post),
                          title: Text(
                            post.title ?? 'Unknown',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(post.body ?? 'Unknown',
                              textAlign: TextAlign.justify),
                          trailing: const Icon(Icons.arrow_right));
                    },
                    separatorBuilder: (context, index) => const Divider());
              } else {
                return const Center(
                  child: Text('Something wrong'),
                );
              }
            }));
  }
}
