class ConstApp {
  static String workPath = "lib/common/assets/img/Work.png";
  static String allPath = "lib/common/assets/img/All.png";
  static String bookPath = "lib/common/assets/img/Book.png";
  static String headphonesPath = "lib/common/assets/img/Headphones.png";
  static String airplanePath = "lib/common/assets/img/Airplane.png";
  static String homePath = "lib/common/assets/img/Home.png";
  static List<Map<String, String>> opcoes = [
    {'nome': 'All', 'img': ConstApp.allPath},
    {'nome': 'Trabalho', 'img': ConstApp.workPath},
    {'nome': 'Musica', 'img': ConstApp.headphonesPath},
    {'nome': 'Travel', 'img': ConstApp.airplanePath},
    {'nome': 'Escola', 'img': ConstApp.bookPath},
    {'nome': 'casa', 'img': ConstApp.homePath}
  ];
}
