

class UserModel {
  String? image;
  String? profileImage;
  String? name;
  String? username;

  UserModel({this.image, this.profileImage, this.name, this.username});

  UserModel.fromJson(Map<dynamic, dynamic> json) {
    image = json['image'];
    profileImage = json['profile_image'];
    name = json['name'];
    username = json['username'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['profile_image'] = this.profileImage;
    data['name'] = this.name;
    data['username'] = this.username;
    return data;
  }
}
