import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:jwt_auth_demo/features/auth/domain/auth_notifier.dart';
import 'package:jwt_auth_demo/features/auth/presentation/login_screen.dart';
import 'package:jwt_auth_demo/features/auth/presentation/register_screen.dart';
import 'package:jwt_auth_demo/features/book/presentation/book_list_screen.dart';
import 'package:jwt_auth_demo/features/book/presentation/book_detail_screen.dart';

part 'router.g.dart';

@riverpod
GoRouter router(Ref ref) {
  final authState = ref.watch(authNotifierProvider);
  
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoggedIn = authState.value != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final isRegistering = state.matchedLocation == '/register';

      if (!isLoggedIn && !isLoggingIn && !isRegistering) {
        return '/login';
      }

      if (isLoggedIn && (isLoggingIn || isRegistering)) {
        return '/books';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/books',
        builder: (context, state) => const BookListScreen(),
      ),
      GoRoute(
        path: '/books/:id',
        builder: (context, state) {
          final bookId = int.parse(state.pathParameters['id']!);
          return BookDetailScreen(bookId: bookId);
        },
      ),
    ],
  );
}
