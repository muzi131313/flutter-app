flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/examples/l10n/i10n/i10n-arb lib/examples/l10n/i10n/localization_intl.dart
flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/examples/l10n/i10n --no-use-deferred-loading lib/examples/l10n/i10n/localization_intl.dart lib/examples/l10n/i10n/i10n-arb/intl_*.arb
