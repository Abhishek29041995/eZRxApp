import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/domain/about_us/repository/i_about_us_repository.dart';
import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_us_event.dart';
part 'about_us_state.dart';
part 'about_us_bloc.freezed.dart';

class AboutUsBloc extends Bloc<AboutUsEvent, AboutUsState> {
  final IAboutUsRepository repository;

  AboutUsBloc({required this.repository}) : super(AboutUsState.initial()) {
    on<AboutUsEvent>(_onEvent);
  }
  Future<void> _onEvent(
    AboutUsEvent event,
    Emitter<AboutUsState> emit,
  ) async {
    await event.map(
      initialize: (e) {
        emit(
          AboutUsState.initial().copyWith(
            salesOrg: e.salesOrg,
          ),
        );
      },
      fetchAboutUsInfo: (e) async {
        emit(
          state.copyWith(
            isFetching: true,
            apiFailureOrSuccessOption: none(),
          ),
        );
        final failureOrSuccessOption = await repository.getAboutUsInfo(
          salesOrg: state.salesOrg,
        );

        failureOrSuccessOption.fold(
          (failure) {
            add(const AboutUsEvent.fetchAboutUsStaticInfo());
          },
          (aboutUsInfo) {
            emit(
              state.copyWith(
                isFetching: false,
                aboutUsInfo: aboutUsInfo,
                apiFailureOrSuccessOption: none(),
              ),
            );
          },
        );
      },
      fetchAboutUsStaticInfo: (e) async {
        final aboutUsFailureOrSuccessOption =
            await repository.getAboutUsStaticInfo(
          salesOrg: state.salesOrg,
        );

        aboutUsFailureOrSuccessOption.fold(
          (failure) {
            emit(
              state.copyWith(
                apiFailureOrSuccessOption:
                    optionOf(aboutUsFailureOrSuccessOption),
                isFetching: false,
              ),
            );
          },
          (aboutUsInfo) {
            emit(
              state.copyWith(
                isFetching: false,
                aboutUsInfo: aboutUsInfo,
                apiFailureOrSuccessOption:
                    optionOf(aboutUsFailureOrSuccessOption),
              ),
            );
          },
        );
      },
    );
  }
}
