import 'package:flutter/material.dart';
import 'package:memar_degla/core/services/permissions_handler.dart';
import 'package:memar_degla/core/widgets/custom_app_bar.dart';
import 'package:memar_degla/core/widgets/custom_nav_bar.dart';
import 'package:memar_degla/features/home/presentation/views/widgets/home_screen_body.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Welcome Ahmed',
        onNotificationPressed: () {
          PermissionService.instance.request(Permission.notification);
        },
      ),
      bottomNavigationBar: const CustomizedNavigationBar(),
      body: const HomeScreenBody(),
    );
  }
}
