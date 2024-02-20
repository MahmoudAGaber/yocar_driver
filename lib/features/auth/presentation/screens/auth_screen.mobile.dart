import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:driver_flutter/core/presentation/wizard_steps/wizard_steps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:flutter_common/core/presentation/app_step_slider.dart';
import 'package:flutter_common/core/presentation/buttons/app_back_button.dart';

import '../blocs/login.dart';
import '../widgets/login_form_builder.dart';

class AuthScreenMobile extends StatelessWidget {
  const AuthScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.neutralVariant99,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 16, left: 16,right: 16),
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        return state.loginPage.maybeMap(
                          orElse: () => AppBackButton(
                            onPressed: () {
                              locator<LoginBloc>().onBackPressed();
                            },
                          ),
                          enterNumber: (_) => const SizedBox(),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: BlocBuilder<LoginBloc, LoginState>(
                        buildWhen: (currentState, nextState) => currentState.loginPage != nextState.loginPage,
                        builder: (context, state) => LoginFormBuilder(loginState: state).header,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          BlocBuilder<LoginBloc, LoginState>(
            buildWhen: (currentState, nextState) => currentState.loginPage != nextState.loginPage,
            builder: (context, state) {
              return Column(
                children: [
                  /*if (state.loginPage.loginStep != null)
                    Container(
                      width: 185,
                      margin: const EdgeInsets.all(16),
                      child: AppStepSlider(
                        count: 4,
                        currentStep: state.loginPage.loginStep!,
                        onTap: (){},
                      ),
                    ),*/
                  SizedBox(height: 12,),
                  if (state.loginPage.wizardStep != null)
                    Container(
                      width: 300,
                      padding: const EdgeInsets.all(8),
                      child: WizardSteps(
                        count: 5,
                        selectedStep: state.loginPage.wizardStep ?? 0,
                      ),
                    ),
                  Text(
                    state.loginPage.title(context),
                    style: context.titleLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              );
            },
          ),
          Expanded(
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) => LoginFormBuilder(loginState: state).footer,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
