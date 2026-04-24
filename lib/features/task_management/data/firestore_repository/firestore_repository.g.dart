// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(firestoreRepository)
final firestoreRepositoryProvider = FirestoreRepositoryProvider._();

final class FirestoreRepositoryProvider
    extends
        $FunctionalProvider<
          FirestoreRepository,
          FirestoreRepository,
          FirestoreRepository
        >
    with $Provider<FirestoreRepository> {
  FirestoreRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'firestoreRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$firestoreRepositoryHash();

  @$internal
  @override
  $ProviderElement<FirestoreRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FirestoreRepository create(Ref ref) {
    return firestoreRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FirestoreRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FirestoreRepository>(value),
    );
  }
}

String _$firestoreRepositoryHash() =>
    r'95c1c445734f56d18e7408d875baf5988563dc72';

@ProviderFor(loadComplateTask)
final loadComplateTaskProvider = LoadComplateTaskFamily._();

final class LoadComplateTaskProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TaskModel>>,
          List<TaskModel>,
          Stream<List<TaskModel>>
        >
    with $FutureModifier<List<TaskModel>>, $StreamProvider<List<TaskModel>> {
  LoadComplateTaskProvider._({
    required LoadComplateTaskFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadComplateTaskProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadComplateTaskHash();

  @override
  String toString() {
    return r'loadComplateTaskProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<TaskModel>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TaskModel>> create(Ref ref) {
    final argument = this.argument as String;
    return loadComplateTask(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadComplateTaskProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadComplateTaskHash() => r'9bfc4793279563e0677325661024ec6b874218a4';

final class LoadComplateTaskFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<TaskModel>>, String> {
  LoadComplateTaskFamily._()
    : super(
        retry: null,
        name: r'loadComplateTaskProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadComplateTaskProvider call(String userId) =>
      LoadComplateTaskProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadComplateTaskProvider';
}

@ProviderFor(loadInComplateTask)
final loadInComplateTaskProvider = LoadInComplateTaskFamily._();

final class LoadInComplateTaskProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TaskModel>>,
          List<TaskModel>,
          Stream<List<TaskModel>>
        >
    with $FutureModifier<List<TaskModel>>, $StreamProvider<List<TaskModel>> {
  LoadInComplateTaskProvider._({
    required LoadInComplateTaskFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadInComplateTaskProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadInComplateTaskHash();

  @override
  String toString() {
    return r'loadInComplateTaskProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<TaskModel>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TaskModel>> create(Ref ref) {
    final argument = this.argument as String;
    return loadInComplateTask(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadInComplateTaskProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadInComplateTaskHash() =>
    r'156f709ac67ec6dc4863d7a7b97ac7d5a4f90a8a';

final class LoadInComplateTaskFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<TaskModel>>, String> {
  LoadInComplateTaskFamily._()
    : super(
        retry: null,
        name: r'loadInComplateTaskProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadInComplateTaskProvider call(String userId) =>
      LoadInComplateTaskProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadInComplateTaskProvider';
}

@ProviderFor(loadTask)
final loadTaskProvider = LoadTaskFamily._();

final class LoadTaskProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<TaskModel>>,
          List<TaskModel>,
          Stream<List<TaskModel>>
        >
    with $FutureModifier<List<TaskModel>>, $StreamProvider<List<TaskModel>> {
  LoadTaskProvider._({
    required LoadTaskFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'loadTaskProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$loadTaskHash();

  @override
  String toString() {
    return r'loadTaskProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<TaskModel>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<TaskModel>> create(Ref ref) {
    final argument = this.argument as String;
    return loadTask(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadTaskProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$loadTaskHash() => r'22bced6bf13c766ebec7e23e917fd3e3142c33d9';

final class LoadTaskFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<TaskModel>>, String> {
  LoadTaskFamily._()
    : super(
        retry: null,
        name: r'loadTaskProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  LoadTaskProvider call(String userId) =>
      LoadTaskProvider._(argument: userId, from: this);

  @override
  String toString() => r'loadTaskProvider';
}
