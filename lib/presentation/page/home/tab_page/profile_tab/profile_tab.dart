import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/core/provider/global_provider.dart';
import 'package:sample_bike_customer_app/core/router/routes.dart';
import 'package:sample_bike_customer_app/l10n/app_localizations.dart';
import 'package:sample_bike_customer_app/presentation/widget/error_state_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import 'profile_tab_viewmodel.dart';

class ProfileTab extends ConsumerWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileTabViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.profile),
        centerTitle: true,
      ),
      body: profileState.when(
        data: (state) {
          final user = state.user;

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 32),
                // Profile Picture
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 16),
                // User Email
                Text(
                  user?.email ?? AppLocalizations.of(context)!.noEmail,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                // Menu Items
                _buildMenuSection(context, ref),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => ErrorStateWidget(
          title: AppLocalizations.of(context)!.failedToLoadProfile,
          errorMessage: error.toString(),
        ),
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _buildMenuItem(
          context,
          icon: Icons.privacy_tip_outlined,
          title: AppLocalizations.of(context)!.privacyPolicy,
          onTap: () =>
              _launchUrl('https://electrum.id/privacy-policy', context),
        ),
        const Divider(height: 1),
        _buildMenuItem(
          context,
          icon: Icons.info_outline,
          title: AppLocalizations.of(context)!.aboutUs,
          onTap: () => _launchUrl('https://electrum.id/about-us', context),
        ),
        const Divider(height: 1),
        _buildMenuItem(
          context,
          icon: Icons.logout,
          title: AppLocalizations.of(context)!.logout,
          iconColor: Colors.red,
          textColor: Colors.red,
          onTap: () => _handleLogout(context, ref),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: iconColor ?? Colors.grey[700],
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: textColor,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Colors.grey[400],
      ),
      onTap: onTap,
    );
  }

  Future<void> _launchUrl(String urlString, BuildContext context) async {
    try {
      final url = Uri.parse(urlString);
      await launchUrl(url, mode: LaunchMode.inAppBrowserView);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(AppLocalizations.of(context)!.couldNotOpenUrl(urlString)),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.logout),
        content: Text(AppLocalizations.of(context)!.areYouSureYouWantToLogout),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(
              AppLocalizations.of(context)!.logout,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true && context.mounted) {
      try {
        await ref.read(profileTabViewModelProvider.notifier).logout();

        if (context.mounted) {
          ref
              .read(navigatorKeyProvider)
              .currentState
              ?.pushNamedAndRemoveUntil(
                Routes.loginPage,
                (route) => false,
              );
        }
      } catch (e) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                e.toString().replaceAll('Exception: ', ''),
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}
