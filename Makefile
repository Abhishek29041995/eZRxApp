STR := $$(perl -MYAML -le 'print YAML::LoadFile(shift)->{version}' ./pubspec.yaml)
VERSION := $$( echo $(STR) | cut -d '+' -f 1 )
BUILD := $$( echo $(STR) | cut -d '+' -f 2 )
CLIENTUSER := 'client_user.dart'
CLIENTUSERORDER := client_user/client_user_order.dart
CLIENTUSERPAYMENT := client_user/client_user_payment.dart
CLIENTUSERRETURN := client_user/client_user_return.dart
EXTERNALSALESREPORDER := external_sales_rep/external_sales_rep_user_order.dart
EXTERNALSALESREPRETURN := external_sales_rep/external_sales_rep_user_return.dart
MARKETPLACEUSERORDER := market_place_user/market_place_user_order.dart
MARKETPLACEUSERPAYMENT := market_place_user/market_place_user_payment.dart
MARKETPLACEUSERRETURN := market_place_user/market_place_user_return.dart
SALESORGCONFIG := reset_sales_org_config.sh

app_setup:
	@if [ $(FLAVOR) != "mock" ]; then\
        bash scripts/remove_assets_json.sh;\
    fi
	$(MAKE) flutter_install
	@if [ $(PLATFORM) = "ios" ]; then\
        $(MAKE) clean_ios;\
    fi
flutter_install:
	@brew tap leoafarias/fvm && brew install fvm && echo Y | fvm global 3.22.1 && fvm flutter clean && fvm flutter pub get
clean_ios:
	@cd ios && rm -rf Pods && rm -f Podfile.lock && fvm flutter pub get && fvm flutter precache --ios && pod install && cd ..
run_analyze:
	@fvm flutter analyze --fatal-infos --fatal-warnings
	@dcm analyze lib --fatal-style --fatal-performance --fatal-warnings
	@dcm check-parameters lib --fatal-found
	@dcm check-code-duplication lib --fatal-found
	@dcm check-unused-code lib --fatal-unused
	@dcm check-dependencies lib test integration_test --ignored-packages flutter_launcher_icons --fatal-found
	@dcm check-unused-files lib test integration_test --fatal-unused
	@dcm check-exports-completeness lib test integration_test --fatal-found
run_test:
	$(MAKE) run_analyze
	@fvm flutter test --coverage && genhtml coverage/lcov.info -o coverage/html && open coverage/html/index.html
run_uat_test:
	@git tag -a test.uat.${VERSION}-${BUILD} -m "test uat ${VERSION}(${BUILD})" && git push origin test.uat.${VERSION}-${BUILD}
	@git tag -d test.uat.${VERSION}-${BUILD} && git push --delete origin test.uat.${VERSION}-${BUILD}
run_uat_cd:
	@git tag -a uat.${VERSION}-${BUILD} -m "uat ${VERSION}(${BUILD})" && git push origin uat.${VERSION}-${BUILD}
run_prod_cd:
	@git tag -a prod.${VERSION}-${BUILD} -m "prod ${VERSION}(${BUILD})" && git push origin prod.${VERSION}-${BUILD}
revert_uat_tag:
	@git tag -d uat.${VERSION}-${BUILD} && git push --delete origin uat.${VERSION}-${BUILD}
revert_prod_tag:
	@git tag -d prod.${VERSION}-${BUILD} && git push --delete origin prod.${VERSION}-${BUILD}
build_ios_uat:
	@flutter build ipa --flavor uat -t lib/main_uat.dart --release --export-options-plist=ios/config/uat/exportOptions.plist
build_android_uat:
	@fvm flutter build appbundle --flavor uat -t lib/main_uat.dart --release
build_web_uat:
	@fvm flutter build web -t lib/main_uat.dart --release
build_ios_prod:
	@fvm flutter build ipa --flavor prod -t lib/main_prod.dart --release --export-options-plist=ios/config/prod/exportOptions.plist
build_android_prod:
	@fvm flutter build appbundle --flavor prod -t lib/main_prod.dart --release
build_web_prod:
	@fvm flutter build web -t lib/main_prod.dart --release
build_xctest:
	@xcodebuild -workspace ios/Runner.xcworkspace -scheme uat -derivedDataPath build/xctest -sdk iphoneos build-for-testing
	@zip -r ezrx_xctest.zip Debug-iphoneos build/xctest/Build/Products/uat_iphoneos16.4.xctestrun
reset_sg_salesorg_config:
	./integration_test/sg/${SALESORGCONFIG}
reset_my_salesorg_config:
	./integration_test/my/${SALESORGCONFIG}
reset_vn_salesorg_config:
	./integration_test/vn/${SALESORGCONFIG}
reset_th_salesorg_config:
	./integration_test/th/${SALESORGCONFIG}
reset_tw_salesorg_config:
	./integration_test/tw/${SALESORGCONFIG}
reset_ph_salesorg_config:
	./integration_test/ph/${SALESORGCONFIG}
reset_mm_salesorg_config:
	./integration_test/mm/${SALESORGCONFIG}
reset_kh_salesorg_config:
	./integration_test/kh/${SALESORGCONFIG}
reset_id_salesorg_config:
	./integration_test/id/${SALESORGCONFIG}
run_sg_client_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/sg/${CLIENTUSERORDER} 
run_sg_client_return_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/sg/${CLIENTUSERRETURN} 
run_sg_client_payment_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/sg/${CLIENTUSERPAYMENT} 
run_sg_external_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/sg/${EXTERNALSALESREPORDER}
run_sg_external_return_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/sg/${EXTERNALSALESREPRETURN}
run_tw_client_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/tw/${CLIENTUSERORDER} 
run_tw_external_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/tw/${EXTERNALSALESREPORDER}
run_vn_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/vn/${CLIENTUSER}
run_vn_client_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/vn/${CLIENTUSERORDER}
run_vn_client_payment_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/vn/${CLIENTUSERPAYMENT} 
run_vn_external_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/vn/${EXTERNALSALESREPORDER}
run_kh_client_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/kh/${CLIENTUSERORDER}
run_kh_external_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/kh/${EXTERNALSALESREPORDER}
run_mm_client_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/mm/${CLIENTUSERORDER} 
run_mm_external_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/mm/${EXTERNALSALESREPORDER}
run_my_client_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${CLIENTUSERORDER}
run_my_client_return_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${CLIENTUSERRETURN}
run_my_client_payment_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${CLIENTUSERPAYMENT} 
run_my_external_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${EXTERNALSALESREPORDER}
run_my_external_return_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${EXTERNALSALESREPRETURN}
run_my_market_place_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${MARKETPLACEUSERORDER}
run_my_market_place_return_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${MARKETPLACEUSERRETURN}
run_my_market_place_payment_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/my/${MARKETPLACEUSERPAYMENT} 
run_ph_payment_summary_client_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/ph/payments/payment_summary/${CLIENTUSER}
run_ph_client_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/ph/${CLIENTUSERORDER} 
run_ph_client_return_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/ph/${CLIENTUSERRETURN} 
run_ph_client_payment_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/ph/${CLIENTUSERPAYMENT} 
run_ph_external_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/ph/${EXTERNALSALESREPORDER} 
run_ph_external_return_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/ph/${EXTERNALSALESREPRETURN}
run_th_client_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/th/${CLIENTUSERORDER}
run_th_client_payment_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/th/${CLIENTUSERPAYMENT}
run_th_external_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/th/${EXTERNALSALESREPORDER}
run_th_external_return_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/th/${EXTERNALSALESREPRETURN}
run_th_client_return_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/th/${CLIENTUSERRETURN}
run_id_prod_user_cart_test:
	./integration_test/id/prod_user_cart_runner.sh
run_id_client_order_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/id/${CLIENTUSERORDER} 
run_id_client_payment_test:
	@fvm flutter drive --flavor uat --driver=test_driver/integration_driver.dart --target=integration_test/id/${CLIENTUSERPAYMENT} 