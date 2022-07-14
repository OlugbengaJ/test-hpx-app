import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/profile/profile_list_dialog.dart';
import 'package:hpx/apps/z_light/profile/view_all_profile.dart';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';


class ProfileDropdown extends StatefulWidget {
  const ProfileDropdown({Key? key}) : super(key: key);

  @override
  State<ProfileDropdown> createState() => _ProfileDropdownState();
}

class _ProfileDropdownState extends State<ProfileDropdown> {
  final tooltipController = JustTheController();

  void closeTooltip() {
    tooltipController.hideTooltip();
  }

  void newProfile() {
    tooltipController.hideTooltip();
    profileListDialog(context);
  }

  void viewAllProfile() {
    tooltipController.hideTooltip();
    viewAllProfileDialog(context);
  }

  
  @override
  Widget build(BuildContext context) {
    final tooltipController = JustTheController();

    void closeTooltip() {
      tooltipController.hideTooltip();
    }

    void newProfile() {
      tooltipController.hideTooltip();
      profileListDialog(context);
    }

    void viewAllProfile() {
      tooltipController.hideTooltip();
      viewAllProfileDialog(context);
    }

    return JustTheTooltip(
      tailLength: 5,
      tailBaseWidth: 0,
      isModal: true,
      content: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Color(0xFF222222),
        ),
        child: SizedBox(
          width: 350,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                child: Consumer<ProfileProvider>(builder: (_, provider, __) {
                  return Row(
                    children: [
                      Image.asset(
                        Constants.zImage,
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(provider.getCurrentProfile().name),
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: newProfile,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Color(0xFF212121),
                                ),
                                Text(
                                  "New Profile",
                                  style: TextStyle(color: Color(0xFF212121)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(4)),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: viewAllProfile,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.grid_view_outlined),
                                Text("View All"),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      controller: tooltipController,
      borderRadius: BorderRadius.circular(0),
      child: Material(
        color: const Color.fromRGBO(18, 18, 18, 1),
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              width: 200,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(0)),
              child: Consumer<ProfileProvider>(
                builder: (_, provider, __) {
                  return Row(
                    children: [
                      Image.asset(
                        Constants.zImage,
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(provider.getCurrentProfile().name),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

