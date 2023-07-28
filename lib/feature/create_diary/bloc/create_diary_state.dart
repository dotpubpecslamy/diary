part of 'create_diary_bloc.dart';

enum UIState {
  initial(),
  loading(),
  success(),
  error();
}

final class CreateDiaryState extends Equatable {
  const CreateDiaryState({
    this.imgList = const [],
    this.isInclude = false,
    this.uiState = UIState.initial,
  });

  final List<File> imgList;
  final bool isInclude;
  final UIState uiState;

  @override
  List<Object> get props => [
        imgList,
        isInclude,
        uiState,
      ];

  CreateDiaryState copyWith({
    List<File>? imgList,
    bool? isInclude,
    UIState? uiState,
  }) {
    return CreateDiaryState(
      imgList: imgList ?? this.imgList,
      isInclude: isInclude ?? this.isInclude,
      uiState: uiState ?? this.uiState,
    );
  }
}
