import 'package:flutter_application_1/remote/model/post/post_diary.dart';
import 'package:dio/dio.dart';

abstract interface class IDiaryDataSource {
  Future<Response> createDiary({
    required PostDiaryPayload diaryPayload,
  });
}
