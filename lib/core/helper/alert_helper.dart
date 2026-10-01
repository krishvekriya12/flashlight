part of '../core.dart';

extension AlertsHelper on BuildContext {
  void showGeneralMessage({
    required String title,
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(title),
        action: action,
      ),
    );
  }

  void showSuccessMessage({required String title, String? content}) {
    ScaffoldMessenger.of(this).showSnackBar(
      AlertMessage(
        title: title,
        description: content,
        backgroundColor: statusColor.success,
        foregroundColor: statusColor.onSuccess,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void showErrorMessage({required String title, String? content}) {
    ScaffoldMessenger.of(this).showSnackBar(
      AlertMessage(
        title: title,
        description: content,
        backgroundColor: statusColor.failure,
        foregroundColor: statusColor.onFailure,
        duration: const Duration(seconds: 2),

      ),
    );
  }
}

