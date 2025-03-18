import 'package:ezrxmobile/domain/account/value/value_objects.dart';
import 'package:ezrxmobile/domain/announcement_info/repository/i_announcement_article_tag_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'articles_info_filter_event.dart';
part 'articles_info_filter_state.dart';
part 'articles_info_filter_bloc.freezed.dart';

class ArticlesInfoFilterBloc
    extends Bloc<ArticlesInfoFilterEvent, ArticlesInfoFilterState> {
  final IAnnouncementArticleTagRepository announcementArticleTagRepository;
  ArticlesInfoFilterBloc({required this.announcementArticleTagRepository})
      : super(ArticlesInfoFilterState.initial()) {
    on<ArticlesInfoFilterEvent>(_onEvent);
  }
  Future<void> _onEvent(
    ArticlesInfoFilterEvent event,
    Emitter<ArticlesInfoFilterState> emit,
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
            filterCategoryKeyList: [],
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
          variablePath: e.salesOrg.articleTagVariablePath,
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
