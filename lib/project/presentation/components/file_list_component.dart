import 'package:any_load/core/utils/check_permissions.dart';
import 'package:any_load/project/presentation/components/title_list.dart';
import 'package:flutter/material.dart';

class FileListComponent extends StatefulWidget {
  const FileListComponent({Key? key}) : super(key: key);

  @override
  State<FileListComponent> createState() => _FileListComponentState();
}

class _FileListComponentState extends State<FileListComponent> {
  bool isPermission = false;
  var checkAllPermissions = CheckPermission();
  checkPermission() async {
    var permission = await checkAllPermissions.isStoragePermission();
    if (permission) {
      setState(() {
        isPermission = true;
      });
    }
  }

  @override
  void initState() {
    checkPermission();
    super.initState();
  }

  var dataList = [
    {
      "id": "3",
      "title": "file Video 2",
      "url": "https://download.samplelib.com/mp4/sample-20s.mp4"
    },
    {
      "id": "4",
      "title": "file Video 3",
      "url": "https://download.samplelib.com/mp4/sample-15s.mp4"
    },
    {
      "id": "5",
      "title": "file Video 4",
      "url": "https://download.samplelib.com/mp4/sample-10s.mp4"
    },
    {
      "id": "6",
      "title": "file PDF 6",
      "url":
          "https://www.iso.org/files/live/sites/isoorg/files/store/en/PUB100080.pdf"
    },
    {
      "id": "10",
      "title": "file PDF 7",
      "url": "https://www.tutorialspoint.com/javascript/javascript_tutorial.pdf"
    },
    {
      "id": "10",
      "title": "C++ Tutorial",
      "url": "https://www.tutorialspoint.com/cplusplus/cpp_tutorial.pdf"
    },
    {
      "id": "11",
      "title": "file PDF 9",
      "url":
          "https://www.iso.org/files/live/sites/isoorg/files/store/en/PUB100431.pdf"
    },
    {
      "id": "12",
      "title": "file PDF 10",
      "url": "https://www.tutorialspoint.com/java/java_tutorial.pdf"
    },
    {
      "id": "13",
      "title": "file PDF 12",
      "url": "https://www.irs.gov/pub/irs-pdf/p463.pdf"
    },
    {
      "id": "14",
      "title": "file PDF 11",
      "url": "https://www.tutorialspoint.com/css/css_tutorial.pdf"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return isPermission
        ? ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              var data = dataList[index];
              return TitleList(
                fileUrl: data['url']!,
                title: data['title']!,
              );
            },
          )
        : Center(
            child: TextButton(
              onPressed: () {
                checkPermission();
              },
              child: const Text('Permission issue'),
            ),
          );
  }
}
