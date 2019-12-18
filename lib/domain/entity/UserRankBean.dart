class UserRankBean {
  UserRankCell data;
  int errorCode;
  String errorMsg;

  UserRankBean({this.data, this.errorCode, this.errorMsg});

  UserRankBean.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserRankCell.fromJson(json['data']) : null;
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

class UserRankCell {
  int curPage;
  List<UserCellRankBean> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  UserRankCell(
      {this.curPage,
        this.datas,
        this.offset,
        this.over,
        this.pageCount,
        this.size,
        this.total});

  UserRankCell.fromJson(Map<String, dynamic> json) {
    curPage = json['curPage'];
    if (json['datas'] != null) {
      datas = new List<UserCellRankBean>();
      json['datas'].forEach((v) {
        datas.add(new UserCellRankBean.fromJson(v));
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
    if (this.datas != null) {
      data['datas'] = this.datas.map((v) => v.toJson()).toList();
    }
    data['offset'] = this.offset;
    data['over'] = this.over;
    data['pageCount'] = this.pageCount;
    data['size'] = this.size;
    data['total'] = this.total;
    return data;
  }
}

class UserCellRankBean {
  int coinCount;
  int level;
  int rank;
  int userId;
  String username;

  UserCellRankBean({this.coinCount, this.level, this.rank, this.userId, this.username});

  UserCellRankBean.fromJson(Map<String, dynamic> json) {
    coinCount = json['coinCount'];
    level = json['level'];
    rank = json['rank'];
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coinCount'] = this.coinCount;
    data['level'] = this.level;
    data['rank'] = this.rank;
    data['userId'] = this.userId;
    data['username'] = this.username;
    return data;
  }
}
