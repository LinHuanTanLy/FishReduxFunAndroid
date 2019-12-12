class UserPointBean {
  Data data;
  int errorCode;
  String errorMsg;

  UserPointBean({this.data, this.errorCode, this.errorMsg});

  UserPointBean.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
  int coinCount;
  int rank;
  int userId;
  String username;

  Data({this.coinCount, this.rank, this.userId, this.username});

  Data.fromJson(Map<String, dynamic> json) {
    coinCount = json['coinCount'];
    rank = json['rank'];
    userId = json['userId'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coinCount'] = this.coinCount;
    data['rank'] = this.rank;
    data['userId'] = this.userId;
    data['username'] = this.username;
    return data;
  }
}
