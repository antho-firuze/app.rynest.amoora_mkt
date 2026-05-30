// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_ctrl.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(notificationCount)
final notificationCountProvider = NotificationCountProvider._();

final class NotificationCountProvider
    extends $FunctionalProvider<AsyncValue<int>, int, Stream<int>>
    with $FutureModifier<int>, $StreamProvider<int> {
  NotificationCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationCountProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationCountHash();

  @$internal
  @override
  $StreamProviderElement<int> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<int> create(Ref ref) {
    return notificationCount(ref);
  }
}

String _$notificationCountHash() => r'63fa8c5161f4814b8ec1c9742273d84db4dbea1f';

@ProviderFor(notificationCtrl)
final notificationCtrlProvider = NotificationCtrlProvider._();

final class NotificationCtrlProvider
    extends
        $FunctionalProvider<
          NotificationCtrl,
          NotificationCtrl,
          NotificationCtrl
        >
    with $Provider<NotificationCtrl> {
  NotificationCtrlProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationCtrlProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationCtrlHash();

  @$internal
  @override
  $ProviderElement<NotificationCtrl> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NotificationCtrl create(Ref ref) {
    return notificationCtrl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationCtrl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationCtrl>(value),
    );
  }
}

String _$notificationCtrlHash() => r'ceec41c8139a137761fbf9546d521a83eccf8ee1';
