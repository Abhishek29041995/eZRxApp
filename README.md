# ezrxmobile plus

This is third generation of eZRx mobile app created by Domain-Driven Design Architecture.
To know more about Domain Driven Design in flutter please visit:
<https://resocoder.com/2020/03/09/flutter-firebase-ddd-course-1-domain-driven-design-principles/>

### Require

- [Vscode](https://code.visualstudio.com/)
- [Flutter extension](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
- [FVM - to switch you device flutter version fast](https://fvm.app/docs/getting_started/installation)
- [Version Lens - to check who is the line contributor](https://marketplace.visualstudio.com/items?itemName=pflannery.vscode-versionlens)

### Optional

- [Bloc extension](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc)
- [Coverage Gutters](https://marketplace.visualstudio.com/items?itemName=ryanluker.vscode-coverage-gutters)
- [Flutter Coverage](https://marketplace.visualstudio.com/items?itemName=Flutterando.flutter-coverage)
- [Edit csv](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv)
- [GraphQl](https://marketplace.visualstudio.com/items?itemName=mquandalle.graphql)

### Setup

1. Install [lefthook](https://github.com/evilmartians/lefthook)  `brew install lefthook`  and  `lefthook install` for active lefthook on local machine
2. Install [FVM](https://fvm.app/docs/getting_started/installation)
3. Git clone project
4. Open project with Vscode, check ".fvm/fvm_config.json" file, check the "flutterSdkVersion" inside and use ```fvm use <flutterSdkVersion_you_saw>```
5. use command `git config --global pull.rebase true` to make all the git pull with rebase action
6. Restart vscode

### Auto build json_serializable, freezed, auto_route_generator, hive_generator

```fvm flutter pub run build_runner build --delete-conflicting-outputs```

### Edit localization lang file csv

- directory : assets/langs/langs.csv
- [Edit csv](https://marketplace.visualstudio.com/items?itemName=janisdd.vscode-edit-csv) edit your csv easily
- Ensure the csv file is using CRLF to works. ref:<https://stackoverflow.com/a/39532890>

### Sonarqube

1. [Read this](https://medium.com/@rajeswari3699/sonarqube-with-flutter-e294e48018f2)
2. Follow the guide download Sonarqube, SonarScanner, Sonar-Flutter Plugin and put to the correct directory.
3. ```nano /etc/paths``` add ```/Applications/SonarScanner/bin``` and ```/Applications/SonarScanner/bin```
4. Start Sonarqube local server ```sh /Applications/SonarQube/bin/macosx-universal-64/sonar.sh console```
5. <http://localhost:9000/about> > Wait for a while until Login screen appear > Login and create project
6. Config sonar-project.properties
7. ```fvm flutter test --machine --coverage > tests.output```
8. ```sonar-scanner```
9. open ```http://localhost:9000/dashboard?id=ezrx_mobile```

### Integration test

#### Local test/ CI test

For SG market:
type command `make run_sg_client_test` to run integration test
type command `make run_sg_external_test` to run integration test

#### Browserstack test

```fvm flutter test --flavor uat --machine integration_test/<filePath> > report.json```

#### Integration tests on Browserstack cloud platform on Android Devices

You need to run the below commands from a shell.

1. Set the Browserstack username. ``` export BROWSERSTACK_USERNAME='Username' ```
2. Set the Browserstack accesskey. ``` export BROWSERSTACK_ACCESSKEY='Accesskey' ```
3. Set whether to run on specific geo location. This should be either 'Yes' or 'No' ``` export ENABLE_GEOLOCATION='Yes' ```
4. Set all the tests that you want to run, Specify in same format with test name and geo location. Multiple Tests can be specified.
   Please note for MM market , Browserstack still does not support this Geo Location. You can set any other market geo location like "SG".
 ``` testIT=("./integration_test/sg/order/client_user.dart":"SG" "./integration_test/my/order/client_user.dart":"MY") ```
5. Run the tests by calling the script and passing the tests defined in above step as parameter to script.``` ./run_intg_android_browserstack.sh ${testIT[@]} ```
 Summary of the test run will conatin the following at the end of the script execution - "Test case" , "Build Status", "Build Details Link", "Video Link"

### Flavor

| Flavor| Package name | App Name | Endpoint |
|--|--|--|--|
| PROD |  `com.zuelligpharma.ezrxplus`| eZRx+ | <https://my.ezrxplus.com> |
| UAT  |  `com.zuelligpharma.ezrxplus.uat`| eZRx+ Uat | <https://uat-my.ezrxplus.com> |
| DEV  |  `com.zuelligpharma.ezrxplus.dev`| eZRx+ Dev | <https://ezrxplus-dev.ezrx.com> |
| MOCK  |  `com.zuelligpharma.ezrxplus.mock`| eZRx+ Mock | local assets json |

### Build app

#### IOS

- ```fvm flutter build ios --flavor mock -t lib/main_mock.dart```
- ```fvm flutter build ios --flavor dev -t lib/main_dev.dart```
- ```fvm flutter build ios --flavor uat -t lib/main_uat.dart```
- ```fvm flutter build ios --flavor prod -t lib/main_prod.dart```

#### Android

- ```fvm flutter build appbundle --flavor mock -t lib/main_mock.dart```
- ```fvm flutter build appbundle --flavor dev -t lib/main_dev.dart```
- ```fvm flutter build appbundle --flavor uat -t lib/main_uat.dart```
- ```fvm flutter build appbundle --flavor prod -t lib/main_prod.dart```
- ```fvm flutter build apk --flavor uat -t lib/main_browserstack.dart --debug```

### Error when run IOS ?

- Run command ```make clean_ios```

## Before submit PR, please run

### Analyze

- ```fvm flutter analyze --fatal-infos --fatal-warnings```
- ```fvm flutter pub run dart_code_metrics:metrics analyze lib --fatal-style --fatal-performance --fatal-warnings```

### Test Coverage

1. [Read this](https://codewithandrea.com/articles/flutter-test-coverage/)
2. ```brew install lcov```
3. ```make run_test```

### How to `bloc_test` the loading_more function

Let's assume that we test loading_more function for load a page 2

1. Use `seed` to setup a `state` with page 1 response for `bloc`
2. Setup a mock `repository` with parameters and a `pageSize` equals to page 1 length
3. Use `act` to add load_more `event` to `bloc`
4. `expect` section will be the same as when we test the `fetch` function, except that the `state` will have both page 1 and page 2 response

### How to trigger Azure Pipeline Automation Build

1. Create a release branch
2. Merge all related PR to release branch
3. Make sure checkout to release branch
4. Version bump on pubspec.yaml , then commit
5. type command `make run_uat_cd` to deploy to UAT
6. type command `make run_prod_cd` to deploy to PROD

### How to generate splash screen

- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)
- Run command ```fvm flutter pub run flutter_native_splash:create```

### How to generate app icon

- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- Run command ```fvm flutter pub run flutter_launcher_icons```

### Android SDK Version

Make the below changes to your /eZRx Mobile/android/local.properties

- flutter.minSdkVersion=24
- flutter.targetSdkVersion=34
- flutter.compileSdkVersion=34

### How to run both iOS and Android simulator in a same time

1. Command + P => Flutter: Select Device
2. Open the iOS and Android simulator in sequence
3. terminal run `fvm flutter devices`
4. Copy the iOS and Android device ID from the list
5. Replace the `.vscode/launch.json` "uat-ios" and "uat-android" device ID. Save it
6. Go to VScode left Tab number 4 Item : Run and Debug , dropdown pick "uat-all-devices", click run
7. Do not commit this change on your branch
