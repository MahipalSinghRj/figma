

class StaggeredModel {
  String? image;

  StaggeredModel({this.image});

  StaggeredModel.fromJson(Map<dynamic, dynamic> json) {
    image = json['image'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}
