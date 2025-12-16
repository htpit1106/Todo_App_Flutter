import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/model/entities/profile/profile_entity.dart';
import 'package:todo_app/repository/profile_repository.dart';
import 'package:todo_app/services/storage_service.dart';
import 'package:todo_app/ui/loading/app_loading_indicator.dart';
import 'package:todo_app/ui/page/profile/update_profile/update_profile_navigator.dart';
import 'package:todo_app/ui/page/profile/update_profile/update_profile_provider.dart';
import 'package:todo_app/ui/widgets/app_text_form_field.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';
import 'package:todo_app/utils/app_date_utils.dart';
import 'package:todo_app/utils/app_image_load_utils.dart';
import 'package:todo_app/utils/app_validator.dart';
import 'package:todo_app/generated/l10n.dart';

class UpdateProfilePage extends StatelessWidget {
  final ProfileEntity profileEntity;

  const UpdateProfilePage({super.key, required this.profileEntity});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UpdateProfileProvider(
        profileRepo: context.read<ProfileRepository>(),
        navigator: UpdateProfileNavigator(context: context),
        storageService: StorageService(),
      ),
      child: UpdateProfilePageChild(profileEntity: profileEntity),
    );
  }
}

class UpdateProfilePageChild extends StatefulWidget {
  final ProfileEntity profileEntity;

  const UpdateProfilePageChild({super.key, required this.profileEntity});

  @override
  State<UpdateProfilePageChild> createState() => _UpdateProfilePageChildState();
}

class _UpdateProfilePageChildState extends State<UpdateProfilePageChild> {
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController birthController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime selectedTime = DateTime.now();
  late final UpdateProfileProvider provider;

  @override
  void initState() {
    super.initState();
    final profile = widget.profileEntity;

    nameController = TextEditingController(text: profile.name ?? '');
    emailController = TextEditingController(text: profile.email ?? '');

    if (profile.birth != null) {
      selectedTime = AppDateUtils.toDateTime(profile.birth!);
      birthController = TextEditingController(text: AppDateUtils.formatDate(selectedTime));
    } else {
      selectedTime = DateTime.now();
      birthController = TextEditingController(text: '');
    }

    provider = context.read<UpdateProfileProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.setAvatarUrl(profile.avatarLink);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).title_update_profile)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: _buildUpdateForm(context),
      ),
    );
  }

  Widget _buildUpdateForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Column(
              children: [
                Selector<UpdateProfileProvider, String? >(
                  builder: ( context, avatarUrl, child) {
                    return (provider.isLoading == true)
                        ? const AppCircularProgressIndicator()
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey.shade200,
                            backgroundImage: avatarUrl != null
                                ? Image.network(avatarUrl).image
                                : AssetImage(AppIcons.icAvatar),
                          );
                  }, selector: (_, provider) => provider.avatarUrl,
                ),

                TextButton(
                  onPressed: () {
                    AppImageLoadUtils.showImageSourceDialog(
                      context,
                      provider,
                      widget.profileEntity,
                    );
                  },
                  child: Text(S.of(context).button_upload_avatar),
                ),
              ],
            ),
          ),

          // 2. Name
          AppTextFormField(
            validator: (value) =>
                AppValidator.validateEmpty(value, S.of(context).valid_field_empty),
            hintText: S.of(context).hint_name,
            controller: nameController,
            icPrefix: Icons.person,
          ),

          AppTextFormField(
            readOnly: true,
            validator: (value) => AppValidator.validateEmail(
              value,
              S.of(context).valid_email_enter,
              S.of(context).valid_email_format,
            ),
            hintText: S.of(context).hint_email,
            controller: emailController,
            icPrefix: Icons.email,
          ),

          // 4. Birth Date
          AppTextFormField(
            readOnly: true,
            validator: (value) =>
                AppValidator.validateEmpty(value, S.of(context).valid_field_empty),
            hintText: S.of(context).hint_birthday,
            controller: birthController,
            icPrefix: Icons.calendar_today_outlined,
            onTap: () async {
              selectedTime = await AppDateUtils.pickerDateShow(context, selectedTime);
              birthController.text = AppDateUtils.formatDate(selectedTime);
            },
          ),
          const SizedBox(height: 32),
          // Nút Save
          ButtonPurple(
            textButton: S.of(context).button_save,
            onTap: () {
              ProfileEntity profile = widget.profileEntity.copyWith(
                name: nameController.text,
                birth: AppDateUtils.dateToStringISO8601(selectedTime, TimeOfDay.now()),
                avatarLink: provider.avatarUrl,
              );
              if (_formKey.currentState!.validate()) {
                provider.updateProfile(profile: profile);
              }
            },
          ),
        ],
      ),
    );
  }
}
