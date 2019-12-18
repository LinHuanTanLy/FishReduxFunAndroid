class WebKitCollectionBean {
  List<WebKitCellCollectionBean> data;
  int errorCode;
  String errorMsg;

  WebKitCollectionBean({this.data, this.errorCode, this.errorMsg});

  WebKitCollectionBean.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<WebKitCellCollectionBean>();
      json['data'].forEach((v) {
        data.add(new WebKitCellCollectionBean.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}

class WebKitCellCollectionBean {
  String desc;
  String icon;
  int id;
  String link;
  String name;
  int order;
  int userId;
  int visible;

  WebKitCellCollectionBean(
      {this.desc,
        this.icon,
        this.id,
        this.link,
        this.name,
        this.order,
        this.userId,
        this.visible});

  WebKitCellCollectionBean.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    icon = json['icon'];
    id = json['id'];
    link = json['link'];
    name = json['name'];
    order = json['order'];
    userId = json['userId'];
    visible = json['visible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['icon'] = this.icon;
    data['id'] = this.id;
    data['link'] = this.link;
    data['name'] = this.name;
    data['order'] = this.order;
    data['userId'] = this.userId;
    data['visible'] = this.visible;
    return data;
  }
}
