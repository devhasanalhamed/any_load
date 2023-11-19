import 'dart:developer';
import 'dart:io';

import 'package:any_load/core/utils/directory_path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path/path.dart' as path;

class TitleList extends StatefulWidget {
  const TitleList({Key? key, required this.fileUrl, required this.title})
      : super(key: key);
  final String fileUrl;
  final String title;

  @override
  State<TitleList> createState() => _TitleListState();
}

class _TitleListState extends State<TitleList> {
  bool downloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = '';
  late String filePath;
  late CancelToken cancelToken;

  var getPathFile = DirectoryPath();

  startDownload() async {
    cancelToken = CancelToken();
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';

    try {
      log(widget.fileUrl);
      await Dio().download(
        widget.fileUrl,
        filePath,
        onReceiveProgress: (count, total) {
          setState(() {
            downloading = true;
            progress = count / total;
          });
        },
        cancelToken: cancelToken,
      );
      setState(() {
        downloading = false;
        fileExists = true;
      });
      log('no error');
    } catch (error) {
      setState(() {
        log('error $error');
        downloading = false;
      });
    }
  }

  cancelDownload() async {
    cancelToken.cancel();
    setState(() {
      downloading = false;
    });
  }

  checkFile() async {
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    bool fileExistCheck = await File(filePath).exists();
    setState(() {
      fileExists = fileExistCheck;
    });
  }

  @override
  void initState() {
    fileName = path.basename(widget.fileUrl);
    checkFile();
    super.initState();
  }

  openFile() {
    OpenFile.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade100,
      elevation: 10.0,
      child: ListTile(
        title: Text(widget.title),
        leading: IconButton(
          onPressed: () {
            fileExists && downloading == false
                ? File(filePath).delete().then((value) {
                    debugPrint('deleted');
                    checkFile();
                    setState(() {});
                  })
                : cancelDownload();
          },
          icon: fileExists && downloading == false
              ? const Icon(Icons.delete)
              : const Icon(Icons.close),
        ),
        trailing: IconButton(
            onPressed: () {
              fileExists && downloading == false ? openFile() : startDownload();
            },
            icon: fileExists
                ? const Icon(Icons.save)
                : downloading
                    ? Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: progress,
                            strokeWidth: 3,
                            backgroundColor: Colors.grey,
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.blue),
                          ),
                          Text(
                            (progress * 100).toStringAsFixed(2),
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ],
                      )
                    : const Icon(Icons.download)),
      ),
    );
  }
}
