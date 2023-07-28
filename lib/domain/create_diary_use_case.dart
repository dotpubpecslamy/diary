import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/diary_repository.dart';
import 'package:flutter_application_1/domain/model/input/create_diary_input.dart';
import 'package:flutter_application_1/domain/model/param/diary_param.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateDiaryUseCase {
  CreateDiaryUseCase(IDiaryRepository diaryRepository)
      : _diaryRepository = diaryRepository;

  final IDiaryRepository _diaryRepository;

  Future<Response> execute({
    required CreateDiaryInput input,
  }) async {
    return _diaryRepository.createDiary(
      diaryParam: DiaryParam(
        base64Images: input.base64Images,
        isIncludeInPhotoGallery: input.isIncludeInPhotoGallery,
        comments: input.comments,
        date: input.date,
        area: input.area,
        taxCategory: input.taxCategory,
        tags: input.tags,
        isExistingEvent: input.isExistingEvent,
        event: input.event,
      ),
    );
  }
}
