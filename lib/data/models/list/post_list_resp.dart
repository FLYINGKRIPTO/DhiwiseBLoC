class PostListResp {
  String? status;
  String? message;
  dynamic data;

  PostListResp({this.status, this.message, this.data});

  PostListResp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.status != null) {
      data['status'] = this.status;
    }
    if (this.message != null) {
      data['message'] = this.message;
    }
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}
