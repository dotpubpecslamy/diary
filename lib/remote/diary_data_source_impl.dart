import 'dart:developer';

import 'package:flutter_application_1/remote/diary_data_source.dart';
import 'package:flutter_application_1/remote/model/post/post_diary.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: IDiaryDataSource)
final class DiaryDataSourceImpl implements IDiaryDataSource {
  @override
  Future<Response> createDiary({required PostDiaryPayload diaryPayload}) async {
    try {
      final dio = Dio();
      log('payload ${diaryPayload.toMap()}');

      final response =
          await dio.post('https://reqres.in/', data: diaryPayload.toMap());

      log('$response');

      return response;
    } on DioException catch (dioExc) {
      return Future.error(dioExc);
    } catch (exc) {
      return Future.error(exc);
    }
  }
}
