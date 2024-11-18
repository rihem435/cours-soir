class ListCategoryModel {
  String? message;
  List<AllCategories>? allCategories;
  int? statusCode;

  ListCategoryModel({this.message, this.allCategories, this.statusCode});

  ListCategoryModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['AllCategories'] != null) {
      allCategories = <AllCategories>[];
      json['AllCategories'].forEach((v) {
        allCategories!.add(new AllCategories.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.allCategories != null) {
      data['AllCategories'] =
          this.allCategories!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class AllCategories {
  String? sId;
  String? name;
  String? discription;
  int? iV;

  AllCategories({this.sId, this.name, this.discription, this.iV});

  AllCategories.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    discription = json['discription'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['discription'] = this.discription;
    data['__v'] = this.iV;
    return data;
  }
}
