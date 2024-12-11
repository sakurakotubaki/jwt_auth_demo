import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jwt_auth_demo/features/auth/domain/auth_model.dart';
import 'package:jwt_auth_demo/features/book/domain/book_notifier.dart';

class BookDetailScreen extends ConsumerWidget {
  final int bookId;

  const BookDetailScreen({
    super.key,
    required this.bookId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookAsync = ref.watch(bookProvider(bookId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Details'),
        actions: [
          bookAsync.whenOrNull(
            data: (book) => PopupMenuButton<String>(
              onSelected: (value) async {
                if (value == 'edit') {
                  // TODO: Implement edit functionality
                } else if (value == 'delete') {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Delete Book'),
                      content: const Text('Are you sure you want to delete this book?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Delete'),
                        ),
                      ],
                    ),
                  );

                  if (confirmed == true) {
                    await ref.read(bookNotifierProvider.notifier).deleteBook(bookId);
                    if (context.mounted) {
                      context.pop();
                    }
                  }
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Edit'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Delete'),
                ),
              ],
            ),
          ) ?? const SizedBox(),
        ],
      ),
      body: bookAsync.when(
        data: (book) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                book.title,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                book.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),
              Text(
                'Owner ID: ${book.ownerId}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
