import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_bike_customer_app/core/router/app_navigator_impl.dart';
import 'package:sample_bike_customer_app/core/router/routes.dart';
import 'package:sample_bike_customer_app/data/models/home_model.dart';
import 'package:sample_bike_customer_app/l10n/app_localizations.dart';
import '../../widget/banner/promo_banner_widget.dart';
import '../../widget/list_bike/list_bike_widget.dart';
import '../../widget/list_package/list_package_widget.dart';
import 'home_tab_view_model.dart';

class HomeTab extends ConsumerWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeTabViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              ref
                  .read(appNavigatorProvider)
                  .pushNamedWithResult(
                    Routes.notificationPage,
                  );
            },
          ),
        ],
      ),
      body: homeState.when(
        data: (homeModel) {
          if (homeModel == null || homeModel.sections.isEmpty) {
            return RefreshIndicator(
              onRefresh: () async {
                await ref.read(homeTabViewModelProvider.notifier).refresh();
              },
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.noSectionsAvailable,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await ref.read(homeTabViewModelProvider.notifier).refresh();
            },
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final section = homeModel.sections[index];
                      return _buildSection(context, section);
                    },
                    childCount: homeModel.sections.length,
                  ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 60,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.failedToLoadSections,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () {
                  ref.read(homeTabViewModelProvider.notifier).refresh();
                },
                icon: const Icon(Icons.refresh),
                label: Text(AppLocalizations.of(context)!.retry),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, SectionModel section) {
    // For promotion type, use PromoBannerWidget
    if (section.sectionType == SectionType.promotion) {
      return Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: PromoBannerWidget(
          title: section.title,
        ),
      );
    }

    // For bike list type, use ListBikeWidget
    if (section.sectionType == SectionType.listBike) {
      return Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: ListBikeWidget(
          title: section.title,
        ),
      );
    }

    // For rental package type, use ListPackageWidget
    if (section.sectionType == SectionType.rentalPackage) {
      return Padding(
        padding: EdgeInsets.only(bottom: 16),
        child: ListPackageWidget(
          title: section.title,
        ),
      );
    }

    // For other types, show the card
    return _buildSectionCard(context, section);
  }

  Widget _buildSectionCard(BuildContext context, SectionModel section) {
    IconData iconData;
    Color iconColor;

    switch (section.sectionType) {
      case SectionType.promotion:
        iconData = Icons.local_offer;
        iconColor = Colors.orange;
        break;
      case SectionType.rentalPackage:
        iconData = Icons.card_membership;
        iconColor = Colors.blue;
        break;
      case SectionType.listBike:
        iconData = Icons.pedal_bike;
        iconColor = Colors.green;
        break;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: InkWell(
          onTap: () {
            // TODO: Navigate to section detail based on type
          },
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    iconData,
                    size: 32,
                    color: iconColor,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        section.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
