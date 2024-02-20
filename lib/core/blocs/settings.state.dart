part of 'settings.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required String locale,
    @Default(MapProviderEnum.googleMaps) MapProviderEnum mapProvider,
  }) = _SettingsState;

  factory SettingsState.initial() => const SettingsState(
        locale: 'en',
      mapProvider: MapProviderEnum.googleMaps
      );

  factory SettingsState.fromJson(Map<String, dynamic> json) => _$SettingsStateFromJson(json);

  const SettingsState._();

  get provider => switch (mapProvider) {
    MapProviderEnum.googleMaps => GoogleMapProvider(),
    MapProviderEnum.mapBox => Constants.mapBoxProvider,
    MapProviderEnum.openStreetMaps => OpenStreetMapProvider(),
  };
}
