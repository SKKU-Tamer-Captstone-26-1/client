import 'package:flutter/material.dart';

@immutable
class PreferenceSurveyStep {
  const PreferenceSurveyStep({
    required this.title,
    required this.description,
    required this.options,
  });

  final String title;
  final String description;
  final List<PreferenceSurveyOption> options;
}

@immutable
class PreferenceSurveyOption {
  const PreferenceSurveyOption({
    required this.label,
    required this.description,
    required this.icon,
  });

  final String label;
  final String description;
  final IconData icon;
}
