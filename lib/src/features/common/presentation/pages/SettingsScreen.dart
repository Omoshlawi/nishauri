import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nishauri/src/features/user/data/models/user.dart';
import 'package:nishauri/src/features/user/data/providers/user_provider.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/routes.dart';

class _SettingsItem {
  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final String title;
  final String? subTitle;
  final void Function()? onPress;

  _SettingsItem(
      {required this.title,
      this.onPress,
      this.subTitle,
      this.trailingIcon,
      this.leadingIcon});
}

_settingsItem(BuildContext context) => [
      _SettingsItem(
        title: "Profile",
        leadingIcon: Icons.account_circle,
        onPress: () => context.go(RouteNames.PROFILE_SETTINGS),
      ),
      _SettingsItem(title: "Theme", leadingIcon: Icons.light_mode),
      _SettingsItem(
          title: "Privacy",
          leadingIcon: Icons.security,
          onPress: () => context.go(RouteNames.PRIVACY_SETTINGS)),
      _SettingsItem(
          title: "Plugins", leadingIcon: Icons.private_connectivity_outlined),
      _SettingsItem(
          title: "Change Password",
          leadingIcon: Icons.key,
          onPress: () => context.go(RouteNames.CHANGE_PASSWORD)),
    ];

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _items = _settingsItem(context);
    final user = ref.watch(userProvider);
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Settings")),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final item = _items[index];
            return Card(
              elevation: 0,
              color: theme.colorScheme.onSecondary,
              borderOnForeground: false,
              // margin: const EdgeInsets.only(top: Constants.SPACING),
              child: Padding(
                padding: const EdgeInsets.all(Constants.SPACING),
                child: ListTile(
                  leading: Icon(item.leadingIcon),
                  title: Text(item.title),
                  onTap: item.onPress,
                ),
              ),
            );
          },
          itemCount: _items.length,
        ));
  }
}
