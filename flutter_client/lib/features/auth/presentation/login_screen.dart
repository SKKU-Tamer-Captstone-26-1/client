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
      backgroundColor: palette.surfaceContainerLowest,
      body: SafeArea(
        child: Stack(
          children: [
            const _BackgroundAccents(),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: AppThemeToggleButton(
                  isDarkMode: widget.isDarkMode,
                  onPressed: widget.onThemeToggle,
                ),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 72,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 448),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const LoginBrandHeader(),
                      const SizedBox(height: 64),
                      Text(
                        'Welcome back',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Join your neighborhood liquor enthusiasts.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 48),
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
                      const SizedBox(height: 48),
                      const _SecurityIndicator(),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                child: Text(
                  '2026 ON THE BLOCK. ALL RIGHTS RESERVED.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: palette.footerText,
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                    height: 1.3,
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

class _BackgroundAccents extends StatelessWidget {
  const _BackgroundAccents();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -120,
            right: -120,
            child: _SoftCircle(
              color: context.palette.primaryContainer.withValues(alpha: 0.05),
              size: 260,
            ),
          ),
          Positioned(
            bottom: -120,
            left: -120,
            child: _SoftCircle(
              color: context.palette.decorativeTertiary.withValues(alpha: 0.05),
              size: 220,
            ),
          ),
        ],
      ),
    );
  }
}

class _SoftCircle extends StatelessWidget {
  const _SoftCircle({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
