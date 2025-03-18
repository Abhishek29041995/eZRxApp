part of 'ez_point_bloc.dart';

@freezed
class EZPointEvent with _$EZPointEvent {
  const factory EZPointEvent.initialized() = _Initialized;
  const factory EZPointEvent.fetch({
    required CustomerCodeInfo customerCodeInfo,
  }) = _Fetch;
}
