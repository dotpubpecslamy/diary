import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/create_diary_use_case.dart';
import 'package:flutter_application_1/domain/model/input/create_diary_input.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

part 'create_diary_event.dart';
part 'create_diary_state.dart';

@injectable
class CreateDiaryBloc extends Bloc<CreateDiaryEvent, CreateDiaryState> {
  final CreateDiaryUseCase _createDiaryUseCase;

  CreateDiaryBloc(CreateDiaryUseCase createDiaryUseCase)
      : _createDiaryUseCase = createDiaryUseCase,
        super(const CreateDiaryState()) {
    on<CreateDiaryExecute>((event, emit) async {
      emit(state.copyWith(uiState: UIState.loading));

      final base64Images = <String>[];
      if (state.imgList.isNotEmpty) {
        for (var element in state.imgList) {
          File file = File(element.path);
          Uint8List bytes = file.readAsBytesSync();
          String base64Image = base64Encode(bytes);
          base64Images.add(base64Image);
        }
      }

      final input = CreateDiaryInput(
        base64Images: base64Images,
        isIncludeInPhotoGallery: state.isInclude,
        comments: 'commnets',
        date: 'date',
        area: 'area',
        taxCategory: 'taxCategory',
        tags: 'tags',
        isExistingEvent: false,
        event: 'event',
      );

      log('${input.base64Images}');

      try {
        await _createDiaryUseCase.execute(input: input);

        emit(state.copyWith(uiState: UIState.success));
      } catch (exc) {
        debugPrint('$exc');

        emit(state.copyWith(uiState: UIState.error));
      }
    });

    on<CreateDiaryAddPhoto>((event, emit) {
      final selectedFileList = <File>[];
      final currentList = state.imgList;
      for (final element in event.xFiles) {
        selectedFileList.add(File(element.path));
      }

      final combinedList =
          List<File>.from([...currentList, ...selectedFileList]);

      emit(state.copyWith(imgList: combinedList));
    });

    on<CreateDiaryRemovePhoto>((event, emit) {
      final newImgList = List.of(state.imgList)..remove(event.photoFile);

      emit(
        state.copyWith(imgList: newImgList),
      );
    });

    on<CreateDiarySetIncludePhotoGallery>((event, emit) {
      emit(
        state.copyWith(isInclude: event.isInclude),
      );
    });
  }
}
