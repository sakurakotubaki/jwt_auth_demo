// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$bookHash() => r'd5ff71ca05d9f696310c83141264e10f59432388';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [book].
@ProviderFor(book)
const bookProvider = BookFamily();

/// See also [book].
class BookFamily extends Family<AsyncValue<Book>> {
  /// See also [book].
  const BookFamily();

  /// See also [book].
  BookProvider call(
    int id,
  ) {
    return BookProvider(
      id,
    );
  }

  @override
  BookProvider getProviderOverride(
    covariant BookProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'bookProvider';
}

/// See also [book].
class BookProvider extends AutoDisposeFutureProvider<Book> {
  /// See also [book].
  BookProvider(
    int id,
  ) : this._internal(
          (ref) => book(
            ref as BookRef,
            id,
          ),
          from: bookProvider,
          name: r'bookProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$bookHash,
          dependencies: BookFamily._dependencies,
          allTransitiveDependencies: BookFamily._allTransitiveDependencies,
          id: id,
        );

  BookProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<Book> Function(BookRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: BookProvider._internal(
        (ref) => create(ref as BookRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Book> createElement() {
    return _BookProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is BookProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin BookRef on AutoDisposeFutureProviderRef<Book> {
  /// The parameter `id` of this provider.
  int get id;
}

class _BookProviderElement extends AutoDisposeFutureProviderElement<Book>
    with BookRef {
  _BookProviderElement(super.provider);

  @override
  int get id => (origin as BookProvider).id;
}

String _$bookNotifierHash() => r'f150b1747c582a16c31c23cf24d5aa82c6ce9ae1';

/// See also [BookNotifier].
@ProviderFor(BookNotifier)
final bookNotifierProvider =
    AutoDisposeAsyncNotifierProvider<BookNotifier, List<Book>>.internal(
  BookNotifier.new,
  name: r'bookNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$bookNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$BookNotifier = AutoDisposeAsyncNotifier<List<Book>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
