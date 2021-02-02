import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import '../widgets/platform_widget.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: _buildList(context),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        Material(
          child: ListTile(
            title: Text('Dark Theme'),
            trailing: Switch.adaptive(
              value: false,
              onChanged: (value) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return defaultTargetPlatform == TargetPlatform.iOS
                        ? showCupertinoDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text('Coming Soon!'),
                                content:
                                    Text('This feature will be coming soon!'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          )
                        : AlertDialog(
                            title: Text('Coming Soon!'),
                            content: Text('This feature will be coming soon!'),
                            actions: [
                              FlatButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Ok'),
                              ),
                            ],
                          );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
