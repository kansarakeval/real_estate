import 'package:flutter/material.dart';
import 'package:real_estate/screen/dash/view/dash_screen.dart';
import 'package:real_estate/screen/home/view/home_screen.dart';
import 'package:real_estate/screen/intro/view/intro_screen.dart';
import 'package:real_estate/screen/profile/view/profile.dart';
import 'package:real_estate/screen/signin/view/signin_screen.dart';
import 'package:real_estate/screen/signup/view/signup_screen.dart';
import 'package:real_estate/screen/splash/view/splash_screen.dart';

Map<String,WidgetBuilder> app_routes={
  '/': (context) => const SplashScreen(),
  'intro':(context) => const IntroScreen(),
  'signIn':(context) => const SignInScreen(),
  'signUp': (context) => const SignUpScreen(),
  'home':(context) => const HomeScreen(),
  'dash':(context) => const DashScreen(),
  'profile':(context) => const ProfileScreen(),
};