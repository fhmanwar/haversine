class Stores {
  int code;
  List<DataStores> data;
  Stores({
      this.code,
      this.data,
  });
  factory Stores.fromJson(Map<String, dynamic> json) => Stores(
      code: json["code"],
      data: List<DataStores>.from(json["msg"].map((x) => DataStores.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
      "code": code,
      "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}
class DataStores {
  int storeid;
  String name;
  String address;
  String latitude;
  String longitude;
  int cid;
  int status;
  String images;
  String description;
  String phone;
  String open;
  String closed;
  String cityid;
  String tags;

  DataStores({
    this.storeid,
      this.name,
      this.address,
      this.latitude,
      this.longitude,
      this.cid,
      this.status,
      this.images,
      this.description,
      this.phone,
      this.open,
      this.closed,
      this.cityid,
      this.tags
    });

  factory DataStores.fromJson(Map<String, dynamic> json) {
    return DataStores(
      storeid: json['storeid'],
      name: json['name'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      cid: json['cid'],
      status: json['status'],
      images: json['images'],
      description: json['description'],
      phone: json['phone'],
      open: json['open'],
      closed: json['closed'],
      cityid: json['cityid'],
      tags: json['tags'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['storeid'] = this.storeid;
    data['name'] = this.name;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['cid'] = this.cid;
    data['status'] = this.status;
    data['images'] = this.images;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['open'] = this.open;
    data['closed'] = this.closed;
    data['cityid'] = this.cityid;
    data['tags'] = this.tags;
    return data;
  }
}
