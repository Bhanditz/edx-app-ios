# Pre-requisites

- [Cocoapods](https://guides.cocoapods.org/using/getting-started.html)

# Getting Started

1. Podspec: branch this repository and edit `OEXRemoteConfig.podspec` to match your project
2. Config: update `config/local.yml` and `config/config.yml` to match your project
3. Deployment: duplicate fastlane/.env.appsemblerx to fastlane/.env.projectname, then edit it to match your project. 
4. Run this command to validate your changes: 
```
$ pod spec lint OEXRemoteConfig.podspec --verbose --private
```
5. Update your Podfile (or the environment variable mentioned in your Podfile) to pull from your new custom cocoapod URL.

# FAQ

- [Official guide to making a cocoapod](https://guides.cocoapods.org/making/making-a-cocoapod.html)
- [Official guide to fastlane](https://github.com/fastlane/fastlane/tree/master/fastlane/docs). Also, see fastlane/README for our basic deployment commands.
