import 'package:flutter/material.dart';

class OpenDialog extends StatefulWidget {
  const OpenDialog({super.key});

  @override
  State<OpenDialog> createState() => _DialogState();
}

class _DialogState extends State<OpenDialog> {
  String dialogContent = '모달입니다.';

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('알림'),
            content: Text(dialogContent),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // 다이얼로그 닫기
                  },
                  child: const Text('닫기'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        child: const Icon(Icons.access_alarm),
      ),
    );
  }
}
