class WeatherEntity {
  int id;
  String main;
  String description;
  String icon;

  WeatherEntity(
      {required this.id,
      required this.main,
      required this.description,
      required this.icon});
}
