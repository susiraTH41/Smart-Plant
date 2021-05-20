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
    name: 'Devices',
    des: 'Open / Close',
  ),
  Page(
    2,
    name: 'CCTV',
    des: 'Monitor cameras',
  ),
  Page(
    3,
    name: 'Sensor',
    des: 'Check pollutions',
  ),
];
