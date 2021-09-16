
class LoginModel {
  bool result;
  bool isAdmin;
  String token;
  String id;
  String image;
  String name;
  String email;
  List<Errors> errors;

  LoginModel(
      {this.result,
        this.isAdmin,
        this.token,
        this.id,
        this.image,
        this.name,
        this.email,
        this.errors});

  LoginModel.fromJson(Map<String, dynamic> json) {
    result = json['Result'];
    isAdmin = json['isAdmin'];
    token = json['token'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    if (json['Errors'] != null) {
      errors = new List<Null>();
      json['Errors'].forEach((v) {
        errors.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Result'] = this.result;
    data['isAdmin'] = this.isAdmin;
    data['token'] = this.token;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    if (this.errors != null) {
      data['Errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String errorMSG;

  Errors({this.errorMSG});

  Errors.fromJson(Map<String, dynamic> json) {
    errorMSG = json['errorMSG'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorMSG'] = this.errorMSG;
    return data;
  }
}