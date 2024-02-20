import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/core/blocs/auth_bloc.dart';
import 'package:driver_flutter/core/blocs/route.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:flutter_common/core/presentation/avatars/app_avatar.dart';
import 'package:driver_flutter/core/router/nav_item.dart';
import 'package:driver_flutter/gen/assets.gen.dart';
import 'package:flutter_common/core/presentation/menu/app_drawer_item.dart';

class AppDrawer extends StatelessWidget {
  final bool showHeader;

  const AppDrawer({
    super.key,
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: locator<AuthBloc>(),
        ),
        BlocProvider.value(
          value: locator<RouteCubit>(),
        ),
      ],
      child: Container(
        width: 280,
        decoration: const BoxDecoration(
          color: ColorPalette.neutralVariant99,
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(65),
          ),
        ),
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,size: 22,)),
                ),
                SizedBox(height: 8,),
                if (showHeader)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 1.5,
                          child: AppAvatar(
                            avatar: state.map(
                              authenticated: (authenticated) => authenticated.avatar,
                              unauthenticated: (unauthenticated) => none(),
                            ),
                            defaultAvatarPath: Assets.avatars.a1.path,
                          ),
                        ),
                        const SizedBox(height: 8),
                        state.map(
                            unauthenticated: (_) => const SizedBox(),
                            authenticated: (authenticated) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    authenticated.profile.fullName,
                                    style: context.labelLarge,
                                  ),
                                  Text(
                                    authenticated.profile.email!,
                                    style: context.bodySmall,
                                  )
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                Container(
                  child: SingleChildScrollView(
                    child: BlocBuilder<RouteCubit, NavItem>(
                      builder: (context, stateRoute) {
                        return Column(
                          children: [
                            context.responsive(
                              const SizedBox(),
                              xl: AppDrawerItem(
                                icon: NavItem.home.icon,
                                title: NavItem.home.name(context),
                                isSelected: stateRoute == NavItem.home,
                                onPressed: () => NavItem.home.onPressed(context),
                              ),
                            ),
                            ...(state.isAuthenticated
                                    ? signedInNavItems.where(
                                        (element) => context.responsive(
                                          true,
                                          xl: element != NavItem.announcements,
                                        ),
                                      )
                                    : signedOutNavItems)
                                .map(
                              (e) => AppDrawerItem(
                                icon: e.icon,
                                title: e.name(context),
                                isSelected: stateRoute == e,
                                onPressed: () => e.onPressed(context),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                SafeArea(
                  top: false,
                  child: AppDrawerItem(
                    icon: NavItem.logout.icon,
                    title: NavItem.logout.name(context),
                    onPressed: () => NavItem.logout.onPressed(context),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
