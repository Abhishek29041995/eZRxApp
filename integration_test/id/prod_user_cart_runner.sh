#!/bin/bash
fvm flutter pub global activate dart_dot_reporter
fvm flutter drive --flavor prod --driver=test_driver/integration_driver.dart --target=integration_test/id/prod_user_cart.dart > testResults.log
dart_dot_reporter testResults.log