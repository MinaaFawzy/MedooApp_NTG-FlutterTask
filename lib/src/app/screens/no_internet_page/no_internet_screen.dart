import 'package:flutter/material.dart';
import 'package:modee_e_commerce_app/l10n/app_localizations.dart';
import 'package:modee_e_commerce_app/src/data/utils/app_colors.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;

  const NoInternetScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(loc.noInternetConnection),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onRetry,
              child: Text(loc.retry),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.buttonColor,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
