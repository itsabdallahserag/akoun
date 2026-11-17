// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

import 'package:akoun/api/api_services.dart';
import 'package:akoun/api/data_sources/remote/auth/login_remote_data_source_impl.dart';
import 'package:akoun/api/data_sources/remote/auth/register_remote_data_source_impl.dart';
import 'package:akoun/api/dio/dio_interceptors.dart';
import 'package:akoun/api/dio/dio_module.dart';
import 'package:akoun/data/data_sources/remote/auth/login_remote_data_source.dart';
import 'package:akoun/data/data_sources/remote/auth/register_remote_data_source.dart';
import 'package:akoun/data/repositories/auth/login_repository_imp.dart';
import 'package:akoun/data/repositories/auth/register_repository_imp.dart';
import 'package:akoun/domain/repositories/auth/login_repository.dart';
import 'package:akoun/domain/repositories/auth/register_repository.dart';
import 'package:akoun/domain/use_cases/auth/login_use_case.dart';
import 'package:akoun/domain/use_cases/auth/register_use_case.dart';
import 'package:akoun/feature/ui/auth/login/cubit/login_view_model.dart';
import 'package:akoun/feature/ui/auth/register/cubit/register_view_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

extension GetItInjectableX on GetIt {
  GetIt init({
    String? environment,
    EnvironmentFilter? environmentFilter,
  }) {
    final gh = GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.singleton<BaseOptions>(() => dioModule.provideBaseOptions());
    gh.singleton<PrettyDioLogger>(() => dioModule.providePrettyDioLogger());
    gh.singleton<DioInterceptors>(() => dioModule.provideDioInterceptors());
    gh.singleton<Dio>(() => dioModule.provideDio(
          gh<BaseOptions>(),
          gh<PrettyDioLogger>(),
          gh<DioInterceptors>(),
        ));
    gh.singleton<ApiServices>(() => ApiServices(gh<Dio>()));
    gh.factory<LoginRemoteDataSource>(
        () => LoginRemoteDataSourceImpl(apiServices: gh<ApiServices>()));
    gh.factory<LoginRepository>(() => LoginRepositoryImp(
        loginRemoteDataSource: gh<LoginRemoteDataSource>()));
    gh.factory<LoginUseCase>(
        () => LoginUseCase(loginRepository: gh<LoginRepository>()));
    gh.factory<LoginViewModel>(
        () => LoginViewModel(loginUseCase: gh<LoginUseCase>()));

    gh.factory<RegisterRemoteDataSource>(() =>
        RegisterRemoteDataSourceImpl(apiServices: gh<ApiServices>()));
    gh.factory<RegisterRepository>(() => RegisterRepositoryImp(
        registerRemoteDataSource: gh<RegisterRemoteDataSource>()));
    gh.factory<RegisterUseCase>(() =>
        RegisterUseCase(registerRepository: gh<RegisterRepository>()));
    gh.factory<RegisterViewModel>(() =>
        RegisterViewModel(registerUseCase: gh<RegisterUseCase>()));
    return this;
  }
}

class _$DioModule extends DioModule {}
