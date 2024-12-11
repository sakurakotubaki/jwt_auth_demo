import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_auth_demo/features/auth/domain/auth_notifier.dart';

class BookListScreen extends ConsumerWidget {
  const BookListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Book ${index + 1}'),
            subtitle: Text('Author ${index + 1}'),
            leading: const Icon(Icons.book),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle book selection
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle adding new book
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
