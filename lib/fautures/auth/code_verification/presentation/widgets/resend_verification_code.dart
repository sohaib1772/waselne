import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_cubit.dart';
import 'package:waselne/fautures/auth/code_verification/presentation/cubit/code_verification_states.dart';
import 'package:waselne/generated/locale_keys.g.dart';

class ResendVerificationCode extends StatefulWidget {
   ResendVerificationCode({super.key,required this.email,this.isPassword = false});
  String email;
  bool isPassword;
  @override
  State<ResendVerificationCode> createState() => _ResendVerificationCodeState();
}

class _ResendVerificationCodeState extends State<ResendVerificationCode> {
  bool _isButtonDisabled = true;
  int _secondsRemaining = 30;
  Timer? _timer;

  void _startTimer() {
    setState(() {
      _isButtonDisabled = true;
      _secondsRemaining = 30;
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _isButtonDisabled = false;
        });
      }
    });
  }

  void _resendCode() async{
    _startTimer();
    if(widget.isPassword){
      await context.read<CodeVerificationCubit>().resendPasswordCode(widget.email);
    }
    else{
       await context.read<CodeVerificationCubit>().resendCode(widget.email,true);
    }

  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocListener<CodeVerificationCubit, CodeVerificationStates>(
          listener: (context, state) {
            if (state is CodeVerificationResendSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(LocaleKeys.auth_resentCode.tr())));
            }
          },
          child: TextButton(
          onPressed: _isButtonDisabled ? null : _resendCode,
          child: Text(_isButtonDisabled ? _secondsRemaining.toString() : LocaleKeys.auth_resendCode.tr(),style: TextStyle(color: Colors.blue,)),
        ),
        )
        
      ],
    );
  }
}