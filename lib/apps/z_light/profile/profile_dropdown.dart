import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/profile/profile_list_dialog.dart';
import 'package:hpx/apps/z_light/profile/view_all_profile.dart';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';


class ProfileDropdown extends StatelessWidget {
  const ProfileDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = Provider.of<ProfileProvider>(context);
    final tooltipController = JustTheController();
    final List<String> entries = <String>['A', 'B'];

    void closeTooltip(){
      tooltipController.hideTooltip();
    }

    void newProfile(){
      tooltipController.hideTooltip();
      profileListDialog(context);
    }


    void viewAllProfile(){
      tooltipController.hideTooltip();
      viewAllProfileDialog(context);
    }

    return JustTheTooltip(
      tailLength: 5,
      tailBaseWidth: 0,
      isModal: true,
      content:  Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          color: Colors.black,
        ),
        child: SizedBox(
          width: 400,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(2),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/zlight_icon.jpg",
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 8),
                            child: const Text("Default"),
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
              Container(
                color: Colors.grey.shade800,
                height: 50,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () => newProfile(),
                            style: textBtnStyleWhite,
                            child: SizedBox(
                              height: 40,
                              width: 150,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.add),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'New Profile',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 150,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                             onTap: viewAllProfile,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.grid_view_outlined
                                ),
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
        color: Colors.grey.shade800,
        elevation: 1.0,
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(0)
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/images/zlight_icon.jpg",
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text("Default"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}