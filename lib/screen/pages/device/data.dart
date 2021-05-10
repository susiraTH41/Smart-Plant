class Page {
  final int position;
  final String name;
  final String des;
  Page(
    this.position, {
    this.name,
    this.des,
  });
}

List<Page> planets = [
  Page(
    1,
    name: 'Doors',
    des: 'Open / Close',
  ),
  Page(
    2,
    name: 'Lights',
    des: 'Trun on / Trun off',
  ),
  Page(
    3,
    name: 'CCTV',
    des: 'Monitor cameras',
  ),
  Page(
    4,
    name: 'Sensor',
    des: 'Check pollutions',
  ),
];
