# cardgame

A drinking game ... the first of his kind.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## CI Setup

We use codemagic as a CI environment. ( https://codemagic.io/app/5ea714925a66a083f7925f0c )
As soon as you push to dev a build will be triggered.
You have to manually forward code between environments via github (pull requests) to trigger builds in the corresponding environment.

dev(master branch) -> QA -> staging -> production

Please only push code to the dev branch (master), never to any other branch/environment.