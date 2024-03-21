// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpodservice.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$weatherRepositoryHash() => r'e406ca4f389bfe48dbf297ee8184e61b75f07f88';

/// See also [weatherRepository].
@ProviderFor(weatherRepository)
final weatherRepositoryProvider =
    AutoDisposeProvider<WeatherRepository>.internal(
  weatherRepository,
  name: r'weatherRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$weatherRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WeatherRepositoryRef = AutoDisposeProviderRef<WeatherRepository>;
String _$weatherFutureHash() => r'6a4275464e56c2c5a0a8d4e5ab991eae95ac6dfe';

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

/// See also [weatherFuture].
@ProviderFor(weatherFuture)
const weatherFutureProvider = WeatherFutureFamily();

/// See also [weatherFuture].
class WeatherFutureFamily extends Family<AsyncValue<Weather>> {
  /// See also [weatherFuture].
  const WeatherFutureFamily();

  /// See also [weatherFuture].
  WeatherFutureProvider call(
    String cityName,
  ) {
    return WeatherFutureProvider(
      cityName,
    );
  }

  @override
  WeatherFutureProvider getProviderOverride(
    covariant WeatherFutureProvider provider,
  ) {
    return call(
      provider.cityName,
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
  String? get name => r'weatherFutureProvider';
}

/// See also [weatherFuture].
class WeatherFutureProvider extends AutoDisposeFutureProvider<Weather> {
  /// See also [weatherFuture].
  WeatherFutureProvider(
    String cityName,
  ) : this._internal(
          (ref) => weatherFuture(
            ref as WeatherFutureRef,
            cityName,
          ),
          from: weatherFutureProvider,
          name: r'weatherFutureProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$weatherFutureHash,
          dependencies: WeatherFutureFamily._dependencies,
          allTransitiveDependencies:
              WeatherFutureFamily._allTransitiveDependencies,
          cityName: cityName,
        );

  WeatherFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.cityName,
  }) : super.internal();

  final String cityName;

  @override
  Override overrideWith(
    FutureOr<Weather> Function(WeatherFutureRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: WeatherFutureProvider._internal(
        (ref) => create(ref as WeatherFutureRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        cityName: cityName,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Weather> createElement() {
    return _WeatherFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is WeatherFutureProvider && other.cityName == cityName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cityName.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin WeatherFutureRef on AutoDisposeFutureProviderRef<Weather> {
  /// The parameter `cityName` of this provider.
  String get cityName;
}

class _WeatherFutureProviderElement
    extends AutoDisposeFutureProviderElement<Weather> with WeatherFutureRef {
  _WeatherFutureProviderElement(super.provider);

  @override
  String get cityName => (origin as WeatherFutureProvider).cityName;
}

String _$getWeatherCardsHash() => r'9aaed8f3334f8284ad1be6afb74b198af857dcfc';

/// See also [getWeatherCards].
@ProviderFor(getWeatherCards)
final getWeatherCardsProvider = AutoDisposeProvider<List<WeatherCard>>.internal(
  getWeatherCards,
  name: r'getWeatherCardsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getWeatherCardsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetWeatherCardsRef = AutoDisposeProviderRef<List<WeatherCard>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
