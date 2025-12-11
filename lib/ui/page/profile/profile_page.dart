import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/repository/auth_repository.dart';
import 'package:todo_app/repository/profile_repository.dart';
import 'package:todo_app/ui/page/profile/profile_navigator.dart';
import 'package:todo_app/ui/page/profile/profile_provider.dart';
import 'package:todo_app/ui/page/profile/widget/menu_item.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return ProfileProvider(
          navigator: ProfileNavigator(context: context),
          authRepo: context.read<AuthRepository>(),
          profileRepo: context.read<ProfileRepository>(),
        );
      },
      child: ProfilePageChild(),
    );
  }
}

class ProfilePageChild extends StatefulWidget {
  const ProfilePageChild({super.key});

  @override
  State<ProfilePageChild> createState() => _ProfilePageChildState();
}

class _ProfilePageChildState extends State<ProfilePageChild> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileProvider>().getProfileById();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(
        title: _buildHeader(context),
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {
          provider.onBackHome();

        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),

          // CÁC MỤC MENU
          Expanded(
            child: ListView(
              children: [
                MenuItem(
                  icon: Icons.edit,
                  title: S.of(context).menu_update_profile,
                  onTap: () => provider.onPressUpdateProfile(),
                ),
                MenuItem(
                  icon: Icons.lock_outline,
                  title: S.of(context).menu_change_password,
                  // onTap: provider.goToChangePassword,
                ),
                MenuItem(
                  icon: Icons.shield_outlined,
                  title: S.of(context).menu_terms_and_policy,
                  // onTap: provider.goToTermsAndPolicy,
                ),
                MenuItem(
                  icon: Icons.logout,
                  title: S.of(context).menu_logout,
                  onTap: provider.logout,
                  isDestructive: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: value.profile?.avatarLink != null
                    ? Image.network(value.profile!.avatarLink!).image
                    : AssetImage(AppIcons.icAvatar),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(value.profile?.name ?? "", style: AppTextStyle.bodyMedium),
                  Text(value.profile?.email ?? "", style: AppTextStyle.grayBodySmall),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
