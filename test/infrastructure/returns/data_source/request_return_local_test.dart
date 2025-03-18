void main() {}
/*
void main() {
  late RequestReturnLocalDatasource localDataSource;
  locator.registerSingleton<Config>(Config()..appFlavor = Flavor.mock);

  setUpAll(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      localDataSource = RequestReturnLocalDatasource();
    },
  );

  group(
    'Request Return Local Datasource => ',
    () {
      test(
        'searchReturnMaterials',
        () async {
          final res = json.decode(
            await rootBundle
                .loadString('assets/json/getRequestReturnMaterials.json'),
          );

          final result = await localDataSource.searchReturnMaterials();

          expect(
              result,
              ReturnRequestDto.fromJson(res['data']['searchReturnMaterials'])
                  .toDomain());
        },
      );
    },
  );
}
*/
