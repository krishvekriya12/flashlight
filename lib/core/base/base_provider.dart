part of '../core.dart';

abstract base class BaseProvider extends ChangeNotifier {
  final BuildContext context;

  BaseProvider({required this.context}) {
    initState();
  }

  final preference = Preference();

  void initState() {}

  Future<T?> processApi<T>({
    required Future<T?> Function() request,
    void Function(bool loading)? onLoading,
  }) async {
    onLoading?.call(true);

    if (!await checkInternet()) {
      if (context.mounted) {
        //   context.showErrorMessage(title: context.l10n.internetNotConnected);
        onLoading?.call(false);
        return Future.value(null);
      }
    }
    final result = await request().onError(handleException);
    if (context.mounted) {
      onLoading?.call(false);
      return result;
    }
    return null;
  }

  FutureOr<T?> handleException<T>(Object error, StackTrace stackTrace) {
    if (!context.mounted) {
      return null;
    }
    debugPrint(error.toString());
    debugPrint(stackTrace.toString());

    switch (error) {
      default:
        context.showErrorMessage(
          title: "somethingWentWrong",
          content:
              "anUnknownErrorHasOccurredPleaseTryAgainLater",
        );
    }
    return null;
  }

  Future<bool> checkInternet() async {
    List<ConnectivityResult> connectivityResult = await (Connectivity()
        .checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet) ||
        connectivityResult.contains(ConnectivityResult.vpn) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else {
      return false;
    }
  }
}
