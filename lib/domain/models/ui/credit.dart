List<Credit> listCredit = [
  Credit(name: 'Coinmap', img: 'coinmap_logo.png', url: 'https://coinmap.org/'),
  Credit(
      name: 'Freepik', img: 'logo_freebi.png', url: 'https://www.freepik.com/'),
  Credit(
      name: 'Flaticon', img: 'flaticoin.jpg', url: 'https://www.flaticon.com/')
];

class Credit {
  String name;
  String url;
  String img;

  Credit({required this.name, required this.img, required this.url});
}
