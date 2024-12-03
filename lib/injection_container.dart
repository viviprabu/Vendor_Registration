import 'package:vendor_registration/app/core/network/http_client_with_interceptor.dart';
import 'package:vendor_registration/app/core/network/http_logger.dart';
import 'package:vendor_registration/app/core/network/http_client.dart';
import 'package:vendor_registration/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:vendor_registration/app/features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:vendor_registration/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:vendor_registration/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:vendor_registration/app/features/auth/domain/usecases/get_logged_user_detail.dart';
import 'package:vendor_registration/app/features/auth/domain/usecases/is_logged_in.dart';
import 'package:vendor_registration/app/features/auth/domain/usecases/sign_in.dart';
import 'package:vendor_registration/app/features/auth/domain/usecases/sign_out.dart';
import 'package:vendor_registration/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:vendor_registration/app/features/registration/data/datasources/department_remote_data_source.dart';
import 'package:vendor_registration/app/features/registration/data/datasources/department_remote_data_source_impl.dart';
import 'package:vendor_registration/app/features/registration/data/repositories/department_repository_impl.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/department_repository.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/add_department.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/delete_department.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/get_department.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/get_departments.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/update_department.dart';
import 'package:vendor_registration/app/features/registration/presentation/bloc/department_bloc.dart';
import 'package:vendor_registration/app/features/user/data/datasources/remote/user_remote_data_source_impl.dart';
import 'package:vendor_registration/app/features/user/data/datasources/user_remote_data_source.dart';
import 'package:vendor_registration/app/features/user/data/repositories/user_repository_impl.dart';
import 'package:vendor_registration/app/features/user/domain/repositories/user_repository.dart';
import 'package:vendor_registration/app/features/user/domain/usecases/create_user.dart';
import 'package:vendor_registration/app/features/user/domain/usecases/delete_user.dart';
import 'package:vendor_registration/app/features/user/domain/usecases/get_user.dart';
import 'package:vendor_registration/app/features/user/domain/usecases/get_users.dart';
import 'package:vendor_registration/app/features/user/domain/usecases/update_user.dart';
import 'package:vendor_registration/app/features/user/presentation/bloc/user_bloc.dart';
import 'package:vendor_registration/app/features/user_role/data/repositories/user_role_repository_impl.dart';
import 'package:vendor_registration/app/features/user_role/domain/repositories/user_role_repository.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/create_user_role.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/get_user_role_functions.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/list_system_functions.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/list_user_roles.dart';
import 'package:vendor_registration/app/features/user_role/domain/usecases/update_user_role.dart';
import 'package:vendor_registration/app/features/user_role/presentation/bloc/user_role_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  // Register logger first
  getIt.registerLazySingleton<HttpLogger>(() => HttpLogger());

  // Register the http client
  getIt.registerLazySingleton<HttpClient>(() => HttpClient(logger: getIt()));

  // Register the http client with interceptor
  getIt.registerLazySingleton<HttpClientWithInterceptor>(
      () => HttpClientWithInterceptor());

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

  getIt.registerFactory(
    () => DepartmentBloc(
      getDepartment: getIt(),
      getDepartments: getIt(),
      createDepartment: getIt(),
      updateDepartment: getIt(),
      deleteDepartment: getIt(),
    ),
  );

  getIt.registerFactory(
    () => UserRoleBloc(
      getUserRoleFunctions: getIt(),
      listUserRoles: getIt(),
      createUserRole: getIt(),
      updateUserRole: getIt(),
      listSystemFunctions: getIt(),
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

  getIt.registerLazySingleton(() => GetDepartment(getIt()));
  getIt.registerLazySingleton(() => GetDepartments(getIt()));
  getIt.registerLazySingleton(() => CreateDepartment(getIt()));
  getIt.registerLazySingleton(() => UpdateDepartment(getIt()));
  getIt.registerLazySingleton(() => DeleteDepartment(getIt()));

  getIt.registerLazySingleton(() => GetUserRoleFunctions(getIt()));
  getIt.registerLazySingleton(() => ListSystemFunctions(getIt()));
  getIt.registerLazySingleton(() => ListUserRoles(getIt()));
  getIt.registerLazySingleton(() => CreateUserRole(getIt()));
  getIt.registerLazySingleton(() => UpdateUserRole(getIt()));

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

  getIt.registerLazySingleton<DepartmentRepository>(
    () => DepartmentRepositoryImpl(
      departmentRemoteDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<UserRoleRepository>(
    () => UserRoleRepositoryImpl(
      userRoleRemoteDataSource: getIt(),
    ),
  );

  // Data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(
      httpClientWithInterceptor: getIt(),
    ),
  );

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      httpClient: getIt(),
    ),
  );

  getIt.registerLazySingleton<DepartmentRemoteDataSource>(
    () => DepartmentRemoteDataSourceImpl(
      httpClientWithInterceptor: getIt(),
    ),
  );

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
