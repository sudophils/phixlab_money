import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phixlab_money/utils/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultSpacing),
            child: Icon(
              CupertinoIcons.settings,
              color: fontHeading,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(defaultSpacing),
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(top: defaultSpacing),
                        width: 200,
                        height: 200,
                        child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(defaultRadius)),
                            child: Image.asset("assets/images/avatar.jpeg"))),
                    const Padding(
                      padding: EdgeInsets.only(top: defaultSpacing / 2),
                      child: Text("Jacob Timberline"),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: defaultSpacing / 2),
                      child: Text("jacob.timberline@gmail.com"),
                    ),
                    const Chip(
                      label: Text("Edit profile"),
                      backgroundColor: Colors.lightGreen,
                    )
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    Text("General",
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: fontHeading, fontWeight: FontWeight.w800)),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    buildProfileTile(context,
                        imageUrl: "assets/icons/location-1.png",
                        title: "Bank location",
                        subtitle: "7307 Grand ava, Flushing NY1347"),
                    buildProfileTile(context,
                        imageUrl: "assets/icons/wallet.png",
                        title: "My wallet",
                        subtitle: "7307 Grand ava, Flushing NY1347"),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    Text("Account",
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: fontHeading, fontWeight: FontWeight.w800)),
                    const SizedBox(
                      height: defaultSpacing,
                    ),
                    buildProfileTile(context,
                        imageUrl: "assets/icons/location-1.png",
                        title: "My Account",
                       ),
                    buildProfileTile(context,
                        imageUrl: "assets/icons/bell.png",
                        title: "Notification",
                    ),
                    buildProfileTile(context,
                        imageUrl: "assets/icons/lock-on.png",
                        title: "Privacy",
                        ),
                    buildProfileTile(context,
                        imageUrl: "assets/icons/info-circle.png",
                        title: "About",
                        )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileTile(BuildContext context,
      {required String imageUrl, required String title, String? subtitle}) {
    return ListTile(
        leading: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultSpacing,),
          child: Image.asset(imageUrl),
        ),
        title: Text(title,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: fontHeading, fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: fontSubHeading, fontWeight: FontWeight.w400)),
        trailing: const Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultSpacing),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: Colors.black26,
          ),
        ));
  }
}
