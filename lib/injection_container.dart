import 'dart:io';

import 'package:finance_app/app/core/network/http_logger.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:finance_app/app/features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:finance_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:finance_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:finance_app/app/features/auth/domain/usecases/get_logged_user_detail.dart';
import 'package:finance_app/app/features/auth/domain/usecases/is_logged_in.dart';
import 'package:finance_app/app/features/auth/domain/usecases/sign_in.dart';
import 'package:finance_app/app/features/auth/domain/usecases/sign_out.dart';
import 'package:finance_app/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:finance_app/app/features/user/data/datasources/remote/user_remote_data_source_impl.dart';
import 'package:finance_app/app/features/user/data/datasources/user_remote_data_source.dart';
import 'package:finance_app/app/features/user/data/repositories/user_repository_impl.dart';
import 'package:finance_app/app/features/user/domain/repositories/user_repository.dart';
import 'package:finance_app/app/features/user/domain/usecases/create_user.dart';
import 'package:finance_app/app/features/user/domain/usecases/delete_user.dart';
import 'package:finance_app/app/features/user/domain/usecases/get_user.dart';
import 'package:finance_app/app/features/user/domain/usecases/get_users.dart';
import 'package:finance_app/app/features/user/domain/usecases/update_user.dart';
import 'package:finance_app/app/features/user/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  // Register logger first
  getIt.registerLazySingleton<HttpLogger>(() => HttpLogger());

  // Register the http client
  getIt.registerLazySingleton<HttpClient>(() => HttpClient(logger: getIt()));

  // Bloc
  getIt.registerFactory(
    () => UserBloc(
      getUser: getIt(),
      getUsers: getIt(),
      createUser: getIt(),
      updateUser: getIt(),
      deleteUser: getIt(),
    ),
  );

  getIt.registerFactory(
    () => AuthBloc(
      signIn: getIt(),
      signOut: getIt(),
      isLoggedIn: getIt(),
      getLoggedUserDetail: getIt(),
    ),
  );

  // use cases

  getIt.registerLazySingleton(() => SignIn(getIt()));
  getIt.registerLazySingleton(() => SignOut(getIt()));
  getIt.registerLazySingleton(() => IsLoggedIn(getIt()));
  getIt.registerLazySingleton(() => GetLoggedUserDetail(getIt()));

  getIt.registerLazySingleton(() => GetUser(getIt()));
  getIt.registerLazySingleton(() => GetUsers(getIt()));
  getIt.registerLazySingleton(() => CreateUser(getIt()));
  getIt.registerLazySingleton(() => UpdateUser(getIt()));
  getIt.registerLazySingleton(() => DeleteUser(getIt()));

  // repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userRemoteDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authRemoteDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      httpClient: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      httpClient: getIt(),
    ),
  );

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
