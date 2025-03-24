import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_ai/auth/screens/sign_in_page/sign_in_page.dart';
import '../../../core/styles/sizes.dart';
import '../../../core/styles/text_styles.dart';
import '../../../core/utils/extensions/context.dart';
import '../../../core/utils/helper_methods.dart';
import 'settings_account_page.dart';
import 'settings_general_page.dart';
import 'settings_how_to_add_recipe_page.dart';
import '../widgets/settings_list_tile_widgets.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100, body: const SettingsPageBody());
  }
}

class SettingsPageBody extends StatefulWidget {
  const SettingsPageBody({super.key});

  @override
  State<SettingsPageBody> createState() => _SettingsPageBodyState();
}

class _SettingsPageBodyState extends State<SettingsPageBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: PaddingSizes.mdl, vertical: PaddingSizes.mdl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: AppTextStyles().lThick,
                ),
              ),
              const SizedBox(height: PaddingSizes.sm),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: SettingsListTileWidget(
                  title: 'Meal AI Pro',
                  leadingFaIcon: FaIcon(
                    Icons.add_circle_outline,
                    color: context.primaryColor,
                  ),
                  trailingText: 'Inactive',
                  paddingSize: PaddingSizes.xl,
                ),
              ),
              const SizedBox(height: PaddingSizes.xxl),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SettingsGeneralPage())),
                      child: SettingsListTileWidget(
                          title: 'General',
                          leadingFaIcon: FaIcon(CupertinoIcons.settings,
                              color: context.primaryColor),
                          paddingSize: 0,
                          trailingText: ''),
                    ),
                    Divider(
                        indent: PaddingSizes.xxxl, color: Colors.grey.shade300),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SettingsAccountPage())),
                      child: SettingsListTileWidget(
                          title: 'Account',
                          leadingFaIcon: FaIcon(
                            Icons.person_2_outlined,
                            color: context.primaryColor,
                          ),
                          paddingSize: 0,
                          trailingText: ''),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: PaddingSizes.xl),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) =>
                            const SettingsHowToAddRecipePage()))),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: SettingsListTileWidget(
                    title: 'How To Add Recipes',
                    leadingFaIcon: FaIcon(
                      Icons.bookmark_added_outlined,
                      color: context.primaryColor,
                    ),
                    trailingText: '',
                    paddingSize: PaddingSizes.xl,
                  ),
                ),
              ),
              const SizedBox(height: PaddingSizes.xl),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    SettingsListTileWidget(
                        title: 'Privacy Policy',
                        leadingFaIcon: FaIcon(CupertinoIcons.settings,
                            color: context.primaryColor),
                        paddingSize: 0,
                        trailingText: ''),
                    Divider(
                        indent: PaddingSizes.xxxl, color: Colors.grey.shade300),
                    SettingsListTileWidget(
                        title: 'Twitter',
                        leadingFaIcon: FaIcon(FontAwesomeIcons.twitter,
                            color: context.primaryColor),
                        paddingSize: 0,
                        trailingText: ''),
                    Divider(
                      indent: PaddingSizes.xxxl,
                      color: Colors.grey.shade300,
                    ),
                    InkWell(
                      onTap: () async {
                        launchHelperMethod(Uri.parse(
                            'https://instagram.com/savorecipe?igshid=OGQ5ZDc2ODk2ZA=='));
                      },
                      child: SettingsListTileWidget(
                          title: 'Instagram',
                          leadingFaIcon: FaIcon(
                            FontAwesomeIcons.instagram,
                            color: context.primaryColor,
                          ),
                          paddingSize: 0,
                          trailingText: ''),
                    ),
                    Divider(
                        indent: PaddingSizes.xxxl, color: Colors.grey.shade300),
                    InkWell(
                      onTap: () async {
                        launchHelperMethod(Uri.parse(
                            'mailto:smith@example.org?subject=News&body=New%20plugin'));
                      },
                      child: SettingsListTileWidget(
                          title: 'Support',
                          leadingFaIcon: FaIcon(Icons.person_2_outlined,
                              color: context.primaryColor),
                          paddingSize: 0,
                          trailingText: ''),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: PaddingSizes.xl),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () async {
                    try {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInPage()),
                        (route) => false,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Logout failed: ${e.toString()}')),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(PaddingSizes.mdl),
                    child: Row(
                      children: [
                        FaIcon(Icons.logout, color: Colors.red),
                        SizedBox(width: PaddingSizes.lg),
                        Text('Log Out', style: TextStyle(color: Colors.red)),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
