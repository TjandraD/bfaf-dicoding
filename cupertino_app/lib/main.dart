import 'package:flutter/cupertino.dart';
import 'category_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemOrange,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news),
            label: 'Feeds',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return FeedsPage();
          case 1:
            return SearchPage();
          case 2:
            return SettingsPage();
          default:
            return Center(
              child: Text('Page not found!'),
            );
        }
      },
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Search Page'),
      ),
      child: Center(
        child: Text(
          'Search Page',
          style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
        ),
      ),
    );
  }
}

class FeedsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Feeds Page'),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Feeds Page',
              style:
                  CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
            ),
            SizedBox(
              height: 8,
            ),
            CupertinoButton.filled(
              child: Text('Select Category'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoActionSheet(
                      title: Text('Select Categories'),
                      actions: [
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => CategoryPage(
                                    selectedCategory: 'Technology'),
                              ),
                            );
                          },
                          child: Text('Technology'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    CategoryPage(selectedCategory: 'Business'),
                              ),
                            );
                          },
                          child: Text('Business'),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) =>
                                    CategoryPage(selectedCategory: 'Sport'),
                              ),
                            );
                          },
                          child: Text('Sport'),
                        ),
                      ],
                      cancelButton: CupertinoActionSheetAction(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Close'),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings Page'),
      ),
      child: Center(
        child: CupertinoButton(
          child: Text('Log Out'),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text('Are you sure you want to log out?'),
                  actions: [
                    CupertinoDialogAction(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
