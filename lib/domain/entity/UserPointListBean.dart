class UserPointListBean {
  UserPoint data;
  int errorCode;
  String errorMsg;

  UserPointListBean({this.data, this.errorCode, this.errorMsg});

  UserPointListBean.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserPoint.fromJson(json['data']) : null;
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

class UserPoint {
  int curPage;
  List<UserPointCell> pointCell;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  UserPoint(
      {this.curPage,
        this.pointCell,
        this.offset,
        this.over,
        this.pageCount,
        this.size,
        this.total});

  UserPoint.fromJson(Map<String, dynamic> json) {
    curPage = json['curPage'];
    if (json['datas'] != null) {
      pointCell = new List<UserPointCell>();
      json['datas'].forEach((v) {
        pointCell.add(new UserPointCell.fromJson(v));
      });
    }
    offset = json['offset'];
    over = json['over'];
    pageCount = json['pageCount'];
    size = json['size'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curPage'] = this.curPage;
    if (this.pointCell != null) {
      data['datas'] = this.pointCell.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    data['over'] = this.over;
    data['pageCount'] = this.pageCount;
    data['size'] = this.size;
    data['total'] = this.total;
    return data;
  }
}

class UserPointCell {
  int coinCount;
  int date;
  String desc;
  int id;
  String reason;
  int type;
  int userId;
  String userName;

  UserPointCell(
      {this.coinCount,
        this.date,
        this.desc,
        this.id,
        this.reason,
        this.type,
        this.userId,
        this.userName});

  UserPointCell.fromJson(Map<String, dynamic> json) {
    coinCount = json['coinCount'];
    date = json['date'];
    desc = json['desc'];
    id = json['id'];
    reason = json['reason'];
    type = json['type'];
    userId = json['userId'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coinCount'] = this.coinCount;
    data['date'] = this.date;
    data['desc'] = this.desc;
    data['id'] = this.id;
    data['reason'] = this.reason;
    data['type'] = this.type;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    return data;
  }
}
