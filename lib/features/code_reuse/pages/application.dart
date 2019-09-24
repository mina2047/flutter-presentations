import 'package:flutter/material.dart';
import 'package:mobile_flutter_merchant/shared/persistent_storage/app_database.dart';
import 'package:mobile_flutter_merchant/shared/persistent_storage/persisted_preferences_proxy.dart';
import 'package:mobile_flutter_merchant/test_driver/mocks/languages.dart'
    as languages;
import 'package:mobile_flutter_merchant/test_driver/mocks/merchants.dart'
    as merchants;
import 'package:mobile_flutter_merchant/test_driver/mocks/setup.dart';
import 'package:sembast/sembast_io.dart';

class GrouponApp extends StatefulWidget {
  @override
  _GrouponAppState createState() => _GrouponAppState();
}

class _GrouponAppState extends State<GrouponApp> {
  bool _showSplash = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: FlutterLogo(
            size: 250,
            style: FlutterLogoStyle.stacked,
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: 600,
              margin: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: _showSplash
                  ? GestureDetector(
                      onTap: () => setState(() => _showSplash = false),
                      child: Container(
                        color: Colors.transparent,
                        child: Center(
                          child: Image(
                            image: const AssetImage('assets/image7.png'),
                            height: 100,
                          ),
                        ),
                      ),
                    )
                  : Setup.staging().copySelf(
                      (setup) {
                        return setup.copyWith(
                          locale: languages.english,
                          configuration: setup.configuration.copyWith(
                            merchant: merchants.asianTokyo,
                            country: merchants.us,
                          ),
                          featureFlags: setup.featureFlags.copyWith(
                            showCaseManagement: true,
                            showCloIntegration: false,
                            isFileManagementEnabled: true,
                            fileAttachmentMaxSize: 10,
                          ),
                          persistedPreferences: PersistedPreferencesProxy([
                            SettingsStore(SettingsDatabase(
                              databaseFactoryIo,
                              encrypt: false,
                            )),
                          ]),
                        );
                      },
                    ).build(),
            ),
          ),
        ),
      ],
    );
  }
}
