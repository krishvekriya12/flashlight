part of '../core.dart';

abstract class LoadingHandler {
  const LoadingHandler();

  void startLoading({String? message, bool? showBookLoader});

  void stopLoading();

  void handleLoading(
      bool loading, {
        String? message,
      }) {
    if (loading) {
      startLoading(message: message);
    } else {
      stopLoading();
    }
  }
}

class LoadingDialogHandler extends LoadingHandler {
  LoadingDialogHandler({required BuildContext context}) : _context = context;

  final BuildContext _context;
  Route? _dialogRoute;

  Route _buildDialogRoute(
      BuildContext context, {
        String? message,
        bool? showBookLoader,
      }) {
    assert(debugCheckHasMaterialLocalizations(context));
    final CapturedThemes themes = InheritedTheme.capture(
      from: context,
      to: context.navigator.context,
    );
    return DialogRoute(
      context: context,
      barrierDismissible: false,
      useSafeArea: true,
      themes: themes,
      builder: (context) => PopScope(
        canPop: false,
        child: LoadingIndicator(loadingMessage: message),
      ),
    );
  }

  @override
  void startLoading({String? message, bool? showBookLoader}) {
    if (_dialogRoute != null) return;
    _dialogRoute = _buildDialogRoute(
      _context,
      message: message,
      showBookLoader: showBookLoader,
    );
    _context.navigator.push(_dialogRoute!);
  }

  @override
  void stopLoading() {
    if (_dialogRoute != null && _context.mounted) {
      _context.navigator.removeRoute(_dialogRoute!);
    }
    _dialogRoute = null;
  }
}


class DialogLoadingIndicator extends StatefulWidget {
  const DialogLoadingIndicator({super.key, this.loadingMessage});

  final String? loadingMessage;

  @override
  State<DialogLoadingIndicator> createState() => _DialogLoadingIndicatorState();
}

class _DialogLoadingIndicatorState extends State<DialogLoadingIndicator>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 180,
          padding: EdgeInsets.all(Spacing.large),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Spacing.xLarge),
            color: context.colorScheme.primaryContainer,
          ),
          child: Column(
            children: [
              // Assets.animation.loader.lottie(
              //   controller: _controller,
              //   onLoaded: (composition) {
              //     _controller.duration = composition.duration ~/ 2;
              //     _controller.repeat();
              //   },
              //   height: 80,
              // ),
              if (widget.loadingMessage?.isNotEmpty ?? false) ...[
                Gap(Spacing.small),
                Text(
                  widget.loadingMessage ?? "",
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.surfaceTint,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
