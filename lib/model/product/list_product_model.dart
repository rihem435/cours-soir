class ListProductModel {
  String? message;
  List<AllData>? allData;
  int? statusCode;

  ListProductModel({this.message, this.allData, this.statusCode});

  ListProductModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['AllData'] != null) {
      allData = <AllData>[];
      json['AllData'].forEach((v) {
        allData!.add(new AllData.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.allData != null) {
      data['AllData'] = this.allData!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = this.statusCode;
    return data;
  }
}

class AllData {
  String? sId;
  String? ref;
  int? price;
  String? description;
  int? qnt;
  List<String>? image;
  int? iV;

  AllData(
      {this.sId,
      this.ref,
      this.price,
      this.description,
      this.qnt,
      this.image,
      this.iV});

  AllData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    ref = json['Ref'];
    price = json['Price'];
    description = json['Description'];
    qnt = json['Qnt'];
    image = json['image'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Ref'] = this.ref;
    data['Price'] = this.price;
    data['Description'] = this.description;
    data['Qnt'] = this.qnt;
    data['image'] = this.image;
    data['__v'] = this.iV;
    return data;
  }
}
