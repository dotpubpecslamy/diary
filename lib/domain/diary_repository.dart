import 'package:dio/dio.dart';
import 'package:flutter_application_1/domain/model/param/diary_param.dart';

abstract interface class IDiaryRepository {
  Future<Response> createDiary({
    required DiaryParam diaryParam,
  });
}
