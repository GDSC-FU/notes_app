import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes/features/home/presentation/views/home_screen.dart';
import 'package:notes/features/login%20&%20registration/data/models/user_model.dart';

import '../../../../constants.dart';
import '../../../../core/utils/cache_helper.dart';
import '../../../../core/utils/shared_methods/shared_methods.dart';
import '../views/login_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  FirebaseAuth auth = FirebaseAuth.instance;

  CollectionReference usersReference =
      FirebaseFirestore.instance.collection('users');

  IconData passIcon = Icons.visibility_outlined;
  bool obscureText = true;

  void changePasswordVisibility() {
    obscureText = !obscureText;
    passIcon =
        obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibility());
  }

  bool loginLoading = false;

  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    emit(LoginLoadingState());
    loginLoading = true;
    auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      if (kDebugMode) {
        print(value.user!.uid);
        print(value.user!.email);
      }
      uId = value.user!.uid;
      CasheHelper.saveData(key: 'uId', value: uId).then((value) {
        loginLoading = false;
        navigateAndFinish(context, const HomeScreen());
        emit(LoginSuccessState());
      });
    }).catchError((error) {
      if (kDebugMode) {
        print(error);
      }
      loginLoading = false;
      emit(LoginErrorState(error.toString()));
    });
  }

  bool registerLoading = false;

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String phone,
    required BuildContext context,
  }) async {
    emit(RegisterLoadingState());
    registerLoading = true;
    auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      String uId = value.user!.uid;
      usersReference
          .doc(uId)
          .set(
            UserDataModel(
              userId: uId,
              name: name,
              email: email,
              password: password,
              image: null,
              phone: phone,
              createdTime: DateTime.now(),
            ).toMap(),
          )
          .then((value) {
        CasheHelper.saveData(key: 'uId', value: uId).then((value) {
          registerLoading = false;
          navigateAndFinish(context, const HomeScreen());
          emit(RegisterSuccessState());
        });
      }).catchError((error) {
        registerLoading = false;
        emit(RegisterErrorState(error.toString()));
      });
    }).catchError((error) {
      registerLoading = false;
      emit(RegisterErrorState(error.toString()));
    });
  }

void signOut(context) {
  CasheHelper.removeDate(key: 'uId').then((value) async {
      await FirebaseAuth.instance.signOut();
      navigateAndFinish(context, const LoginScreen());
    },
  );
}

  void handleAuthErrors(String msg) {
    if (msg.contains('The email address is badly formatted')) {
      showToast(
        text: 'The email address is badly formatted',
        state: ToastStates.ERROR,
      );
    } else if (msg.contains('[firebase_auth/user-not-found]')) {
      showToast(
        text: 'User not found, make sure you\'ve entered the correct email.',
        state: ToastStates.ERROR,
      );
    } else if (msg.contains('[firebase_auth/wrong-password]')) {
      showToast(
        text: 'Wrong password.',
        state: ToastStates.ERROR,
      );
    } else if (msg.contains('A network error')) {
      showToast(
        text: 'Please, check your internet connection.',
        state: ToastStates.ERROR,
      );
    } else if (msg.contains('[firebase_auth/unknown]')) {
      showToast(
        text: 'Something went wrong.\n Check your internet connection.',
        state: ToastStates.ERROR,
      );
    } else if (msg.contains('[firebase_auth/weak-password]')) {
      showToast(
        text: 'Password should be at least 6 characters.',
        state: ToastStates.ERROR,
      );
    } else {
      showToast(
        text: msg.substring(msg.indexOf(']') + 1),
        state: ToastStates.ERROR,
      );
    }
  }
}
