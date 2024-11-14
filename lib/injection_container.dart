import 'dart:io';

import 'package:finance_app/app/core/network/http_logger.dart';
import 'package:finance_app/app/core/network/http_client.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/create_Setting.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/delete_Setting.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/get_Setting.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/get_Settings.dart';
import 'package:finance_app/app/features/Setting/domain/usecases/update_Setting.dart';
import 'package:finance_app/app/features/services/data/datasources/appsetting_remote_data_source.dart';
import 'package:finance_app/app/features/services/data/datasources/appsetting_remote_data_source_impl.dart';
import 'package:finance_app/app/features/services/data/repositories/appsetting_repository_impl.dart';
import 'package:finance_app/app/features/services/domain/repositories/appsetting_repository.dart';
import 'package:finance_app/app/features/services/domain/usecases/create_appsetting.dart';
import 'package:finance_app/app/features/services/domain/usecases/delete_appsetting.dart';
import 'package:finance_app/app/features/services/domain/usecases/get_appsetting.dart';
import 'package:finance_app/app/features/services/domain/usecases/get_appsettings.dart';
import 'package:finance_app/app/features/services/domain/usecases/update_appsetting.dart';
import 'package:finance_app/app/features/services/presentation/bloc/appsetting_bloc.dart';
import 'package:finance_app/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:finance_app/app/features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:finance_app/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:finance_app/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:finance_app/app/features/auth/domain/usecases/get_logged_user_detail.dart';
import 'package:finance_app/app/features/auth/domain/usecases/is_logged_in.dart';
import 'package:finance_app/app/features/auth/domain/usecases/sign_in.dart';
import 'package:finance_app/app/features/auth/domain/usecases/sign_out.dart';
import 'package:finance_app/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:finance_app/app/features/department/data/datasources/department_remote_data_source.dart';
import 'package:finance_app/app/features/department/data/datasources/department_remote_data_source_impl.dart';
import 'package:finance_app/app/features/department/data/repositories/department_repository_impl.dart';
import 'package:finance_app/app/features/department/domain/repositories/department_repository.dart';
import 'package:finance_app/app/features/department/domain/usecases/add_department.dart';
import 'package:finance_app/app/features/department/domain/usecases/delete_department.dart';
import 'package:finance_app/app/features/department/domain/usecases/get_department.dart';
import 'package:finance_app/app/features/department/domain/usecases/get_departments.dart';
import 'package:finance_app/app/features/department/domain/usecases/update_department.dart';
import 'package:finance_app/app/features/department/presentation/bloc/department_bloc.dart';
import 'package:finance_app/app/features/section/data/datasources/section_remote_data_source.dart';
import 'package:finance_app/app/features/section/data/datasources/section_remote_data_source_impl.dart';
import 'package:finance_app/app/features/section/data/repositories/section_repository_impl.dart';
import 'package:finance_app/app/features/section/domain/repositories/sections_repository.dart';
import 'package:finance_app/app/features/section/domain/usecases/add_section.dart';
import 'package:finance_app/app/features/section/domain/usecases/delete_section.dart';
import 'package:finance_app/app/features/section/domain/usecases/get_section.dart';
import 'package:finance_app/app/features/section/domain/usecases/get_sections.dart';
import 'package:finance_app/app/features/section/domain/usecases/update_section.dart';
import 'package:finance_app/app/features/section/presentation/bloc/section_bloc.dart';
import 'package:finance_app/app/features/sector/data/datasources/sector_remote_data_source.dart';
import 'package:finance_app/app/features/sector/data/datasources/sector_remote_data_source_impl.dart';
import 'package:finance_app/app/features/sector/data/repositories/sector_repository_impl.dart';
import 'package:finance_app/app/features/sector/domain/repositories/sector_repository.dart';
import 'package:finance_app/app/features/sector/domain/usecases/create_sector.dart';
import 'package:finance_app/app/features/sector/domain/usecases/delete_sector.dart';
import 'package:finance_app/app/features/sector/domain/usecases/get_sector.dart';
import 'package:finance_app/app/features/sector/domain/usecases/get_sectors.dart';
import 'package:finance_app/app/features/sector/domain/usecases/update_sector.dart';
import 'package:finance_app/app/features/sector/presentation/bloc/sector_bloc.dart';
import 'package:finance_app/app/features/setting/data/datasources/setting_remote_data_source.dart';
import 'package:finance_app/app/features/setting/data/datasources/setting_remote_data_source_impl.dart';
import 'package:finance_app/app/features/setting/data/repositories/setting_repository_impl.dart';
import 'package:finance_app/app/features/setting/domain/repositories/setting_repository.dart';
import 'package:finance_app/app/features/setting/presentation/bloc/setting_bloc.dart';
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
import 'package:finance_app/app/features/user_role/data/datasources/remote/user_role_remote_data_source_impl.dart';
import 'package:finance_app/app/features/user_role/data/datasources/user_role_remote_data_source.dart';
import 'package:finance_app/app/features/user_role/data/repositories/user_role_repository_impl.dart';
import 'package:finance_app/app/features/user_role/domain/repositories/user_role_repository.dart';
import 'package:finance_app/app/features/user_role/domain/usecases/create_user_role.dart';
import 'package:finance_app/app/features/user_role/domain/usecases/get_user_role.dart';
import 'package:finance_app/app/features/user_role/domain/usecases/list_system_functions.dart';
import 'package:finance_app/app/features/user_role/domain/usecases/list_user_roles.dart';
import 'package:finance_app/app/features/user_role/domain/usecases/update_user_role.dart';
import 'package:finance_app/app/features/user_role/presentation/bloc/user_role_bloc.dart';
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

  getIt.registerFactory(
    () => SectorBloc(
      getSector: getIt(),
      getSectors: getIt(),
      createSector: getIt(),
      updateSector: getIt(),
      deleteSector: getIt(),
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
    () => SectionBloc(
      getSection: getIt(),
      getSections: getIt(),
      createSection: getIt(),
      updateSection: getIt(),
      deleteSection: getIt(),
    ),
  );
  getIt.registerFactory(
    () => AppSettingBloc(
      getAppSetting: getIt(),
      getAppSettings: getIt(),
      createAppSetting: getIt(),
      updateAppSetting: getIt(),
      deleteAppSetting: getIt(),
    ),
  );

  getIt.registerFactory(

    () => SettingBloc(
      getSetting: getIt(),
      getSettings: getIt(),
      createSetting: getIt(),
      updateSetting: getIt(),
      deleteSetting: getIt(),

    () => UserRoleBloc(
      createUserRole: getIt(),
      getUserRole: getIt(),
      listSystemFunctions: getIt(),
      listUserRoles: getIt(),
      updateUserRole: getIt(),

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

  getIt.registerLazySingleton(() => GetSector(getIt()));
  getIt.registerLazySingleton(() => GetSectors(getIt()));
  getIt.registerLazySingleton(() => CreateSector(getIt()));
  getIt.registerLazySingleton(() => UpdateSector(getIt()));
  getIt.registerLazySingleton(() => DeleteSector(getIt()));

  getIt.registerLazySingleton(() => GetDepartment(getIt()));
  getIt.registerLazySingleton(() => GetDepartments(getIt()));
  getIt.registerLazySingleton(() => CreateDepartment(getIt()));
  getIt.registerLazySingleton(() => UpdateDepartment(getIt()));
  getIt.registerLazySingleton(() => DeleteDepartment(getIt()));

  getIt.registerLazySingleton(() => GetUserRole(getIt()));
  getIt.registerLazySingleton(() => ListSystemFunctions(getIt()));
  getIt.registerLazySingleton(() => ListUserRoles(getIt()));
  getIt.registerLazySingleton(() => CreateUserRole(getIt()));
  getIt.registerLazySingleton(() => UpdateUserRole(getIt()));

  getIt.registerLazySingleton(() => GetSection(getIt()));
  getIt.registerLazySingleton(() => GetSections(getIt()));
  getIt.registerLazySingleton(() => CreateSection(getIt()));
  getIt.registerLazySingleton(() => UpdateSection(getIt()));
  getIt.registerLazySingleton(() => DeleteSection(getIt()));

  getIt.registerLazySingleton(() => GetAppSetting(getIt()));
  getIt.registerLazySingleton(() => GetAppSettings(getIt()));
  getIt.registerLazySingleton(() => CreateAppSetting(getIt()));
  getIt.registerLazySingleton(() => UpdateAppsetting(getIt()));
  getIt.registerLazySingleton(() => DeleteAppSetting(getIt()));

  getIt.registerLazySingleton(() => GetSetting(getIt()));
  getIt.registerLazySingleton(() => GetSettings(getIt()));
  getIt.registerLazySingleton(() => CreateSetting(getIt()));
  getIt.registerLazySingleton(() => UpdateSetting(getIt()));
  getIt.registerLazySingleton(() => DeleteSetting(getIt()));
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

  getIt.registerLazySingleton<SectorRepository>(
    () => SectorRepositoryImpl(
      sectorRemoteDataSource: getIt(),
    ),
  );
  getIt.registerLazySingleton<DepartmentRepository>(
    () => DepartmentRepositoryImpl(
      departmentRemoteDataSource: getIt(),
    ),
  );
  getIt.registerLazySingleton<SectionRepository>(
    () => SectionRepositoryImpl(
      sectionRemoteDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<AppSettingRepository>(
    () => AppSettingRepositoryImpl(
      appSettingRemoteDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<SettingRepository>(
    () => SettingRepositoryImpl(
      settingRemoteDataSource: getIt(),


  getIt.registerLazySingleton<UserRoleRepository>(
    () => UserRoleRepositoryImpl(
      userRoleRemoteDataSource: getIt(),

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

  getIt.registerLazySingleton<SectorRemoteDataSource>(
    () => SectorRemoteDataSourceImpl(
      httpClient: getIt(),
    ),
  );
  getIt.registerLazySingleton<DepartmentRemoteDataSource>(
    () => DepartmentRemoteDataSourceImpl(
      httpClient: getIt(),
    ),
  );
  getIt.registerLazySingleton<SectionRemoteDataSource>(
    () => SectionRemoteDataSourceImpl(
      httpClient: getIt(),
    ),
  );
  getIt.registerLazySingleton<AppSettingRemoteDataSource>(
    () => AppSettingRemoteDataSourceImpl(
      httpClient: getIt(),
    ),
  );
  getIt.registerLazySingleton<SettingRemoteDataSource>(
    () => SettingRemoteDataSourceImpl(
      httpClient: getIt(),
    ),
  );

  getIt.registerLazySingleton<UserRoleRemoteDataSource>(
    () => UserRoleRemoteDataSourceImpl(
      httpClient: getIt(),
    ),
  );

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
