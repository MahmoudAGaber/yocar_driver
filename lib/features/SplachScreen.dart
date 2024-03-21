
import 'package:driver_flutter/features/auth/presentation/screens/auth_screen.dart';
import 'package:driver_flutter/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/locator/locator.dart';
import '../core/blocs/auth_bloc.dart';
import '../core/router/app_router.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.repeat(reverse: true);
    _controller.forward();

    _controller.addStatusListener((status) {
      final loggedIn = locator<AuthBloc>().state.isAuthenticated;
      if (status == AnimationStatus.completed) {
        loggedIn
            ?Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()))
            :Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AuthScreen()));
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Animated background image
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * 2 * 3.14159, // Rotate by 360 degrees
                child: Opacity(
                  opacity: _animation.value,
                  child: Image.asset(
                    'assets/images/splash.png', // Replace with your image asset
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
