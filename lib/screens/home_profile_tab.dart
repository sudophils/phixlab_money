import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../widget/profile_account_info_tile.dart';

class HomeProfileTab extends StatelessWidget {
  const HomeProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: fontSubHeading,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: defaultSpacing),
            child: Icon(
              Icons.settings,
              color: fontSubHeading,
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: defaultSpacing,
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(defaultRadius)),
                      child: Image.asset(
                        "assets/images/avatar.jpeg",
                        width: 100,
                      ),
                    ),
                    const SizedBox(height: defaultSpacing / 3),
                    Text(
                      "Jacob Timberline",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.w700, color: fontHeading),
                    ),
                    Text(
                      "jacobtimberline@gmail.com",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(color: fontSubHeading),
                    ),
                    const SizedBox(
                      height: defaultSpacing / 2,
                    ),
                    const Chip(
                      backgroundColor: primaryLight,
                      label: Text("Edit Profile"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: defaultSpacing),
                    child: Text(
                      "General",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.w700, color: fontHeading),
                    ),
                  ),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const GeneralAccountInfoTile(
                      title: "Bank Location",
                      subTitle: "7307 Grand Avenue, Flushing NY3293",
                      imageUrl: "assets/icons/location-1.png"),
                  const GeneralAccountInfoTile(
                      title: "My Wallet",
                      subTitle: "Manage your saved wallet",
                      imageUrl: "assets/icons/wallet.png"),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: defaultSpacing),
                    child: Text(
                      "Account",
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.w700, color: fontHeading),
                    ),
                  ),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const ProfileAccountInfoTile(
                      iconUrl: "assets/icons/user-1.png",
                      heading: "My Account"),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const ProfileAccountInfoTile(
                      iconUrl: "assets/icons/bell.png",
                      heading: "Notification"),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const ProfileAccountInfoTile(
                      iconUrl: "assets/icons/lock-on.png", heading: "Privacy"),
                  const SizedBox(
                    height: defaultSpacing,
                  ),
                  const ProfileAccountInfoTile(
                      iconUrl: "assets/icons/info-circle.png",
                      heading: "About"),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
