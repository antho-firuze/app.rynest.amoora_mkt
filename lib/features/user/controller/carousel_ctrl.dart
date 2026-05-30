enum CarouselItems {
  image0('', 'assets/images/background-01.jpg', '', '', null),
  image1('', 'assets/images/background-02.jpg', '', '', null),
  image2('', 'assets/images/background-03.jpg', '', '', null);

  const CarouselItems(this.url, this.image, this.title, this.subtitle, this.callback);
  final String url;
  final String image;
  final String title;
  final String subtitle;
  final Function()? callback;
}