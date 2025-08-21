import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/post.dart';

class PostsScreen extends StatefulWidget {
  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Post> posts = [];
  bool loading = true;

  void fetchPosts() async {
    try {
      List<Post> fetched = await ApiService().fetchPosts();
      setState(() {
        posts = fetched;
        loading = false;
      });
    } catch (e) {
      // Unauthorized redirect handled in ApiService._handleUnauthorized()
      setState(() => loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  void deletePost(int postId) async {
    await ApiService().deletePost(postId);
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Posts')),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Dismissible(
                  key: Key(post.postId.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    deletePost(post.postId);
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text("Post deleted")));
                  },
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/edit_post',
                        arguments: post,
                      ).then((_) => fetchPosts());
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/create_post',
          ).then((_) => fetchPosts());
        },
      ),
    );
  }
}
