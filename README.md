# Flutter Sane Lints

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

A custom lint plugin to try and improve maintainability in Flutter projects by disallowing certain anti-patterns.
At the moment, the only dart lint rule in this plugin is to avoid declaring ad-hoc strings inside Widget/State classes, or passing a literal to a Widget constructor.

Every String used for presentation (such as in a Text widget) should be defined in a l10n file. See [Flutter Internationalization Tutorial](https://flutter.dev/docs/development/accessibility-and-localization/internationalization).

Every String used for logic (such as in a switch statement) should be defined as an Enum or in any other way that makes sense for the use case while following good OO design. Using strings is a clear sign of [primitive obsession](primitive_obsession_wikipedia_link) and should be avoided.

Created with the Very Good CLI 💙

## Installation 💻

**❗ In order to start using Flutter Sane Lints you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `flutter_sane_lints` and `custom_lint` to your `pubspec.yaml`:

```yaml
dev_dependencies:
  custom_lint:
  flutter_sane_lints:
```

Install it:

```sh
flutter pub get
```

---

## Usage 🚀

Add the custom_lint package to your `analysis_options.yaml`:

```yaml
analyzer:
  plugins:
    - custom_lint
```

---




[flutter_install_link]: https://flutter.dev/docs/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
[primitive_obsession_wikipedia_link]: https://en.wikipedia.org/wiki/Design_smell#Common_design_smells