part of 'create_diary_bloc.dart';

abstract class CreateDiaryEvent extends Equatable {
  const CreateDiaryEvent();

  @override
  List<Object> get props => [];
}

class CreateDiaryExecute extends CreateDiaryEvent {
  const CreateDiaryExecute();
  @override
  List<Object> get props => [];
}

class CreateDiaryAddPhoto extends CreateDiaryEvent {
  const CreateDiaryAddPhoto({
    required this.xFiles,
  });

  final List<XFile> xFiles;

  @override
  List<Object> get props => [xFiles];
}

final class CreateDiaryRemovePhoto extends CreateDiaryEvent {
  const CreateDiaryRemovePhoto({
    required this.photoFile,
  });

  final File photoFile;

  @override
  List<Object> get props => [photoFile];
}

final class CreateDiarySetIncludePhotoGallery extends CreateDiaryEvent {
  const CreateDiarySetIncludePhotoGallery({
    required this.isInclude,
  });

  final bool isInclude;

  @override
  List<Object> get props => [isInclude];
}
