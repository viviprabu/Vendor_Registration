import 'package:vendor_registration/app/core/network/http_client_with_interceptor.dart';
import 'package:vendor_registration/app/core/network/http_logger.dart';
import 'package:vendor_registration/app/core/network/http_client.dart';
import 'package:vendor_registration/app/features/area/data/datasources/area_remote_data_source.dart';
import 'package:vendor_registration/app/features/area/data/datasources/remote/area_data_source_impl.dart';
import 'package:vendor_registration/app/features/area/data/repositories/area_repository_impl.dart';
import 'package:vendor_registration/app/features/area/domain/repositories/area_repository.dart';
import 'package:vendor_registration/app/features/area/domain/usecases/create_area.dart';
import 'package:vendor_registration/app/features/area/domain/usecases/delete_area.dart';
import 'package:vendor_registration/app/features/area/domain/usecases/get_area.dart';
import 'package:vendor_registration/app/features/area/domain/usecases/get_areas.dart';
import 'package:vendor_registration/app/features/area/domain/usecases/update_area.dart';
import 'package:vendor_registration/app/features/area/presentation/bloc/area_bloc.dart';
import 'package:vendor_registration/app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:vendor_registration/app/features/auth/data/datasources/remote/auth_remote_data_source_impl.dart';
import 'package:vendor_registration/app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:vendor_registration/app/features/auth/domain/repositories/auth_repository.dart';
import 'package:vendor_registration/app/features/auth/domain/usecases/get_logged_user_detail.dart';
import 'package:vendor_registration/app/features/auth/domain/usecases/is_logged_in.dart';
import 'package:vendor_registration/app/features/auth/domain/usecases/sign_in.dart';
import 'package:vendor_registration/app/features/auth/domain/usecases/sign_out.dart';
import 'package:vendor_registration/app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:vendor_registration/app/features/document_master/data/datasources/document_master_remote_data_source.dart';
import 'package:vendor_registration/app/features/document_master/data/datasources/remote/document_master_data_source_impl.dart';
import 'package:vendor_registration/app/features/document_master/data/repositories/document_master_repository_impl.dart';
import 'package:vendor_registration/app/features/document_master/domain/repositories/document_master_repository.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/create_document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/delete_document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/get_document_master.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/get_document_masters.dart';
import 'package:vendor_registration/app/features/document_master/domain/usecases/update_document_master.dart';
import 'package:vendor_registration/app/features/document_master/presentation/bloc/document_master_bloc.dart';
import 'package:vendor_registration/app/features/governorate/data/datasources/governorate_remote_data_source.dart';
import 'package:vendor_registration/app/features/governorate/data/datasources/remote/governorate_data_source_impl.dart';
import 'package:vendor_registration/app/features/governorate/data/repositories/governorate_repository_impl.dart';
import 'package:vendor_registration/app/features/governorate/domain/repositories/governorate_repository.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/create_governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/delete_governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/get_governorate.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/get_governorates.dart';
import 'package:vendor_registration/app/features/governorate/domain/usecases/update_governorate.dart';
import 'package:vendor_registration/app/features/governorate/presentation/bloc/governorate_bloc.dart';
import 'package:vendor_registration/app/features/registration/data/datasources/registration_remote_data_source.dart';
import 'package:vendor_registration/app/features/registration/data/datasources/registration_remote_data_source_impl.dart';
import 'package:vendor_registration/app/features/registration/data/repositories/registration_repository_impl.dart';
import 'package:vendor_registration/app/features/registration/domain/repositories/registration_repository.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/add_registration.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/delete_registration.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/get_registration.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/get_registrations.dart';
import 'package:vendor_registration/app/features/registration/domain/usecases/update_registration.dart';
import 'package:vendor_registration/app/features/registration/presentation/bloc/registration_bloc.dart';
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
    () => RegistrationBloc(
      getRegistration: getIt(),
      getRegistrations: getIt(),
      createRegistration: getIt(),
      updateRegistration: getIt(),
      deleteRegistration: getIt(),
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
   getIt.registerFactory(
    () => DocumentMasterBloc(
      getDocumentMaster: getIt(), 
      getDocumentMasters: getIt(), 
      createDocumentMaster: getIt(), 
      updateDocumentMaster: getIt(), 
      deleteDocumentMaster: getIt(),
      
    ),
  );
     getIt.registerFactory(
    () => GovernorateBloc(
      getGovernorate: getIt(), 
      getGovernorates: getIt(), 
      createGovernorate: getIt(), 
      updateGovernorate: getIt(), 
      deleteGovernorate: getIt(),
      
    ),
  );
   getIt.registerFactory(
    () => AreaBloc(
      getArea: getIt(), 
      getAreas: getIt(), 
      createArea: getIt(), 
      updateArea: getIt(), 
      deleteArea: getIt(),
      
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

  getIt.registerLazySingleton(() => GetRegistration(getIt()));
  getIt.registerLazySingleton(() => GetRegistrations(getIt()));
  getIt.registerLazySingleton(() => CreateRegistration(getIt()));
  getIt.registerLazySingleton(() => UpdateRegistration(getIt()));
  getIt.registerLazySingleton(() => DeleteRegistration(getIt()));

   
  getIt.registerLazySingleton(() => GetDocumentMaster(getIt()));
  getIt.registerLazySingleton(() => GetDocumentMasters(getIt()));
  getIt.registerLazySingleton(() => CreateDocumentMaster(getIt()));
  getIt.registerLazySingleton(() => UpdateDocumentMaster(getIt()));
  getIt.registerLazySingleton(() => DeleteDocumentMaster(getIt()));

  getIt.registerLazySingleton(() => GetGovernorate(getIt()));
  getIt.registerLazySingleton(() => GetGovernorates(getIt()));
  getIt.registerLazySingleton(() => CreateGovernorate(getIt()));
  getIt.registerLazySingleton(() => UpdateGovernorate(getIt()));
  getIt.registerLazySingleton(() => DeleteGovernorate(getIt()));

  getIt.registerLazySingleton(() => GetArea(getIt()));
  getIt.registerLazySingleton(() => GetAreas(getIt()));
  getIt.registerLazySingleton(() => CreateArea(getIt()));
  getIt.registerLazySingleton(() => UpdateArea(getIt()));
  getIt.registerLazySingleton(() => DeleteArea(getIt()));

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

  getIt.registerLazySingleton<RegistrationRepository>(
    () => RegistrationRepositoryImpl(
      registrationRemoteDataSource: getIt(),
    ),
  );
   getIt.registerLazySingleton<DocumentMasterRepository>(
    () => DocumentMasterRepositoryImpl(
      documentMasterRemoteDataSource: getIt(),
    ),
  );
    getIt.registerLazySingleton<GovernorateRepository>(
    () => GovernorateRepositoryImpl(
      governorateRemoteDataSource: getIt(),
    ),
  );
    getIt.registerLazySingleton<AreaRepository>(
    () => AreaRepositoryImpl(
      areaRemoteDataSource: getIt(),
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

  getIt.registerLazySingleton<RegistrationRemoteDataSource>(
    () => RegistrationRemoteDataSourceImpl(
      httpClientWithInterceptor: getIt(),
    ),
  );

   getIt.registerLazySingleton<DocumentMasterRemoteDataSource>(
    () => DocumentMasterRemoteDataSourceImpl(
      httpClientWithInterceptor: getIt(),
    ),
  );

    getIt.registerLazySingleton<GovernorateRemoteDataSource>(
    () => GovernorateRemoteDataSourceImpl(
      httpClientWithInterceptor: getIt(),
    ),
  );
   getIt.registerLazySingleton<AreaRemoteDataSource>(
    () => AreaRemoteDataSourceImpl(
      httpClientWithInterceptor: getIt(),
    ),
  );

  // Http service
  getIt.registerLazySingleton(() => http.Client());
}
