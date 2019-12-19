import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';

/// 网站编辑dialog
class WebOptionDialog extends StatefulWidget {
  final String name;
  final String link;
  final Color themeColor;

  final Function submitCallBack;

  WebOptionDialog(this.name, this.link, this.themeColor, this.submitCallBack);

  @override
  _WebOptionDialogState createState() => _WebOptionDialogState();
}

class _WebOptionDialogState extends State<WebOptionDialog> {
  TextEditingController editingControllerForName;
  TextEditingController editingControllerForLink;

  @override
  void initState() {
    editingControllerForLink = TextEditingController(text: widget?.link ?? "");
    editingControllerForName = TextEditingController(text: widget?.name ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
            color: ColorConf.ColorF6f6f6,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    'images/icon_close.png',
                    width: 30,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                child: Text(
                  '输入标题',
                  style: TextStyle(fontSize: 13, color: ColorConf.Color48586D),
                ),
                margin: const EdgeInsets.only(top: 20),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(hintText: widget?.name ?? ""),
                  controller: editingControllerForName,
                ),
              ),
              Container(
                child: Text(
                  '输入地址',
                  style: TextStyle(fontSize: 13, color: ColorConf.Color48586D),
                ),
                margin: const EdgeInsets.only(top: 20),
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(hintText: widget?.link ?? ""),
                  controller: editingControllerForLink,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: GestureDetector(
          child: Container(
            height: 50,
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            alignment: Alignment.center,
            child: Text(
              '确定',
              style: TextStyle(fontSize: 14, color: ColorConf.ColorFFFFFF),
            ),
            decoration: BoxDecoration(
                color: widget?.themeColor,
                borderRadius: BorderRadius.circular(8)),
          ),
          onTap: () {
            String newName = editingControllerForName?.text ?? "";
            String newLink = editingControllerForLink?.text ?? "";
            if (newName.isEmpty == true && newLink.isEmpty == true) {
              Navigator.pop(context);
            } else {
              if (newName.isEmpty == true) {
                newName = widget?.name;
              }
              if (newLink.isEmpty == true) {
                newLink = widget?.link;
              }
              widget?.submitCallBack(newName, newLink);
              Navigator.pop(context);
            }
          },
        ),
        color: Colors.white,
      ),
    );
  }
}
