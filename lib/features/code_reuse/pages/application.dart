import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_flutter_merchant/test_driver/mocks/merchants.dart'
    as merchants;
import 'package:mobile_flutter_merchant/test_driver/mocks/setup.dart';

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
        Expanded(
          child: FlutterLogo(
            size: 250,
            style: FlutterLogoStyle.stacked,
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: 600,
              margin: EdgeInsets.symmetric(vertical: 18),
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
                            image: AssetImage('assets/image7.png'),
                            height: 100.0,
                          ),
                        ),
                      ),
                    )
                  : Setup.staging().copySelf(
                      (setup) {
                        return setup.copyWith(
                          configuration: setup.configuration.copyWith(
                            merchant: merchants.asianTokyo,
                          ),
                          preferences: setup.preferences.copyWith(
                            wasTutorialShown: true,
                            wasCampaignRedirectionShown: true,
                          ),
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
