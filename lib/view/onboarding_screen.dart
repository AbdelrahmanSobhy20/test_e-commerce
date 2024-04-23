import 'package:e_commerce_app/view/register/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import '../customs/animateroute.dart';
import 'login/presentation/screens/login_screen.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Register',
      onFinish: () {
        Navigator.of(context).pushAndRemoveUntil(
            SlideRightTransition(page: Register()), (route) => false);
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: Colors.grey,
      ),
      skipTextButton: const Text(
        'Skip',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: const Text(
        'Login',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailingFunction: () {
        Navigator.of(context).pushAndRemoveUntil(
            SlideRightTransition(page: LoginScreen()), (route) => false);
      },
      totalPage: 3,
      headerBackgroundColor: Theme.of(context).colorScheme.background,
      pageBackgroundColor: Theme.of(context).colorScheme.background,
      background: [
        Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset("assets/Add to Cart-cuate.png", fit: BoxFit.fill,)) ),
        Container(
            width: 390,
            height: 390,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset("assets/Add to Cart-rafiki.png", fit: BoxFit.fill,)) ),
        Container(
            width: 400,
            height: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100)
            ),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.asset("assets/Add to Cart-amico.png", fit: BoxFit.fill,)) ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'On your way...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'to find the perfect looking Onboarding for your app?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'You’ve reached your destination.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Sliding with animation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 480,
              ),
              Text(
                'Start now!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Where everything is possible and customize your onboarding.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
