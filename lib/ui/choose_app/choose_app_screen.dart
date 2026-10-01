part of 'choose_app.dart';

class ChooseAppScreen extends StatelessWidget {
  const ChooseAppScreen({super.key});

  static const String routeName = '/choose_app';

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChooseAppProvider(context: context),
      child: ChooseAppScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final allSelected = context.select<ChooseAppProvider, bool>((value) => value.allSelected);

    return Scaffold(
      appBar: FlashLightAppBar(
        title: context.l10n.chooseApp,
        actions: [
          CommonButton.cupertino(
            padding: EdgeInsets.only(right:Spacing.large),
            onTap: context.read<ChooseAppProvider>().toggleSelectAll,
            child: Icon(allSelected ? Icons.check_box : Icons.check_box_outline_blank,size: 28,),
          ),
        ],
      ),
      body: _Body(),
    );
  }
}
class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ChooseAppProvider>();

    final apps = context.select<ChooseAppProvider, List<AppInfo>>(
          (provider) => provider.apps,
    );

    final isLoading = context.select<ChooseAppProvider, bool>(
          (provider) => provider.isLoading,
    );

    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (apps.isEmpty) {
      return const Center(
        child: Text('No apps found'),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(Spacing.normal),
      itemCount: apps.length,
      separatorBuilder: (context, index) {
        return Gap(Spacing.medium);
      },
      itemBuilder: (context, index) {
        final app = apps[index];

        return _ChooseAppCell(
          key: ValueKey(app.packageName),
          app: app,
          isSelected: provider.isSelected(app.packageName),
          onTap: () {
            provider.toggleApp(app.packageName);
          },
        );
      },
    );
  }
}
class _ChooseAppCell extends StatelessWidget {
  final AppInfo app;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChooseAppCell({
    super.key,
    required this.app,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CommonButton.cupertino(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Spacing.normal),
        decoration: BoxDecoration(color: context.colorScheme.primaryContainer, borderRadius: ShapeBorderRadius.normal),
        child: Row(
          children: [
            if (app.icon != null)
              Image.memory(app.icon!, width: 48, height: 48, fit: BoxFit.cover)
            else
              Icon(Icons.apps, size: 48),
            Gap(Spacing.normal),
            Expanded(
              child: Text(
                app.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.titleMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Gap(Spacing.small),
            Icon(
              isSelected ? Icons.check_box : Icons.check_box_outline_blank,
              color: isSelected ? context.colorScheme.primary : context.colorScheme.onSurfaceVariant,size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
