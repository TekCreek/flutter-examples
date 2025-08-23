// ignore_for_file: sort_child_properties_last, use_build_context_synchronously

import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/post.dart';

class EditPostScreen extends StatefulWidget {
  @override
  State<EditPostScreen> createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  bool loading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final Post post = ModalRoute.of(context)!.settings.arguments as Post;
    _titleController = TextEditingController(text: post.title);
    _descriptionController = TextEditingController(text: post.description);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Post post = ModalRoute.of(context)!.settings.arguments as Post;

    return Scaffold(
      appBar: AppBar(title: Text('Edit Post')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (val) => val!.isEmpty ? "Enter title" : null,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (val) => val!.isEmpty ? "Enter description" : null,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32.0,
                    vertical: 8.0,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      minimumSize: Size(0, 40),
                    ),
                    child: loading
                        ? CircularProgressIndicator()
                        : Text('Update'),
                    onPressed: loading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() => loading = true);
                              await ApiService().updatePost(
                                post.postId,
                                _titleController.text,
                                _descriptionController.text,
                              );
                              setState(() => loading = false);
                              if (mounted) Navigator.pop(context);
                            }
                          },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
