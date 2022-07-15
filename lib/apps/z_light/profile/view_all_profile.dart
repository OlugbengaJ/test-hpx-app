import 'package:flutter/material.dart';
import 'package:hpx/apps/z_light/profile/profile_list_dialog.dart';
import 'package:hpx/models/apps/zlightspace_models/profiles/profiles_model.dart';
import 'package:hpx/providers/profile_provider/profile_provider.dart';
import 'package:hpx/utils/constants.dart';
import 'package:hpx/widgets/theme.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

TextEditingController _textCtrl = TextEditingController();
Profile? editingProfile;

void browse(BuildContext context) {
  Navigator.pop(context);
}

void newProfile(BuildContext context) {
  // set the text controller default
  final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
  profileProvider.resetSelectedProfile();
  _textCtrl.text = profileProvider.selectedProfile.name;

  // open the profile list dialog
  profileListDialog(context, _textCtrl);
}

void duplicateProfile(BuildContext context) {
  final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
  profileProvider.duplicateProfile(editingProfile!.id);
  Navigator.pop(context);
  newProfile(context);
}

Future<void> _showDefaultMoreDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {},
              child: const Text('Rename'),
            ),
            SimpleDialogOption(
              onPressed: () {
                duplicateProfile(context);
              },
              child: const Text('Duplicate'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: const Text('Export'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                confirmDeleteProfileDialog(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      });
}

Future<void> confirmDeleteProfileDialog(BuildContext context) async {
  final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(top: 40, bottom: 10),
                child: Column(children: [
                  Text(
                    'Delete ${editingProfile!.name} profile?',
                    style: h4Style,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                  ),
                  Container(
                    width: 250,
                    margin: const EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: textBtnStyleWhite,
                                  child: SizedBox(
                                      height: 40,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text('Cancel'))
                                          ]))),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    profileProvider
                                        .deleteProfile(editingProfile!.id);
                                    Navigator.of(context).pop();
                                  },
                                  style: textBtnStyleBlack,
                                  child: SizedBox(
                                      height: 40,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text('Delete'))
                                          ]))),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ])),
          ],
        );
      });
}

Future<void> _showMoreDialog(BuildContext context) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                duplicateProfile(context);
              },
              child: const Text('Duplicate'),
            ),
            SimpleDialogOption(
              onPressed: () {},
              child: const Text('Export'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.of(context).pop();
                confirmDeleteProfileDialog(context);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      });
}

Future<void> viewAllProfileDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        content: Container(
          //height: 700,
          width: 900,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text("My Profiles"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: 800,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Center(
                                  child: Container(
                                    height: 28,
                                    width: 141,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () => newProfile(context),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.add,
                                              color: Color(0xFF212121),
                                            ),
                                            Text(
                                              "New Profile",
                                              style: TextStyle(
                                                  color: Color(0xFF212121)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Center(
                                  child: Container(
                                    height: 28,
                                    width: 141,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 1),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(4)),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: GestureDetector(
                                        onTap: () => browse(context),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            ImageIcon(
                                              AssetImage(
                                                  "assets/images/icons/import.png"),
                                              color: Color(0xFF212121),
                                            ),
                                            Text(
                                              "Import",
                                              style: TextStyle(
                                                  color: Color(0xFF212121)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 8),
                                        child: const Text(
                                            "Auto profile switching"),
                                      ),
                                      Container(
                                        height: 28,
                                        child: ToggleSwitch(
                                          minWidth: 50,
                                          cornerRadius: 100,
                                          activeBgColors: const [
                                            [Colors.white],
                                            [Colors.white]
                                          ],
                                          activeFgColor: Colors.black,
                                          inactiveBgColor: Colors.grey,
                                          inactiveFgColor: Colors.black,
                                          initialLabelIndex: 0,
                                          totalSwitches: 2,
                                          labels: const ['OFF', 'ON'],
                                          radiusStyle: true,
                                          onToggle: (index) {
                                            debugPrint('switched to: $index');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              child: Container(
                                height: 28,
                                width: 82,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 1),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.all(2),
                                      child: Text("A - Z"),
                                    ),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child:
                          Consumer<ProfileProvider>(builder: (_, provider, __) {
                        return Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            width: 621,
                            height: 328,
                            color: const Color(0xFF212121),
                            child: GridView.count(
                                padding: const EdgeInsets.all(2),
                                crossAxisCount: 5,
                                //childAspectRatio: 1.5,
                                children: provider.profiles.map((profile) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.white, width: 1),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Image.asset(
                                                Constants.zlightIcon,
                                                height: 60,
                                              ),
                                              Column(
                                                children: [
                                                  SizedBox(
                                                    width: 20,
                                                    child: MouseRegion(
                                                      cursor: SystemMouseCursors
                                                          .click,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          editingProfile =
                                                              profile;
                                                          if (profile.id == 0) {
                                                            _showDefaultMoreDialog(
                                                                context);
                                                          } else {
                                                            _showMoreDialog(
                                                                context);
                                                          }
                                                        },
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 8),
                                                          child: const Icon(
                                                              Icons.more_vert),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: Text(profile.name),
                                      ),
                                    ],
                                  );
                                }).toList()));
                      }),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Container(
                          width: 124,
                          height: 38,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    Constants.done,
                                    style: TextStyle(color: Color(0xFF212121)),
                                  ),
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
      );
    },
  );
}
