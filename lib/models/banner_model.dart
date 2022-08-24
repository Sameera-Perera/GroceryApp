import 'dart:convert';

// List<BannerModel> bannerModelListFromJson(String val) {
//   // print(json.decode(val)['data']);
//   return List<BannerModel>.from(json.decode(val)['data'].map((banner) {
//     // print(banner);
//     // for(var i = 0; i< )
//     BannerModel.fromJson(banner);
//   }).toList());
// }

List<BannerModel> bannerModelListFromJson(String val) =>
    List<BannerModel>.from(json
        .decode(val)['data']
        .map((banner) => BannerModel.bannerFromJson(banner)));

class BannerModel {
  final String id;
  final String image;

  BannerModel({
    required this.id,
    required this.image,
  });

  factory BannerModel.bannerFromJson(Map<String, dynamic> data) {
    // print(data);
    // data = new BannerModel();

    // print(BannerModel(id: data['id'], image: data['imgs']).id);
    // data = new List<BannerModel>();
    return BannerModel(id: data['id'], image: data['imgs']);
  }
}
