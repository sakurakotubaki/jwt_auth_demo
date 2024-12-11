// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dioHash() => r'fd92ac7a30648628e4702114b8e907429fc60c1e';

/// See also [dio].
@ProviderFor(dio)
final dioProvider = AutoDisposeProvider<Dio>.internal(
  dio,
  name: r'dioProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dioHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DioRef = AutoDisposeProviderRef<Dio>;
String _$authNotifierHash() => r'928dcb44e67e67931be5fecd43108dac774598d5';

/// See also [AuthNotifier].
@ProviderFor(AuthNotifier)
final authNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AuthNotifier, User?>.internal(
  AuthNotifier.new,
  name: r'authNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthNotifier = AutoDisposeAsyncNotifier<User?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
