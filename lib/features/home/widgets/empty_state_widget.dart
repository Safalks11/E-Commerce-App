import 'package:flutter/material.dart';

import '../../../app/theme/app_theme.dart';

class EmptyState extends StatelessWidget {
  final bool isFiltered;
  final GestureTapCallback onRefresh;

  const EmptyState({super.key, this.isFiltered = false, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(
              Icons.inventory_2_rounded,
              size: 72,
              color: AppColors.primaryColor.withValues(alpha: 0.25),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            isFiltered ? 'No Products Found' : 'No Products Found',
            style: theme.textTheme.titleLarge?.copyWith(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor.withValues(alpha: 0.7),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            isFiltered
                ? 'No products found for the selected category.\nTry selecting a different category.'
                : 'There are no products available at the moment.\nPlease try again later.',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 16,
              color: AppColors.primaryColor.withValues(alpha: 0.7),
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          GestureDetector(
            onTap: onRefresh,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.primaryColor.withValues(alpha: 0.3)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.refresh_rounded, size: 22, color: AppColors.primaryColor),
                  const SizedBox(width: 12),
                  Text(
                    'Refresh',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
