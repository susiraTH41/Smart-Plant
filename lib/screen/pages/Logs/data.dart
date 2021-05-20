class Checklog {
  final int position;
  final String name;
  final String des;
  Checklog(
    this.position, {
    this.name,
    this.des,
  });
}

List<Checklog> dataLog = [
  Checklog(
    1,
    name: 'Log',
    des: 'For user',
  ),
  Checklog(
    2,
    name: 'Log',
    des: 'For admin',
  ),
];
