import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_placeholder_album/di/module.dart';
import 'package:json_placeholder_album/domain/usecases/post_usecases.dart';

import '../domain/model/post.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostUseCases useCases = getIt.get();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Post Screen'),
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
                    title: Text(post.title ?? 'Unknown'),
                    subtitle: Text(post.body ?? 'Unknown'),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              );
            } else {
              return const Center(
                child: Text('Something wrong'),
              );
            }
          },
        ));
  }
}
