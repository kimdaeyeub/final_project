import 'dart:async';

import 'package:final_project/features/auth/repo/auth_repository.dart';
import 'package:final_project/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepo;

  @override
  FutureOr<void> build() {
    _authRepo = ref.read(authRepo);
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _authRepo.login(email, password);
    });

    if (!state.hasError) {
      context.go("/home");
    } else {
      showFirebaseErrorSnack(context, state.error);
    }
  }
}

final loginViewModel = AsyncNotifierProvider<LoginViewModel, void>(
  () => LoginViewModel(),
);
