import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/profile/profile_app_icon.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    Key? key,
    required this.name,
    required this.icon,
    required this.selected,
    required this.tapHandler,
  }) : super(key: key);

  final String name;
  final String icon;
  final bool selected;
  final VoidCallback tapHandler;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? Colors.white : themeData.disabledColor,
          width: 1,
        ),
      ),
      child: ListTile(
        onTap: tapHandler,
        leading: AppIcon(
          iconPath: icon,
          size: 40.0,
        ),
        title: Text(name),
      ),
    );
  }
}
