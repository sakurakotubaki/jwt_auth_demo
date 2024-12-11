import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_auth_demo/features/auth/domain/auth_notifier.dart';
import 'package:jwt_auth_demo/features/book/domain/book_notifier.dart';

class BookListScreen extends ConsumerStatefulWidget {
  const BookListScreen({super.key});

  @override
  ConsumerState<BookListScreen> createState() => _BookListScreenState();
}

class _BookListScreenState extends ConsumerState<BookListScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showAddBookDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Book'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (_titleController.text.isNotEmpty &&
                  _descriptionController.text.isNotEmpty) {
                await ref.read(bookNotifierProvider.notifier).createBook(
                      _titleController.text,
                      _descriptionController.text,
                    );
                _titleController.clear();
                _descriptionController.clear();
                if (context.mounted) context.pop();
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(bookNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Books'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authNotifierProvider.notifier).logout();
            },
          ),
        ],
      ),
      body: books.when(
        data: (books) => ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            final book = books[index];
            return ListTile(
              title: Text(book.title),
              subtitle: Text(book.description),
              onTap: () => context.go('/books/${book.id}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  ref.read(bookNotifierProvider.notifier).deleteBook(book.id);
                },
              ),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddBookDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
