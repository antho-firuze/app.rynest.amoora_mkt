// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(productList)
final productListProvider = ProductListProvider._();

final class ProductListProvider
    extends $AsyncNotifierProvider<productList, List<int>> {
  ProductListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productListHash();

  @$internal
  @override
  productList create() => productList();
}

String _$productListHash() => r'ba58646b43d721dc247c0226c6b9821e24408526';

abstract class _$productList extends $AsyncNotifier<List<int>> {
  FutureOr<List<int>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<int>>, List<int>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<int>>, List<int>>,
              AsyncValue<List<int>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
