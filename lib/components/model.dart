class UrgentCasesModel {
  String id;
  String name;
  String image;
  String description;
  String currency;
  String amount;
  String raised;
  String country;

  UrgentCasesModel(
      {this.id,
        this.name,
        this.image,
        this.description,
        this.currency,
        this.amount,
        this.raised,
        this.country});

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

