// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_application_1/data/diary_repository_impl.dart' as _i6;
import 'package:flutter_application_1/domain/create_diary_use_case.dart' as _i7;
import 'package:flutter_application_1/domain/diary_repository.dart' as _i5;
import 'package:flutter_application_1/feature/create_diary/bloc/create_diary_bloc.dart'
    as _i8;
import 'package:flutter_application_1/remote/diary_data_source.dart' as _i3;
import 'package:flutter_application_1/remote/diary_data_source_impl.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initApp({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.IDiaryDataSource>(_i4.DiaryDataSourceImpl());
    gh.singleton<_i5.IDiaryRepository>(
        _i6.DiaryRepositoryImpl(gh<_i3.IDiaryDataSource>()));
    gh.factory<_i7.CreateDiaryUseCase>(
        () => _i7.CreateDiaryUseCase(gh<_i5.IDiaryRepository>()));
    gh.factory<_i8.CreateDiaryBloc>(
        () => _i8.CreateDiaryBloc(gh<_i7.CreateDiaryUseCase>()));
    return this;
  }
}
