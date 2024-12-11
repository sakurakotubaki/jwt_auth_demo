import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_auth_demo/core/providers/api_client_provider.dart';
import 'package:jwt_auth_demo/features/auth/domain/auth_model.dart';
import 'package:jwt_auth_demo/core/api/api_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'book_notifier.g.dart';

@riverpod
Future<Book> book(Ref ref, int id) async {
  try {
    final client = ApiClient(ref.read(apiClientProvider));
    return await client.getBook(id);
  } catch (e) {
    throw Exception('Failed to load book: $e');
  }
}

@riverpod
class BookNotifier extends _$BookNotifier {
  ApiClient get _client => ApiClient(ref.read(apiClientProvider));

  @override
  Future<List<Book>> build() async {
    return getBooks();
  }

  Future<List<Book>> getBooks() async {
    try {
      return await _client.getBooks();
    } catch (e) {
      throw Exception('Failed to load books: $e');
    }
  }

  Future<Book> createBook(String title, String description) async {
    try {
      final response = await _client.createBook({
        'title': title,
        'description': description,
      });
      
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => getBooks());
      
      return response;
    } catch (e) {
      throw Exception('Failed to create book: $e');
    }
  }

  Future<void> deleteBook(int id) async {
    try {
      await _client.deleteBook(id);
      
      state = const AsyncValue.loading();
      state = await AsyncValue.guard(() => getBooks());
    } catch (e) {
      throw Exception('Failed to delete book: $e');
    }
  }
}
