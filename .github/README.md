# Boilerplate

Use this template to initially create a Flutter app with the bloc pattern. The main purpose is to save time when
starting every new project.

## Application Identifier

The first step is to replace the
package name and the application name.

Search for the string `com.necorico.boilerplate_flutter`. It is safe to replace under all the files, but make sure
to review and understand what is the purpose of every replace.

As the second step you need to update the package name for ios on the `project.pbxproj`, the strings are `com.necorico.boilerplate`
on every `PRODUCT_BUNDLE_IDENTIFIER`.

## Dependencies

We recommend to check the package and dependencies being used on the `pubspec.yaml` to avoid any surprises or
usage of unexpected packages. We try to keep the boilerplate as simple as possible and avoid any dependencies
not ready for production.

## Tests

We see no value on keeping and maintaining tests for the boilerplate screens, even it is a template repository
if we start implementing any tests, every time flutter updates, we will need to keep checking for deprecations
and so on. The intention is to keep the boilerplate easy to maintain.

## Features
- iOS Translation Boilerplate
- iOS Application Name Translation Boilerplate
- i18n Boilerplate (Third Party Dependency)
- Initial Bloc, Events and States
- Configurations
- Support Files (Helpers)
