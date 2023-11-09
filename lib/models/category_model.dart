
class CategoryModel {
  String name;
  String iconPath;
  String radioUrl;
  String scheduleurl;

  CategoryModel(
      {required this.name,
      required this.iconPath,
      required this.radioUrl,
      required this.scheduleurl
      });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(CategoryModel(
      name: 'P1',
      iconPath:
          'https://static-cdn.sr.se/images/132/2186745_512_512.jpg?preset=api-default-square',
      radioUrl: 'https://sverigesradio.se/topsy/direkt/srapi/132.mp3',
      scheduleurl: 'https://api.sr.se/v2/scheduledepisodes?channelid=132&format=json&size=100'
    ));

    categories.add(CategoryModel(
      name: 'P2',
      iconPath:
          'https://static-cdn.sr.se/images/163/2186754_512_512.jpg?preset=api-default-square',
      radioUrl: 'https://sverigesradio.se/topsy/direkt/srapi/163.mp3',
      scheduleurl: 'https://api.sr.se/v2/scheduledepisodes?channelid=163&format=json&size=100'
    ));

    categories.add(CategoryModel(
      name: 'P3',
      iconPath:
          'https://static-cdn.sr.se/images/164/2186756_512_512.jpg?preset=api-default-square',
      radioUrl: 'https://sverigesradio.se/topsy/direkt/srapi/164.mp3',
      scheduleurl: 'https://api.sr.se/v2/scheduledepisodes?channelid=164&format=json&size=100'
    ));

    categories.add(CategoryModel(
      name: 'P4',
      iconPath:
          'https://static-cdn.sr.se/images/103/93751e41-25be-443e-aa50-3d65b67ae5ac.jpg?preset=api-default-square',
      radioUrl: 'https://sverigesradio.se/topsy/direkt/srapi/701.mp3',
      scheduleurl: 'https://api.sr.se/v2/scheduledepisodes?channelid=701&format=json&size=100'
    ));

    return categories;
  }
}
