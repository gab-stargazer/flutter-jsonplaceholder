import 'package:flutter/material.dart';
import 'package:json_placeholder_album/di/module.dart';
import 'package:json_placeholder_album/domain/model/post.dart';

import '../domain/model/comment.dart';
import '../domain/usecases/comment_usecases.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final CommentUseCases useCases = getIt.get();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Post',
          style: TextStyle(fontWeight: FontWeight.bold)
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  post.body!,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
          const Divider(),
          FutureBuilder<List<Comment>>(
            future: useCases.getCommentsByPostId(1),
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
                return Expanded(
                    child: ListView.separated(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final comment = snapshot.data![index];
                          return ListTile(
                            title: Row(
                              children: [
                                const Icon(Icons.person),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      comment.name!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(comment.email!)
                                  ],
                                )
                              ],
                            ),
                            subtitle: Text(comment.body!,
                                textAlign: TextAlign.justify),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider()));
              } else {
                return const Center(
                  child: Text('Unknown Error Occured'),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
