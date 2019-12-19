import 'ArticleCollListBean.dart';

class AddArticleBean {
  ArticleCollCellBean data;
  int errorCode;
  String errorMsg;

  AddArticleBean({this.data, this.errorCode, this.errorMsg});

  AddArticleBean.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null
        ? new ArticleCollCellBean.fromJson(json['data'])
        : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}
