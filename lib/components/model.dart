class UrgentCasesModel {
  String id;
  String name;
  String image;
  String description;
  String currency;
  String amount;
  String raised;
  String country;
  String doc;

  UrgentCasesModel(
      {this.id,
        this.name,
        this.image,
        this.description,
        this.currency,
        this.amount,
        this.raised,
        this.country,this.doc});

  fromJson(Map<String, dynamic> json) {
    return UrgentCasesModel(
        id : json['id'],
        name : json['name'],
        image : json['image'],
    description : json['description'],
    currency : json['currency'],
    amount : json['amount'],
    raised : json['raised'],
    country : json['country'],
      doc:json["doc"]
    );
   
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['description'] = this.description;
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    data['raised'] = this.raised;
    data['country'] = this.country;
    data["doc"] = this.doc;
    return data;
  }
}

class CategoryModel {
  String id;
  String name;
  String image;

  CategoryModel({this.id, this.name, this.image});

  fromJson(Map<String, dynamic> json) {
    return CategoryModel(
        id : json['id'],
        name : json['name'],
        image : json['image']
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}


class VolunteerModel {
  String id;
  String name;
  String country;
  String number;
  String email;
  String password;
  String status;

  VolunteerModel({this.id, this.name, this.country,this.password,this.email,this.status,this.number});

  fromJson(Map<String, dynamic> json) {
    return VolunteerModel(
        id : json['id'],
        name : json['name'],
      country : json['country'],
      password : json['password'],
      email : json['email'],
      status : json['status'],
      number : json['number'],
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['password'] = this.password;
    data['email'] = this.email;
    data['status'] = this.status;
    data['number'] = this.number;
    data['country'] = this.country;
    return data;
  }
}
