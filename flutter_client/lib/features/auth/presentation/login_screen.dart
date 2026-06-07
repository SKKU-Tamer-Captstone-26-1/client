import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../shared/widgets/app_theme_toggle_button.dart';
import 'widgets/google_sign_in_button.dart';
import 'widgets/login_brand_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.onGoogleSignIn,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  final Future<void> Function()? onGoogleSignIn;
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSigningIn = false;
  String? _error;

  Future<void> _handleSignIn() async {
    if (_isSigningIn) return;
    setState(() {
      _isSigningIn = true;
      _error = null;
    });
    try {
      await widget.onGoogleSignIn?.call();
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSigningIn = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Scaffold(
      backgroundColor: palette.surfaceContainerLow,
      body: SafeArea(
        child: Stack(
          children: [
            const _LoginBackdrop(),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: AppThemeToggleButton(
                  isDarkMode: widget.isDarkMode,
                  onPressed: widget.onThemeToggle,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 48, 24, 20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 456),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const LoginBrandHeader(),
                      const SizedBox(height: 16),
                      const _LoginPreviewPanel(),
                      const SizedBox(height: 12),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: palette.surfaceContainerLowest,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: palette.outlineVariant.withValues(
                              alpha: 0.7,
                            ),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x10000000),
                              blurRadius: 18,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                'Welcome back',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(fontSize: 21),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                'Sign in to keep your local bottle profile, map, chats, and collection in sync.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 14),
                              GoogleSignInButton(
                                onPressed: _isSigningIn ? null : _handleSignIn,
                                isLoading: _isSigningIn,
                              ),
                              if (_error != null) ...[
                                const SizedBox(height: 12),
                                Text(
                                  _error!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                              const SizedBox(height: 14),
                              const _SecurityIndicator(),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Text(
                        '2026 ON THE BLOCK. ALL RIGHTS RESERVED.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: palette.footerText,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.2,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginPreviewPanel extends StatelessWidget {
  const _LoginPreviewPanel();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.72),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _LoginBadge(
                  label: 'LOCAL PICK',
                  color: palette.primaryContainer,
                  foregroundColor: Colors.white,
                ),
                const Spacer(),
                Icon(
                  Icons.auto_awesome,
                  color: palette.primaryContainer.withValues(alpha: 0.62),
                  size: 18,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  width: 62,
                  height: 76,
                  decoration: BoxDecoration(
                    color: palette.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(
                      color: palette.outlineVariant.withValues(alpha: 0.9),
                    ),
                  ),
                  child: Icon(
                    Icons.liquor,
                    color: palette.primaryContainer,
                    size: 30,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rare bottles, nearby rooms, better pours.',
                        style: TextStyle(
                          color: palette.onSurface,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          height: 1.08,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Premium recommendations shaped by taste, stores, and neighborhood signals.',
                        style: TextStyle(
                          color: palette.secondary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                _LoginSignalChip(icon: Icons.location_on, label: '0.8 mi'),
                _LoginSignalChip(icon: Icons.psychology, label: 'AI pairing'),
                _LoginSignalChip(icon: Icons.chat_bubble, label: 'Live chat'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginBadge extends StatelessWidget {
  const _LoginBadge({
    required this.label,
    required this.color,
    required this.foregroundColor,
  });

  final String label;
  final Color color;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label,
          style: TextStyle(
            color: foregroundColor,
            fontSize: 10,
            fontWeight: FontWeight.w900,
            height: 1,
          ),
        ),
      ),
    );
  }
}

class _LoginSignalChip extends StatelessWidget {
  const _LoginSignalChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: palette.surfaceContainerLow,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: palette.outlineVariant.withValues(alpha: 0.64),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: palette.onSurfaceVariant),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: palette.onSurfaceVariant,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecurityIndicator extends StatelessWidget {
  const _SecurityIndicator();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return Opacity(
      opacity: 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _DividerLine(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Safe & Secure'.toUpperCase(),
              style: TextStyle(
                color: palette.secondary,
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
                height: 1.2,
              ),
            ),
          ),
          const _DividerLine(),
        ],
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 1,
      color: context.palette.outlineVariant,
    );
  }
}

class _LoginBackdrop extends StatelessWidget {
  const _LoginBackdrop();

  @override
  Widget build(BuildContext context) {
    final palette = context.palette;

    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 198,
              decoration: BoxDecoration(
                color: palette.surfaceContainerLowest,
                border: Border(
                  bottom: BorderSide(
                    color: palette.outlineVariant.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
