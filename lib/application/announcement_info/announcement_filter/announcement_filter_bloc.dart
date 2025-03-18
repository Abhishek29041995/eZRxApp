import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_article_tag_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'announcement_filter_event.dart';
part 'announcement_filter_state.dart';
part 'announcement_filter_bloc.freezed.dart';

class AnnouncementFilterBloc
    extends Bloc<AnnouncementFilterEvent, AnnouncementFilterState> {
  final IAnnouncementArticleTagRepository announcementArticleTagRepository;
  AnnouncementFilterBloc({required this.announcementArticleTagRepository})
      : super(AnnouncementFilterState.initial()) {
    on<AnnouncementFilterEvent>(_onEvent);
  }
  Future<void> _onEvent(
    AnnouncementFilterEvent event,
    Emitter<AnnouncementFilterState> emit,
  ) async {
    await event.map(
      categoryChanged: (e) {
        final selectedCategoryList = List<String>.from(
          state.filterCategoryKeyList,
        );
        final modifiedCategoryList = e.selected
            ? (selectedCategoryList..add(e.filterCategory))
            : (selectedCategoryList..remove(e.filterCategory));
        emit(
          state.copyWith(
            filterCategoryKeyList: modifiedCategoryList,
          ),
        );
      },
      setCategoryWhileOpenBottomSheet: (e) {
        emit(
          state.copyWith(
            filterCategoryKeyList: e.filterCategory,
          ),
        );
      },
      resetCategory: (e) {
        emit(
          state.copyWith(
            filterCategoryKeyList: <String>[],
          ),
        );
      },
      fetchCategory: (e) async {
        emit(
          state.copyWith(
            isLoading: true,
          ),
        );

        final failureOrSuccessOption =
            await announcementArticleTagRepository.getAnnouncementArticleTag(
          salesOrg: e.salesOrg,
          variablePath: e.salesOrg.announcementTagVariablePath,
        );
        if (isClosed) return;
        failureOrSuccessOption.fold(
          (failure) => emit(
            state.copyWith(
              isLoading: false,
            ),
          ),
          (categoryKeyList) {
            emit(
              state.copyWith(
                isLoading: false,
                categoryKeyList: categoryKeyList,
              ),
            );
          },
        );
      },
    );
  }
}
