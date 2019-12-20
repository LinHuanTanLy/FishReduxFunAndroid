class TodoListBean {
  TodoListCellBean data;
  int errorCode;
  String errorMsg;

  TodoListBean({this.data, this.errorCode, this.errorMsg});

  TodoListBean.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new TodoListCellBean.fromJson(json['data']) : null;
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

class TodoListCellBean {
  int curPage;
  List<TodoCellBean> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;

  TodoListCellBean(
      {this.curPage,
      this.datas,
      this.offset,
      this.over,
      this.pageCount,
      this.size,
      this.total});

  TodoListCellBean.fromJson(Map<String, dynamic> json) {
    curPage = json['curPage'];
    if (json['datas'] != null) {
      datas = new List<TodoCellBean>();
      json['datas'].forEach((v) {
        datas.add(new TodoCellBean.fromJson(v));
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

class TodoCellBean {
  Null completeDate;
  String completeDateStr;
  String content;
  int date;
  String dateStr;
  int id;
  int priority;
  int status;
  String title;
  int type;
  int userId;

  TodoCellBean(
      {this.completeDate,
      this.completeDateStr,
      this.content,
      this.date,
      this.dateStr,
      this.id,
      this.priority,
      this.status,
      this.title,
      this.type,
      this.userId});

  TodoCellBean.fromJson(Map<String, dynamic> json) {
    completeDate = json['completeDate'];
    completeDateStr = json['completeDateStr'];
    content = json['content'];
    date = json['date'];
    dateStr = json['dateStr'];
    id = json['id'];
    priority = json['priority'];
    status = json['status'];
    title = json['title'];
    type = json['type'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['completeDate'] = this.completeDate;
    data['completeDateStr'] = this.completeDateStr;
    data['content'] = this.content;
    data['date'] = this.date;
    data['dateStr'] = this.dateStr;
    data['id'] = this.id;
    data['priority'] = this.priority;
    data['status'] = this.status;
    data['title'] = this.title;
    data['type'] = this.type;
    data['userId'] = this.userId;
    return data;
  }
}
