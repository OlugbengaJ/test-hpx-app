import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/profile/profile_app_icon.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
    required this.name,
    required this.icon,
    required this.tapHandler,
  }) : super(key: key);

  final String name;
  final String icon;
  final VoidCallback tapHandler;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: ListTile(
        onTap: tapHandler,
        leading: AppIcon(
          icon: icon,
          size: 40.0,
        ),
        title: Text(name),
      ),
    );
  }
}