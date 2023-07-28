import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/model/param/diary_param.dart';
import 'package:flutter_application_1/remote/diary_data_source.dart';
import 'package:flutter_application_1/domain/diary_repository.dart';
import 'package:flutter_application_1/remote/model/post/post_diary.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IDiaryRepository)
final class DiaryRepositoryImpl implements IDiaryRepository {
  const DiaryRepositoryImpl(
    IDiaryDataSource diaryDataSource,
  ) : _diaryDataSource = diaryDataSource;

  final IDiaryDataSource _diaryDataSource;

  @override
  Future<Response> createDiary({required DiaryParam diaryParam}) {
    return _diaryDataSource.createDiary(
      diaryPayload: PostDiaryPayload(
        base64Images: diaryParam.base64Images,
        isIncludeInPhotoGallery: diaryParam.isIncludeInPhotoGallery,
        comments: diaryParam.comments,
        date: diaryParam.date,
        area: diaryParam.area,
        taxCategory: diaryParam.taxCategory,
        tags: diaryParam.tags,
        isExistingEvent: diaryParam.isExistingEvent,
        event: diaryParam.event,
      ),
    );
  }
}
