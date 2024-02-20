import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/core/presentation/app_step_slider.dart';
import 'package:flutter_common/core/presentation/buttons/app_primary_button.dart';
import 'package:ionicons/ionicons.dart';
import '../../../../config/locator/locator.dart';
import '../../../../core/blocs/onboarding_cubit.dart';
import '../widgets/onboarding_form_builder.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = locator<OnboardingCubit>();
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      body: Column(
        children: [
          SizedBox(
            child: SafeArea(
              top: true,
              minimum: EdgeInsets.only(top: 20,right: 6,left: 6),
              child: Padding(
                padding:EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    BlocBuilder<OnboardingCubit, int>(
                        builder: (context, state) {
                          return Align(
                            alignment: state == 0 ? Alignment.center : Alignment.centerRight,
                            child: CupertinoButton(
                                child: state == 0
                                    ? Text('Change Language',style: context.titleMedium?.copyWith(fontWeight: FontWeight.w500),)
                                    : Text(context.translate.skip,style: TextStyle(color: Colors.black54),),
                                onPressed: () {
                                  onboardingCubit.skip();
                                }),
                          );
                        }
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: BlocBuilder<OnboardingCubit, int>(
                        builder: (context, state) =>
                            OnboardingFormBuilder(onboardingItemIndex: state).buildHeader(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SafeArea(
              top: false,
              child: Column(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: BlocBuilder<OnboardingCubit, int>(
                      builder: (context, state) {
                        return OnboardingFormBuilder(onboardingItemIndex: state).buildFooter(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          BlocBuilder<OnboardingCubit, int>(
              builder: (context, state) {
                return state == 0
                    ? Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AppPrimaryButton(
                            onPressed: () {
                              onboardingCubit.nextPage();
                            },
                            child: Text(context.translate.saveChanges)),
                      ),
                    ),
                  ],
                )
                    : Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height*.3,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 185,
                          child: BlocBuilder<OnboardingCubit, int>(
                            builder: (context, state) {
                              return AppStepSlider(
                                  count: 6,
                                  currentStep: state,
                                  onTap: (){
                                    onboardingCubit.nextPage();
                                  }
                              );
                            },
                          ),
                        ),
                        Row(
                          children: [
                            AppPrimaryButton(
                                onPressed: () {
                                  onboardingCubit.previousPage();
                                },
                                child: Row(
                                  children: [
                                    Text("back"),
                                    const SizedBox(width: 8),
                                    const Icon(Ionicons.arrow_forward, size: 16),
                                  ],
                                )),
                          ],
                        )

                      ],
                    ),
                  ),
                );
              }),

        ],
      ),
    );
  }
}
