import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:youthfoundationofindia/design_systems/colors/colors.dart';

class AppStoreImage1 extends StatelessWidget {
  const AppStoreImage1({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/register');
        },
        child: Image.asset('assets/app_store.png', height: 40));
  }
}

class AppStoreImage extends StatelessWidget {
  const AppStoreImage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPopup(
      showArrow: false,
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      barrierColor: Colors.transparent,
      contentDecoration: const BoxDecoration(color: AppColors.primary600),
      content: SizedBox(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/register'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "1. Register Member ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/volunteerregister'),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    "2. Volunteer Job",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ]),
      ),
      child: Image.asset('assets/app_store.png', height: 40),
    );
  }
}
