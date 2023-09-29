import 'dart:async';

import 'package:final_project/features/auth/models/user_model.dart';
import 'package:final_project/features/auth/repo/auth_repository.dart';
import 'package:final_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignUpViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> signUp(
      String email, String password, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authRepo.signUp(email, password);
    });

    if (!state.hasError) {
      context.go("/home");
    } else {
      showFirebaseErrorSnack(context, state.error);
    }
  }
}

final signUpViewModel = AsyncNotifierProvider<SignUpViewModel, void>(
  () => SignUpViewModel(),
);
