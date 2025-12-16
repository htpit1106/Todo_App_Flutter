import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/model/entities/profile/profile_entity.dart';
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
  late final ProfileProvider provider;
  @override
  void initState() {
    super.initState();
    provider = context.read<ProfileProvider>();
    provider.getProfileById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context),
          // CÁC MỤC MENU
          _buildMenu(context, provider)
        ],
      ),
    );
  }

  _buildMenu(BuildContext context, ProfileProvider provider) {
    return Expanded(
      child: ListView(
        children: [
          MenuItem(
            icon: Icons.edit,
            title: S.of(context).menu_update_profile,
            onTap: () => provider.onPressUpdateProfile(),
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
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Selector<ProfileProvider, ProfileEntity?>(
      selector: (_, provider) => provider.profile,
      builder: (BuildContext context, profile, Widget? child) {
        return AppBar(
          leading: IconButton(
            onPressed: () {
              provider.onBackHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: profile?.avatarLink != null
                    ? Image.network(profile!.avatarLink!).image
                    : AssetImage(AppIcons.icAvatar),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(profile?.name ?? "", style: AppTextStyle.bodyMedium),
                  Text(profile?.email ?? "", style: AppTextStyle.grayBodySmall),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
