import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:read_write_files/file_helper.dart';
import 'package:path/path.dart';
import 'file_dialog.dart';

class MyHomePage extends StatelessWidget {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  bool get _isValid => _titleController.text.isNotEmpty;

  void _createNewFile() {
    _titleController.clear();
    _contentController.clear();
  }

  void _saveFile(BuildContext context) async {
    if (_isValid) {
      final filePath = await FileHelper.getFilePath(_titleController.text);
      FileHelper.writeFile(filePath, _contentController.text);
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('File Saved'),
            actions: [
              CupertinoDialogAction(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(
              'File Not Created',
              style: TextStyle(
                color: CupertinoColors.systemRed,
              ),
            ),
            content: Text('File name must not be empty!'),
            actions: [
              CupertinoDialogAction(
                child: Text('Ok'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _getFilesInDirectory(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();

    final dir = Directory(directory.path);
    final files =
        dir.listSync().toList().where((file) => file.path.contains('txt'));

    final FileSystemEntity selectedFile = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => FileDialog(
          files: files.toList(),
        ),
        fullscreenDialog: true,
      ),
    );

    if (selectedFile != null) {
      _openFile(selectedFile.path);
    }
  }

  void _openFile(String filePath) async {
    final content = await FileHelper.readFile(filePath);
    _contentController.text = content;
    _titleController.text = split(filePath).last.split('.').first;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'My Read Write Files',
        ),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CupertinoButton(
                  child: Text('New File'),
                  onPressed: _createNewFile,
                ),
              ),
              Expanded(
                child: CupertinoButton(
                  child: Text('Open File'),
                  onPressed: () {
                    _getFilesInDirectory(context);
                  },
                ),
              ),
              Expanded(
                child: CupertinoButton(
                  child: Text('Save File'),
                  onPressed: () {
                    _saveFile(context);
                  },
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: CupertinoTextField(
                    placeholder: 'File Name',
                    controller: _titleController,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16.0),
              child: CupertinoTextField(
                placeholder: 'Write your notes here...',
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: _contentController,
                textAlignVertical: TextAlignVertical.top,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
