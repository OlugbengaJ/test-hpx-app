import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/profile/app_list_tile.dart';
import 'package:hpx/apps/z_light/profile/profile_app_icon.dart';
import 'package:hpx/apps/z_light/workspace/widgets/round_button.dart';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/utils/os_file_utility.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';

Future<void> profileListDialog(
    BuildContext context, TextEditingController textController) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          width: 700,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // close dialog toolbar
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(top: 8.0, right: 8.0),
                        child: Tooltip(
                          message: Constants.close,
                          child: RoundButton(
                            onTapDown: () => Navigator.pop(context),
                            onTapUp: () {},
                            size: 24,
                            icon: Icons.close,
                            iconColor: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // content area
                Row(
                  children: [
                    // left section: app preview
                    Container(
                      margin: EdgeInsets.zero,
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            height: 60,
                            width: 60,
                            child: Consumer<ProfileProvider>(
                              builder: (_, provider, __) {
                                return AppIcon(
                                    icon: provider.selectedProfile.icon);
                              },
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text(
                              'Upload a picture',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),

                          // text field for the selected profile
                          Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            height: 40,
                            child: Consumer<ProfileProvider>(
                              builder: (_, provider, __) => TextField(
                                controller: textController,
                                enabled: provider.allowEdit,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.zero),
                                      borderSide: BorderSide.none),
                                  fillColor: Theme.of(context).primaryColor,
                                  filled: true,
                                  contentPadding: const EdgeInsets.all(0),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // right section
                    Container(
                      margin: EdgeInsets.zero,
                      child: Column(
                        children: [
                          // dialog title row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 480,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(16),
                                      child:
                                          const Text(Constants.selectAppTitle),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // browse and sort row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 16.0, bottom: 16.0),
                                width: 480,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 111,
                                      height: 28,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: GestureDetector(
                                          onTap: () =>
                                              OSFileUtility.openFilePicker(),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Browse',
                                                style: TextStyle(
                                                  color: Color(0xFF212121),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      child: Container(
                                        height: 28,
                                        width: 120,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.all(4),
                                              child: Text('A - Z'),
                                            ),
                                            Icon(Icons.arrow_drop_down)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // apps selection section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // list of system apps including the default Z app
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 16.0, bottom: 16.0),
                                height: 350,
                                color: const Color(0xFF212121),
                                child: Consumer<ProfileProvider>(
                                  builder: (_, provider, __) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          width: 480,
                                          height: 350,
                                          child: ListView.builder(
                                            padding: const EdgeInsets.all(2.0),
                                            itemCount: provider.apps.length,
                                            itemBuilder: (context, index) {
                                              return AppListTile(
                                                name: provider.apps[index].name,
                                                icon: provider.apps[index].icon,
                                                tapHandler: () {
                                                  provider
                                                      .updateSelectedProfile(
                                                          provider
                                                              .apps[index].name,
                                                          provider
                                                              .apps[index].icon,
                                                          '');
                                                  textController.text = provider
                                                      .selectedProfile.name;
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                          // dialog footer with action buttons
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 16.0,
                                  bottom: 16.0,
                                ),
                                width: 480,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(Constants.cancel),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                      margin: EdgeInsets.zero,
                                      child: Consumer<ProfileProvider>(
                                        builder: (_, provider, __) =>
                                            TextButton(
                                          onPressed: () {
                                            if (provider.profileExists(
                                                textController.text)) {
                                              // show modal
                                            } else {
                                              provider.addProfile(
                                                  textController.text);
                                              Navigator.pop(context);
                                            }
                                          },
                                          style: textBtnStyleWhite,
                                          child: const SizedBox(
                                            height: 40,
                                            width: 100,
                                            child: Center(
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  Constants.add,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
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
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
