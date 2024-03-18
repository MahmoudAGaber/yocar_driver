import 'package:driver_flutter/config/locator/locator.dart';
import 'package:driver_flutter/core/extensions/extensions.dart';
import 'package:driver_flutter/core/presentation/slider_button.dart';
import 'package:driver_flutter/features/home/presentation/dialogs/launch_map_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_common/core/color_palette/color_palette.dart';
import 'package:flutter_common/core/enums/order_status.dart';
import 'package:flutter_common/core/extensions/extensions.dart';
import 'package:flutter_common/core/presentation/buttons/app_bordered_button.dart';
import 'package:flutter_common/core/presentation/buttons/app_list_button.dart';
import 'package:flutter_common/core/presentation/buttons/app_primary_button.dart';
import 'package:flutter_common/core/presentation/buttons/app_text_button.dart';
import 'package:flutter_common/core/presentation/waypoints_view/waypoints_view.dart';
import 'package:flutter_common/core/theme/animation_duration.dart';
import 'package:flutter_common/core/presentation/card_handle.dart';
import 'package:flutter_common/core/presentation/buttons/app_icon_button.dart';

import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../blocs/home.dart';
import '../../components/notice_bar_content.dart';
import '../../components/payment_method_select_field.dart';
import '../../dialogs/cancel_ride_dialog.dart';
import '../../dialogs/ride_options_dialog.dart';
import '../../dialogs/ride_safety_dialog.dart';

class ActiveOrderSheet extends StatelessWidget {
  final OnTripState state;

  const ActiveOrderSheet({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        context.responsive(
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: AppPrimaryButton(
                onPressed: () {
                  final place = state.order.waypoints[(state.order.destinationArrivedTo) ?? 0];
                  showDialog(
                    context: context,
                    useSafeArea: false,
                    builder: (context) => LaunchMapDialog(
                      place: place,
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Ionicons.navigate_circle),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(context.translate.navigate)
                  ],
                ),
              ),
            ),
          ),
          xl: const SizedBox(),
        ),
        Container(
          decoration: context.responsive(
            BoxDecoration(
              color: ColorPalette.primary20,
              borderRadius: BorderRadius.circular(30),
            ),
            xl: const BoxDecoration(),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: ColorPalette.neutralVariant99,
                ),
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SafeArea(
                  top: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const CardHandle(),

                      context.responsive(
                        AnimatedSwitcher(
                          duration: AnimationDuration.pageStateTransitionMobile,
                          child: (state.order.status == OrderStatus.driverAccepted && state.order.etaPickupAt != null)
                              ? NoticeBarContent(
                            icon: Ionicons.time,
                            text: "Picking up the rider in:",
                            trailingText: state.order.etaPickupAt?.minutesFromNow(context),
                          )
                              : state.order.status == OrderStatus.arrived
                              ? const NoticeBarContent(
                            icon: Ionicons.information_circle,
                            text: "Rider has been notified, Pickup the rider and start the ride",
                          )
                              : state.order.status == OrderStatus.started
                              ? NoticeBarContent(
                            icon: Ionicons.time,
                            text: "Heading to destination",
                            trailingText: state.order.expectedArrival(context),
                          )
                              : const SizedBox.shrink(),
                        ),
                        xl: const SizedBox(),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorPalette.neutral90),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Ionicons.person_circle,
                                color: ColorPalette.primary30,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${state.order.riderFirstName} ${state.order.riderLastName}",
                                    style: context.labelMedium,
                                  ),
                                  Text(
                                    state.order.serviceName,
                                    style: context.bodyMedium?.copyWith(
                                      color: ColorPalette.neutralVariant50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppIconButton(
                              icon: Ionicons.chatbubble,
                              onPressed: () {
                                locator<HomeBloc>().add(const HomeEvent.onShowChat());
                              },
                            ),
                            const SizedBox(width: 8),
                            AppIconButton(
                              icon: Ionicons.call,
                              onPressed: () {
                                launchUrlString("tel://${state.order.riderPhoneNumber}");
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 150,
                        child: WayPointsView(
                          waypoints: state.order.waypoints,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 16,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 10,
                              offset: const Offset(0, -5),
                            )
                          ],
                          color: ColorPalette.neutralVariant99,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PaymentMethodSelectField(
                              order: state.order,
                              onPressed: null,
                            ),
                            const SizedBox(
                              height: 9,
                            ),
                            const Divider(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    children: [
                                      // PaymentMethodSelectField(
                                      //   paymentMethod: order.paymentMethod,
                                      //   onPressed: () {
                                      //     locator<TrackOrderBloc>().showPayment();
                                      //   },
                                      // ),
                                      // const SizedBox(
                                      //   height: 9,
                                      // ),
                                      const Divider(
                                        height: 16,
                                      ),
                                      InkWell(
                                        onTap: (){
                                          showDialog(
                                            context: context,
                                            useSafeArea: false,
                                            builder: (context) {
                                              return  CancelRideDialog(orderId: state.order.id,);
                                            },
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Icon(Icons.close),
                                                Text(context.translate.cancelTrip,style: context.bodyMedium!.copyWith(color: Colors.red),),

                                              ],
                                            ),
                                            Text(context.translate.cancelRideMessage.substring(0,15),style: context.bodySmall!.copyWith(color: Colors.black54),)


                                            // AppTextButton(
                                            //   iconData: Ionicons.shield,
                                            //   text: context.translate.rideSafety,
                                            //   onPressed: () {
                                            //     showDialog(
                                            //       context: context,
                                            //       useSafeArea: false,
                                            //       builder: (context) => RideSafetyDialog(
                                            //         order: order,
                                            //       ),
                                            //     );
                                            //   },
                                            // ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 6,),
                                    ],
                                  ),
                                ),

                                // const Spacer(),
                                // AppTextButton(
                                //   iconData: Ionicons.shield,
                                //   isDense: true,
                                //   text: context.translate.rideSafety,
                                //   onPressed: () {
                                //     showDialog(
                                //       context: context,
                                //       useSafeArea: false,
                                //       builder: (context) => RideSafetyDialog(
                                //         order: state.order,
                                //       ),
                                //     );
                                //   },
                                // ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: AppBorderedButton(
                      //         title: context.translate.call,
                      //         isPrimary: true,
                      //         onPressed: () {
                      //           launchUrlString("tel://${state.order.riderPhoneNumber}");
                      //         },
                      //       ),
                      //     ),
                      //     const SizedBox(width: 12),
                      //     Expanded(
                      //       child: AppPrimaryButton(
                      //         onPressed: () {
                      //         },
                      //         child: Text(context.translate.message),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      AnimatedSwitcher(
                        duration: AnimationDuration.pageStateTransitionMobile,
                        child: Padding(
                          padding: const EdgeInsets.all(16).copyWith(bottom: 8),
                          child: state.order.status == OrderStatus.driverAccepted
                              ? SliderButton(
                                  text: "Slide to confirm your arrival",
                                  onSlided: () {
                                    locator<HomeBloc>().add(
                                      HomeEvent.onArrivedToPickupPoint(
                                        orderId: state.order.id,
                                      ),
                                    );
                                  },
                                )
                              : state.order.status == OrderStatus.arrived
                                  ? SliderButton(
                                      text: "Slide to confirm pickup",
                                      onSlided: () {
                                        locator<HomeBloc>().add(
                                          HomeEvent.onStripStarted(orderId: state.order.id),
                                        );
                                      },
                                    )
                                  : state.order.status == OrderStatus.started
                                      ? SliderButton(
                                          text: "Slide to confirm arrival",
                                          onSlided: () {
                                            locator<HomeBloc>().add(
                                              HomeEvent.onArrivedToDestination(
                                                order: state.order,
                                                destinationArrivedTo: (state.order.destinationArrivedTo ?? 0) + 1,
                                              ),
                                            );
                                          },
                                        )
                                      : const SizedBox.shrink(),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
