class Citys {
  String cityId;
  String cityName;
  String cityImg;

  Citys({this.cityId, this.cityName, this.cityImg});

  factory Citys.fromJson(Map<String, dynamic> json) {
    return Citys(
      cityId: json['cityid'],
      cityName: json['cityName'],
      cityImg: json['cityImg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityid'] = this.cityId;
    data['cityname'] = this.cityName;
    data['cityimage'] = this.cityImg;
    return data;
  }
}
