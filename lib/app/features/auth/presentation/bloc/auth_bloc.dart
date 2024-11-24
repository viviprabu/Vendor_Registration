import 'package:finance_app/app/features/auth/domain/entities/token.dart';
import 'package:finance_app/app/features/auth/domain/entities/user.dart';
import 'package:finance_app/app/features/auth/domain/usecases/get_logged_user_detail.dart';
import 'package:finance_app/app/features/auth/domain/usecases/is_logged_in.dart';
import 'package:finance_app/app/features/auth/domain/usecases/sign_in.dart';
import 'package:finance_app/app/features/auth/domain/usecases/sign_out.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignIn signIn;
  SignOut signOut;
  IsLoggedIn isLoggedIn;
  GetLoggedUserDetail getLoggedUserDetail;

  AuthBloc({
    required this.signIn,
    required this.signOut,
    required this.isLoggedIn,
    required this.getLoggedUserDetail,
  }) : super(AuthInitialState()) {
    on<AuthSignInEvent>((event, emit) async {
      emit(AuthLoadingState());
      final failureOrToken = await signIn(event.userName, event.password);
      //print(failureOrToken);
      //final errorMessage = 'Invalid Username or Password';
      failureOrToken.fold(
        (failure) => emit(AuthErrorState(failure.toString())),
        (token) => emit(AuthenticatedState(token)),
      );
    });

    on<AuthSignOutEvent>((event, emit) async {
      emit(AuthLoadingState());
      final failureOrUnit = await signOut();
      failureOrUnit.fold(
        (failure) => emit(AuthErrorState(failure.toString())),
        (_) => emit(AuthSignedOutState()),
      );
    });

    on<AuthIsSignedInEvent>((event, emit) async {
      emit(AuthLoadingState());
      final isSignedIn = await isLoggedIn();
      if (!isSignedIn) {
        emit(AuthErrorState('User is not signed in'));
      }
      emit(AuthIsSignedInState(isSignedIn));
    });

    on<AuthInitialEvent>((event, emit) {
      emit(AuthInitialState());
    });

    on<GetAuthenicatedUserEvent>((event, emit) async {
      //emit(AuthLoadingState());
      final failureOrUser = await getLoggedUserDetail();
      failureOrUser.fold(
        (failure) => emit(AuthErrorState(failure.toString())),
        (user) => emit(GetAuthenicatedUserState(user)),
      );
    });
  }
}
