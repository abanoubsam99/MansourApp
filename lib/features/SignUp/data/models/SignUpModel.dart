class SignUpModel {
  List<Errors> errors;
  bool iSAdmin;
  bool result;

  SignUpModel({this.errors, this.iSAdmin, this.result});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    if (json['Errors'] != null) {
      errors = new List<Errors>();
      json['Errors'].forEach((v) {
        errors.add(new Errors.fromJson(v));
      });
    }
    iSAdmin = json['ISAdmin'];
    result = json['Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errors != null) {
      data['Errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    data['ISAdmin'] = this.iSAdmin;
    data['Result'] = this.result;
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