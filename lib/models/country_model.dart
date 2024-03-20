class Country {
  final String name;
  final String flag;

  Country(this.name, this.flag);

  static List<Country> getCountries() {
    return [
      Country('USA', 'usa'),
      Country('France', 'france'),
      Country('India', 'india'),
      Country('Germany', 'germany'),
      Country('Finland', 'finland'),
      Country('Hungary', 'hungary'),
      Country('Cameroon', 'cameroon'),
    ];
  }
}
